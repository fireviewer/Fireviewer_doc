# Repository and publication guide

## Authoritative locations

- `fireviewer/Fireviewer_doc` is the canonical public project description.
- The FireViewer Hugging Face organisation is authoritative for hosted model,
  dataset and measured-map artifacts and their immutable revisions.
- Each component repository is authoritative for its own source and
  machine-readable contracts.
- The backend is authoritative for durable incident identity, review decisions,
  revisions and publication state.

A repository, image or model being present does not prove that a complete
real-data path is enabled, accepted or scientifically qualified.

## Current component map

| Repository | Responsibility | Stewardship / visibility |
| --- | --- | --- |
| `fireviewer/.github` | Organisation profile and shared contribution/security policies | FIRE-VIEWER · public |
| `fireviewer/Fireviewer_doc` | Canonical public architecture, status and governance documentation | FIRE-VIEWER · public |
| `fireviewer/fireviewer-backend` | Incidents, accounts, permissions, durable evidence, audit, review and publication | FIRE-VIEWER · private |
| `fireviewer/fireviewer-frontend` | Contribution, administration, catalogue, chronology and public exploration | FIRE-VIEWER · private |
| `fireviewer/fireviewer-association-site` | Institutional website of the association | FIRE-VIEWER · private |
| `fireviewer/fireviewer-contracts` | Shared evidence, geometry and result contracts | FIRE-VIEWER · private |
| `fireviewer/fireviewer-evidence-ingestion` | Source, media, transcription and satellite acquisition/normalisation | FIRE-VIEWER · private |
| `fireviewer/fireviewer-vision-runtime` | Detection, keyframes, segmentation, OCR and visual observations | FIRE-VIEWER · private |
| `fireviewer/fireviewer-geolocation` | Deterministic geographic hypotheses, retrieval and registration | FIRE-VIEWER · private |
| `fireviewer/fireviewer-evidence-supervisor` | Evidence assessment, contradictions and `accept`, `reject`, `abstain` | FIRE-VIEWER · private |
| `fireviewer/fireviewer-orchestrator` | Dispatch, retries, receipts and idempotency | FIRE-VIEWER · private |
| `fireviewer/fireviewer-fire-state` | Part.4 calculation, profiles, calibration and evaluation | FIRE-VIEWER · private |
| `fireviewer/fireviewer-model-lab` | Corpus preparation, training recipes, benchmarks and model registry | FIRE-VIEWER · private |
| `fireviewer/fireviewer-unreal` | Fire-specific visualisation and scenarios | FIRE-VIEWER · private |
| `fireviewer/fireviewer-docker` | Version locks and FireViewer service composition | FIRE-VIEWER · private |
| `fireviewer/fireviewer-ai-worker` | Temporary compatibility imports and commands | FIRE-VIEWER · private, transitional |
| `fireviewer/fireviewer-spatial` | Historical spatial archive retained for provenance and compatibility | FIRE-VIEWER · restored offline archive; removed from GitHub |
| `fireviewer/fireviewer-sdg` | Historical simulation archive | FIRE-VIEWER · restored offline archive; removed from GitHub |
| `fireviewer/models` | Historical registry source superseded by `fireviewer-model-lab` | FIRE-VIEWER · restored offline archive; removed from GitHub |
| `unicornwhodev/map-builder` | Generic measured-map producer, CLI/API/UI and cartographic tooling | UWD · private |

Repository visibility is an access decision, not a maturity level.

## Responsibility boundary

The UWD Map Builder produces versioned geographic packages. It does not own
FireViewer incidents, evidence, users, model decisions or publication state.

FireViewer:

- attaches every request to an existing incident;
- controls access and dispatch;
- pins the builder package or image revision;
- validates and records returned artifacts;
- retains human review and publication authority.

The FireViewer Docker repository references approved UWD releases. It does not
copy or reassign the generic builder source.

## Historical repositories

The three superseded repositories `fireviewer-spatial`, `fireviewer-sdg` and `models` were removed from GitHub on 9 September 2026. One verified compact archive is retained per repository, including Git history and available issue/PR/release metadata. See [current organisation and commit routing](ORGANISATION.md).

Archived repositories are retained only when needed for provenance,
compatibility or recovery. They are not active implementation locations and
must not receive new product logic.

The compatibility `fireviewer-ai-worker` repository may keep bounded forwarding
imports while consumers migrate. New business logic belongs in the dedicated
component repository.

## Hosted artifacts

Real measured-map packages, model weights and datasets remain outside Git in
designated artifact repositories. Their paths and revisions can be
compatibility-sensitive and must not be reorganised without a migration.

Historical names can remain in immutable artifact identifiers when renaming
would break provenance. They do not create a second active project.

## Documentation standard

Each maintained component should state:

1. its responsibility and non-goals;
2. its inputs, outputs and versioned contracts;
3. what is implemented, guarded, tested and accepted;
4. its security, privacy, provenance and licensing boundaries;
5. its local validation commands;
6. whether any identifiers are compatibility-sensitive;
7. its current steward and legal status.

Operational runbooks, provider configuration, credentials, private evidence,
local paths and raw validation logs do not belong in the public documentation.

## Governance and ownership

The association FIRE-VIEWER exists and provides administrative and financial
stewardship for association-controlled resources. Technical development is
currently maintainer-led.

Repository allocation records technical stewardship. It does not replace an
asset inventory, licence or signed assignment. Pre-association assets and UWD
components remain subject to their explicit legal arrangements.

Shared policies:

- [Contributing](https://github.com/fireviewer/.github/blob/main/CONTRIBUTING.md)
- [Code of Conduct](https://github.com/fireviewer/.github/blob/main/CODE_OF_CONDUCT.md)
- [Security](https://github.com/fireviewer/.github/blob/main/SECURITY.md)
- [Support](https://github.com/fireviewer/.github/blob/main/SUPPORT.md)

## Update rule

When code changes a public contract or component boundary, update this guide and
the relevant architecture document in the same release window. A restructure
must not be presented as proof that an unfinished functional path is complete.
