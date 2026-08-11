[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateScript({ Test-Path -LiteralPath $_ -PathType Leaf })]
    [string] $ConfigPath,

    [Parameter(Mandatory = $true)]
    [string] $OutputDirectory,

    [switch] $FailOnError
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Get-OptionalProperty {
    param(
        [Parameter(Mandatory = $true)] [object] $InputObject,
        [Parameter(Mandatory = $true)] [string] $Name,
        [object] $Default = $null
    )

    $property = $InputObject.PSObject.Properties[$Name]
    if ($null -eq $property) {
        return $Default
    }
    return $property.Value
}

function Expand-LocalPath {
    param([Parameter(Mandatory = $true)] [string] $Path)

    return [Environment]::ExpandEnvironmentVariables($Path)
}

function Get-FirstSummaryNumber {
    param([AllowNull()] [string] $Line)

    if ([string]::IsNullOrWhiteSpace($Line)) {
        return [int64] 0
    }
    $matches = [regex]::Matches($Line, "\d+")
    if ($matches.Count -eq 0) {
        return [int64] 0
    }
    return [int64] $matches[0].Value
}

function Get-ReparseTarget {
    param([Parameter(Mandatory = $true)] [System.IO.FileSystemInfo] $Item)

    $targetProperty = $Item.PSObject.Properties["Target"]
    if ($null -eq $targetProperty -or $null -eq $targetProperty.Value) {
        return $null
    }
    return (@($targetProperty.Value) -join ";")
}

function Measure-TreeLogical {
    param([Parameter(Mandatory = $true)] [string] $Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        return [pscustomobject]@{
            path               = $Path
            kind               = "tree"
            status             = "MISSING"
            reparse_point      = $false
            reparse_target     = $null
            directory_count    = 0
            file_count         = 0
            logical_bytes      = 0
            logical_gib        = 0
            robocopy_exit_code = $null
            errors             = @()
        }
    }

    $item = Get-Item -LiteralPath $Path -Force
    $isReparse = [bool] ($item.Attributes -band [IO.FileAttributes]::ReparsePoint)
    if ($isReparse) {
        return [pscustomobject]@{
            path               = $Path
            kind               = "tree"
            status             = "REPARSE_SKIPPED"
            reparse_point      = $true
            reparse_target     = Get-ReparseTarget -Item $item
            directory_count    = 0
            file_count         = 0
            logical_bytes      = 0
            logical_gib        = 0
            robocopy_exit_code = $null
            errors             = @()
        }
    }

    if (-not $item.PSIsContainer) {
        throw "Measure-TreeLogical attend un dossier : $Path"
    }

    $sink = Join-Path ([IO.Path]::GetTempPath()) "fireviewer-storage-audit-list-only-sink"
    $rawOutput = @(
        & robocopy.exe $Path $sink /L /S /XJ /BYTES /NFL /NDL /NJH /R:0 /W:0 /NP 2>&1
    )
    $robocopyExitCode = $LASTEXITCODE

    $directoryLine = @(
        $rawOutput | Where-Object { $_ -match "^\s*(Dirs|R.p)\s" } | Select-Object -Last 1
    )
    $fileLine = @(
        $rawOutput | Where-Object { $_ -match "^\s*(Files|Fichiers)\s" } | Select-Object -Last 1
    )
    $byteLine = @(
        $rawOutput | Where-Object { $_ -match "^\s*(Bytes|Octets)\s" } | Select-Object -Last 1
    )
    $errorLines = @(
        $rawOutput |
            Where-Object { $_ -match "(?i)error|erreur|denied|refus" } |
            ForEach-Object { $_.ToString().Trim() }
    )

    $directoryCount = Get-FirstSummaryNumber -Line ($directoryLine -join "")
    $fileCount = Get-FirstSummaryNumber -Line ($fileLine -join "")
    $logicalBytes = Get-FirstSummaryNumber -Line ($byteLine -join "")
    $status = if ($robocopyExitCode -le 7) { "OK" } else { "PARTIAL_ERROR" }

    return [pscustomobject]@{
        path               = $Path
        kind               = "tree"
        status             = $status
        reparse_point      = $false
        reparse_target     = $null
        directory_count    = $directoryCount
        file_count         = $fileCount
        logical_bytes      = $logicalBytes
        logical_gib        = [math]::Round($logicalBytes / 1GB, 3)
        robocopy_exit_code = $robocopyExitCode
        errors             = $errorLines
    }
}

function Measure-SingleFile {
    param([Parameter(Mandatory = $true)] [string] $Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        return [pscustomobject]@{
            path               = $Path
            kind               = "file"
            status             = "MISSING"
            reparse_point      = $false
            reparse_target     = $null
            directory_count    = 0
            file_count         = 0
            logical_bytes      = 0
            logical_gib        = 0
            robocopy_exit_code = $null
            errors             = @()
        }
    }

    $item = Get-Item -LiteralPath $Path -Force
    $isReparse = [bool] ($item.Attributes -band [IO.FileAttributes]::ReparsePoint)
    $logicalBytes = if ($item.PSIsContainer) { 0 } else { [int64] $item.Length }
    $status = if ($item.PSIsContainer) { "EXPECTED_FILE" } elseif ($isReparse) { "REPARSE_SKIPPED" } else { "OK" }

    return [pscustomobject]@{
        path               = $Path
        kind               = "file"
        status             = $status
        reparse_point      = $isReparse
        reparse_target     = if ($isReparse) { Get-ReparseTarget -Item $item } else { $null }
        directory_count    = 0
        file_count         = if ($item.PSIsContainer) { 0 } else { 1 }
        logical_bytes      = $logicalBytes
        logical_gib        = [math]::Round($logicalBytes / 1GB, 3)
        robocopy_exit_code = $null
        errors             = @()
    }
}

function Measure-MatchingChildren {
    param(
        [Parameter(Mandatory = $true)] [string] $Path,
        [Parameter(Mandatory = $true)] [string] $Pattern
    )

    if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
        return @()
    }

    $rootItem = Get-Item -LiteralPath $Path -Force
    if ($rootItem.Attributes -band [IO.FileAttributes]::ReparsePoint) {
        return @([pscustomobject]@{
            path               = $Path
            kind               = "tree"
            status             = "REPARSE_SKIPPED"
            reparse_point      = $true
            reparse_target     = Get-ReparseTarget -Item $rootItem
            directory_count    = 0
            file_count         = 0
            logical_bytes      = 0
            logical_gib        = 0
            robocopy_exit_code = $null
            errors             = @()
        })
    }

    $children = @(
        Get-ChildItem -LiteralPath $Path -Directory -Force -ErrorAction SilentlyContinue |
            Where-Object {
                $_.Name -match $Pattern -and
                -not ($_.Attributes -band [IO.FileAttributes]::ReparsePoint)
            } |
            Sort-Object FullName
    )
    $measurements = @()
    foreach ($child in $children) {
        $measurements += Measure-TreeLogical -Path $child.FullName
    }
    return $measurements
}

function Measure-MatchingFilesRecursive {
    param(
        [Parameter(Mandatory = $true)] [string] $Path,
        [Parameter(Mandatory = $true)] [string] $Pattern
    )

    if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
        return @()
    }

    $rootItem = Get-Item -LiteralPath $Path -Force
    if ($rootItem.Attributes -band [IO.FileAttributes]::ReparsePoint) {
        return @([pscustomobject]@{
            path               = $Path
            kind               = "tree"
            status             = "REPARSE_SKIPPED"
            reparse_point      = $true
            reparse_target     = Get-ReparseTarget -Item $rootItem
            directory_count    = 0
            file_count         = 0
            logical_bytes      = 0
            logical_gib        = 0
            robocopy_exit_code = $null
            errors             = @()
        })
    }

    $files = @(
        Get-ChildItem -LiteralPath $Path -File -Recurse -Force -ErrorAction SilentlyContinue |
            Where-Object { $_.Name -match $Pattern } |
            Sort-Object FullName
    )
    $measurements = @()
    foreach ($file in $files) {
        $measurements += Measure-SingleFile -Path $file.FullName
    }
    return $measurements
}

function Convert-MarkdownCell {
    param([AllowNull()] [object] $Value)

    if ($null -eq $Value) {
        return ""
    }
    return $Value.ToString().Replace("|", "\|").Replace("`r", " ").Replace("`n", " ")
}

$resolvedConfigPath = (Resolve-Path -LiteralPath $ConfigPath).Path
$config = Get-Content -LiteralPath $resolvedConfigPath -Raw | ConvertFrom-Json
$schemaVersion = [int] (Get-OptionalProperty -InputObject $config -Name "schema_version" -Default 0)
if ($schemaVersion -ne 1) {
    throw "Version de configuration non prise en charge : $schemaVersion"
}

$minimumGiB = [double] (Get-OptionalProperty -InputObject $config.free_space -Name "minimum_gib" -Default 100)
$minimumPercent = [double] (Get-OptionalProperty -InputObject $config.free_space -Name "minimum_percent" -Default 15)

$volumeReports = @()
foreach ($drive in @(
    Get-PSDrive -PSProvider FileSystem |
        Where-Object { $_.Name -match "^[A-Za-z]$" -and $null -ne $_.Free -and $null -ne $_.Used }
)) {
    $capacity = [double] $drive.Free + [double] $drive.Used
    $minimumBytes = [math]::Max($minimumGiB * 1GB, $capacity * $minimumPercent / 100)
    $volumeReports += [pscustomobject]@{
        name                 = $drive.Name
        root                 = $drive.Root
        capacity_gib         = [math]::Round($capacity / 1GB, 2)
        used_gib             = [math]::Round([double] $drive.Used / 1GB, 2)
        free_gib             = [math]::Round([double] $drive.Free / 1GB, 2)
        minimum_free_gib     = [math]::Round($minimumBytes / 1GB, 2)
        free_space_gate_pass = [bool] ([double] $drive.Free -ge $minimumBytes)
    }
}

$entryReports = @()
foreach ($entry in @($config.entries)) {
    $entryId = [string] (Get-OptionalProperty -InputObject $entry -Name "id" -Default "")
    $entryClass = [string] (Get-OptionalProperty -InputObject $entry -Name "class" -Default "UNCLASSIFIED")
    $kind = [string] (Get-OptionalProperty -InputObject $entry -Name "kind" -Default "tree")
    $configuredPath = [string] (Get-OptionalProperty -InputObject $entry -Name "path" -Default "")
    $path = Expand-LocalPath -Path $configuredPath
    $pattern = [string] (Get-OptionalProperty -InputObject $entry -Name "pattern" -Default ".+")
    $required = [bool] (Get-OptionalProperty -InputObject $entry -Name "required" -Default $false)
    $protected = [bool] (Get-OptionalProperty -InputObject $entry -Name "protected" -Default $false)
    $note = [string] (Get-OptionalProperty -InputObject $entry -Name "note" -Default "")

    $children = @()
    $measurement = $null
    switch ($kind) {
        "tree" {
            $measurement = Measure-TreeLogical -Path $path
        }
        "file" {
            $measurement = Measure-SingleFile -Path $path
        }
        "children_matching" {
            $children = @(Measure-MatchingChildren -Path $path -Pattern $pattern)
        }
        "files_matching_recursive" {
            $children = @(Measure-MatchingFilesRecursive -Path $path -Pattern $pattern)
        }
        default {
            throw "Type de mesure inconnu pour $entryId : $kind"
        }
    }

    if ($null -ne $measurement) {
        $status = $measurement.status
        $logicalBytes = [int64] $measurement.logical_bytes
        $directoryCount = [int64] $measurement.directory_count
        $fileCount = [int64] $measurement.file_count
    }
    else {
        $logicalBytes = [int64] (($children | Measure-Object logical_bytes -Sum).Sum)
        $directoryCount = [int64] (($children | Measure-Object directory_count -Sum).Sum)
        $fileCount = [int64] (($children | Measure-Object file_count -Sum).Sum)
        $childErrors = @($children | Where-Object { $_.status -notin @("OK", "REPARSE_SKIPPED") })
        if (-not (Test-Path -LiteralPath $path)) {
            $status = "MISSING"
        }
        elseif ($childErrors.Count -gt 0) {
            $status = "PARTIAL_ERROR"
        }
        else {
            $status = "OK"
        }
    }

    if ($required -and $status -eq "MISSING") {
        $status = "REQUIRED_MISSING"
    }

    $entryReports += [pscustomobject]@{
        id              = $entryId
        class           = $entryClass
        kind            = $kind
        path            = $path
        required        = $required
        protected       = $protected
        note            = $note
        status          = $status
        directory_count = $directoryCount
        file_count      = $fileCount
        logical_bytes   = $logicalBytes
        logical_gib     = [math]::Round($logicalBytes / 1GB, 3)
        measurement     = $measurement
        children        = $children
    }
}

$report = [ordered]@{
    schema_version = 1
    generated_at   = (Get-Date).ToString("o")
    config_path    = $resolvedConfigPath
    measurement    = "logical bytes; reparse points skipped; hardlinks may appear more than once"
    volumes        = $volumeReports
    entries        = $entryReports
}

New-Item -ItemType Directory -Path $OutputDirectory -Force | Out-Null
$resolvedOutputDirectory = (Resolve-Path -LiteralPath $OutputDirectory).Path
$jsonPath = Join-Path $resolvedOutputDirectory "fireviewer-storage-inventory.json"
$markdownPath = Join-Path $resolvedOutputDirectory "fireviewer-storage-inventory.md"

$report | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $jsonPath -Encoding utf8

$markdown = [System.Collections.Generic.List[string]]::new()
$markdown.Add("# Inventaire de stockage FireViewer")
$markdown.Add("")
$markdown.Add(("Généré : {0}" -f $report.generated_at))
$markdown.Add("")
$markdown.Add("> Mesure logique en lecture seule. Les reparse points ne sont pas suivis et les hardlinks peuvent être comptés plusieurs fois.")
$markdown.Add("")
$markdown.Add("## Volumes")
$markdown.Add("")
$markdown.Add("| Volume | Capacité Gio | Utilisé Gio | Libre Gio | Seuil Gio | Gate |")
$markdown.Add("| --- | ---: | ---: | ---: | ---: | --- |")
foreach ($volume in $volumeReports) {
    $gate = if ($volume.free_space_gate_pass) { "PASS" } else { "FAIL" }
    $markdown.Add(("| {0} | {1} | {2} | {3} | {4} | {5} |" -f
        (Convert-MarkdownCell $volume.name),
        $volume.capacity_gib,
        $volume.used_gib,
        $volume.free_gib,
        $volume.minimum_free_gib,
        $gate))
}
$markdown.Add("")
$markdown.Add("## Racines déclarées")
$markdown.Add("")
$markdown.Add("| ID | Classe | Statut | Gio logiques | Fichiers | Protégé | Chemin |")
$markdown.Add("| --- | --- | --- | ---: | ---: | --- | --- |")
foreach ($entry in $entryReports) {
    $markdown.Add(("| {0} | {1} | {2} | {3} | {4} | {5} | {6} |" -f
        (Convert-MarkdownCell $entry.id),
        (Convert-MarkdownCell $entry.class),
        (Convert-MarkdownCell $entry.status),
        $entry.logical_gib,
        $entry.file_count,
        $entry.protected,
        (Convert-MarkdownCell $entry.path)))
}
$markdown.Add("")
$markdown.Add("Les détails par enfant, erreurs Robocopy et cibles de reparse point sont conservés dans le rapport JSON.")

$markdown | Set-Content -LiteralPath $markdownPath -Encoding utf8

$hasBlockingError = @(
    $entryReports | Where-Object { $_.status -in @("REQUIRED_MISSING", "PARTIAL_ERROR") }
).Count -gt 0

Write-Output ("INVENTORY_JSON={0}" -f $jsonPath)
Write-Output ("INVENTORY_MARKDOWN={0}" -f $markdownPath)
Write-Output ("ENTRY_COUNT={0}" -f $entryReports.Count)
Write-Output ("HAS_BLOCKING_ERROR={0}" -f $hasBlockingError)

if ($FailOnError -and $hasBlockingError) {
    exit 2
}
