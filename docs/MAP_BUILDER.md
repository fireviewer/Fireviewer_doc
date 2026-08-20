# FireViewer — Canonical Map Builder

## Purpose

The FireViewer map builder creates a **portable, reproducible spatial reference** for an incident or study area.

Its role is to produce measured, versioned spatial artifacts that can be viewed, replayed and inspected later without silently rebuilding the terrain from mutable upstream sources.

The canonical builder is headless and does not depend on Unity or NVIDIA Omniverse.

## Current maturity

The stable Lightning production path is retained as a fallback while a stricter provider-neutral comparison path is being validated.

The newer factual-v2 path is **implemented but not yet promoted as the canonical production provider**. Its promotion requires a controlled live comparison against the retained reference path.

This distinction is important:

```text
stable fallback ≠ comparison worker ≠ promoted production provider
```

## Inputs

A build starts from:

- a geographic centre in WGS84 / `EPSG:4326`;
- a requested square side length;
- optional validated fixed-asset placements;
- versioned map-production code and contracts;
- the geographic sources required by the active production profile.

Production uses Lambert-93 / `EPSG:2154`.

## Production model

```text
map request
    │
    ▼
backend orchestration
    │
    ▼
provider-specific batch worker
    │
    ├── geographic acquisition
    ├── tile planning
    ├── terrain processing
    ├── surface/context processing
    ├── object placement
    ├── OpenUSD / Blender assembly
    ├── validation
    ├── hashing
    └── sealing
    │
    ├────► compact validation evidence
    │
    └────► complete browser viewer
```

The current spatial implementation processes the requested area on a **500 m Lambert-93 tile grid**.

Temporary geographic inputs can include MNT, MNS, orthophotography and contextual geographic information required by the active placement rules.

## Canonical spatial package

A completed map build can contain artifacts such as:

```text
zone.usda
zone.blend
zone.done.json
zone-plan.json
zone-context.json
packages/<tile>/
payloads/
shared/prototype-bundles/
provenance/<tile>/
```

These artifacts preserve the measured scene, asset references, provenance and integrity information. They are the reproducible spatial identity of the build.

Raw source rasters are processing inputs and do not need to remain in the final portable folder once their derived artifacts have passed the applicable validation rules.

## factual-v2 placement profile

The factual-v2 profile is isolated from the stable fallback so that its behaviour can be compared without silently changing the existing path.

### Buildings

For instantiated buildings:

- BD TOPO footprint is the XY geometry authority;
- MNT provides ground elevation;
- MNS−MNT provides measured height;
- a morphology-only HAG candidate without the required footprint confirmation is not instantiated;
- the discrete visual representation must use a reviewed real USD catalog asset;
- primitive/procedural replacement buildings are forbidden.

### Trees

The first controlled comparison deliberately preserves the historical 1 m candidate quantity/status, while allowing position, ground and height to be refined from native 0.5 m MNT/MNS inside the same original 1 m peak cell.

This quantity is an estimate of individual crowns, not a certified count of physical stems. No tree quota or viewer thinning is introduced.

### Context assets

A road, rail or hydro feature does not imply the existence of a generic equipment object.

Discrete context objects require an explicit validated placement/source and a reviewed catalog asset.

Continuous roads, rail and hydro remain a separate class: they may be constructed from their source geometry because they are geographic surfaces or lines rather than invented discrete equipment.

## Validation campaign model

The first provider comparison is intentionally bounded to **exactly 9 tiles**.

The same request must be used by both workers. The comparison should verify at least:

- the same tile identities/origins;
- source/hash comparability;
- building/tree/context counts;
- XY and height differences;
- absence of placeholders;
- viewer completeness;
- runtime and artifact-size measurements;
- publication reliability.

A third paid run is not automatically implied by the comparison plan.

## Folder-native validation evidence

Validation evidence is published as ordinary files, not as a ZIP archive.

Canonical layout:

```text
validation/<zone_id>/<build_id>/<provider>/
  validation-summary.json
  zone-plan.json
  zone.done.json
  viewer-scene.v1.json        # when viewer stage is available
  tiles/<tile_id>/
    placement-inventory.json
    tile-receipt.json
    provenance/
```

This folder is **comparison evidence only**. It is not another map and it is not the browser viewer.

## Complete browser viewer

The browser viewer is a derived representation of the same accepted map build, but it is required to remain **complete**.

Canonical public layout:

```text
maps/<zone_id>/<build_id>/runtime/
  viewer.glb
  viewer-scene.v1.json
```

The viewer contract requires:

- `policy = fail_closed_exact_visual_scene`;
- `mesh_coverage = complete`;
- exact logical counts for buildings, trees and context assets;
- zero placeholder instances;
- no missing or extra canonical logical objects;
- matching hash and byte count for the exported GLB.

Runtime optimisation may use instancing, shared meshes/textures and other representation-level optimisations, but it must not remove logical objects or move them away from their factual placement.

A simplified viewer that silently drops parts of the map is not the canonical public viewer.

## Hugging Face publication

The public measured-scene repository is:

`fireviewer/simple-measured-scenes-v1`

It can contain both complete runtime viewers and compact validation evidence.

The backend records immutable viewer identity using repository, revision, path, hash, size and completeness metadata.

The existence of a public GLB is not equivalent to incident publication. Attaching/replacing the active map of an incident remains an explicit, versioned backend action.

## Backend and provider boundary

The backend remains the orchestration and durable-state boundary. The heavy worker is provider-specific and ephemeral.

```text
frontend
   ↓
backend
   ↓
map job contract
   ↓
compute provider
   ↓
validated/public artifacts
```

Provider credentials remain server-side. The frontend does not need cloud-provider, model-registry or publication secrets.

The compute provider is an implementation detail below the map-job contract and can change without redefining incident identity or publication semantics.

## Stable fallback and promotion rule

The stable Lightning production path remains available until factual-v2 passes representative live validation.

A new provider/profile must not be promoted merely because:

- its image builds successfully;
- unit tests exist;
- a GPU is attached;
- it produces visually plausible output.

Promotion requires evidence tied to the exact build, inputs, sources and published artifacts.

## Known remaining work

Independent of the first comparison, the following remain separate workstreams:

- review/qualification of dimension-aware real-asset selection;
- future canopy/individual-tree treatment beyond the controlled first comparison;
- final continuous road/rail/hydro integration checks;
- provider-neutral production callbacks and recovery behaviour;
- complete scientific/source-folder publication from the promoted provider;
- archived runtime, cost and storage measurements;
- independent reopening/replay of a reference build.

## Reproducibility contract

A map build is suitable for replay only if a later consumer can identify, as applicable:

- the exact spatial package/folder;
- the exact browser viewer;
- package/placement contract revisions;
- source receipts and hashes;
- coordinate reference systems;
- asset bundle revision;
- production code/image revision;
- repairs or exceptional processing decisions;
- publication state of each artifact family.

See [Provenance and Reproducibility](PROVENANCE_AND_REPRODUCIBILITY.md) and [Status Matrix](STATUS_MATRIX.md).

## Non-goals

The map builder is not a wildfire propagation predictor, an emergency command system or a mechanism for replacing missing geographic evidence with plausible-looking geometry.
