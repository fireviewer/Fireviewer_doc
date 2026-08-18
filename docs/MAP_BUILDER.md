# FireViewer — Canonical Map Builder

## Purpose

The FireViewer map builder creates a **portable, reproducible spatial reference** for an incident or study area.

Its purpose is not to render a pretty screenshot. It is to produce a versioned geographic package that other FireViewer components can consume without rebuilding terrain from mutable external sources.

The active production path is headless and endpoint-driven. It does not depend on Unity or NVIDIA Omniverse.

## Inputs

A map build starts from:

- a geographic centre in WGS84 / `EPSG:4326`;
- a requested square side length;
- optional validated fixed-asset placements;
- versioned map-production code and contracts;
- the geographic sources required by the active production profile.

The production coordinate reference system is `EPSG:2154` (Lambert-93). Vertical reference is documented separately by the spatial package and current production profile.

## Production model

```text
map request
    │
    ▼
backend orchestration
    │
    ▼
headless production job
    │
    ├── geographic acquisition
    ├── tile planning
    ├── terrain processing
    ├── surface/context processing
    ├── object placement
    ├── OpenUSD assembly
    ├── Blender assembly
    ├── validation
    ├── hashing
    └── packaging
    │
    ▼
immutable spatial build
```

The current spatial implementation processes the requested area on a **500 m Lambert-93 tile grid**.

For each tile, the production path can temporarily acquire:

- MNT / terrain elevation;
- MNS / surface elevation;
- orthophotography;
- geographic context required by the active placement rules.

These source rasters are processing inputs. They are validated before deletion and are not required in the delivered ZIP.

## Tile outputs

The spatial repository currently produces, among other artifacts:

- deterministic terrain geometry with multiple LODs;
- a baked local orthophoto ground texture;
- context and object information derived from measured surface/terrain differences;
- references to the versioned assets actually used;
- compact provenance receipts;
- hashes needed to validate the package.

The exact implementation and schemas remain owned by `fireviewer/fireviewer-spatial`.

## Zone package

A completed zone contains files such as:

```text
zone.usda
zone.blend
zone.done.json
zone-plan.json
zone-context.json
packages/<tile>/
shared/prototypes/
provenance/<tile>/
```

`zone.usda` is the unified OpenUSD scene. `zone.blend` is an autonomous Blender representation of the same production result with the required local resources packaged for independent inspection.

The active path prioritises the **validated ZIP package**, not a generated PNG gallery. Production captures are not part of the canonical output contract.

## Why the map build is immutable

A spatial package should not change just because an upstream geographic service later publishes a new revision.

Once accepted, the build becomes a referenceable artifact:

```text
map_build_id
+ package contract version
+ source receipts
+ hashes
+ asset bundle revision
+ processing revision
```

Temporal fire observations, replays, datasets and benchmarks can then refer to that exact build.

This avoids a common reproducibility problem: reopening an old incident against a newly downloaded terrain or imagery layer and unintentionally changing the geometry under the historical observations.

## Endpoint-driven execution

The backend is the orchestration boundary exposed to the FireViewer administration interface.

The current deployment model supports asynchronous map jobs with operations equivalent to:

```text
POST /api/v1/admin/map-jobs
GET  /api/v1/admin/map-jobs/{job_id}
POST /api/v1/admin/map-jobs/{job_id}/cancel
GET  /api/v1/admin/map-jobs/{job_id}/download
```

Provider-specific execution details are intentionally below this boundary. A compatible worker or batch platform can host the builder without changing the incident model as long as the output contracts remain satisfied.

The current Lightning-oriented path is an ephemeral batch workload: compute resources are started for the build rather than kept online permanently.

## Separation from the frontend

The browser is not responsible for geographic reconstruction.

The frontend may display derived GLB or other web-friendly representations, but it does not become the canonical source of terrain or temporal geometry.

This separation allows:

- independent package validation;
- browser technology changes without invalidating archived incidents;
- future consumers to use the spatial package without reproducing the web application;
- post-event analysis outside the original FireViewer deployment.

## Separation from fire evolution

The map is the stable spatial reference. The evolution of an incident is represented separately.

```text
immutable map build
        │
        ├──── observed perimeter timeline
        ├──── reconstructed historical timeline
        ├──── event/localisation layers
        └──── optional simulation inputs
```

A new fire observation does not require the terrain to be rebuilt.

This is one of the key architectural changes compared with earlier FireViewer experiments.

## Unity and Omniverse

Unity and NVIDIA Omniverse are **not dependencies of the canonical map-production path**.

Older experiments may still appear in repository history or specialised research documentation. NVIDIA Omniverse can also remain useful inside optional synthetic-data-generation work in `fireviewer-sdg`.

Those experiments do not define the FireViewer core architecture.

## Validation expectations

A successful local unit test does not prove that a live map build is valid.

A production-quality validation record should distinguish at least:

- source acquisition success;
- CRS and axis-order correctness;
- tile completeness;
- terrain validity;
- repaired or missing raster cells;
- asset references and hashes;
- package integrity;
- independent reopening of `zone.usda` / `zone.blend` as required by the active gate;
- storage and delivery integrity.

The [Status Matrix](STATUS_MATRIX.md) records which of these gates have actually been exercised.

## Reproducibility contract

A map build is suitable for replay only if a later consumer can identify:

- the exact package;
- the contract version;
- the spatial reference system;
- the source receipts;
- the asset bundle revision;
- the hashes;
- the production code or release revision;
- any repairs or exceptional processing decisions.

See [Provenance and Reproducibility](PROVENANCE_AND_REPRODUCIBILITY.md).

## Current priorities

The map-builder workstream currently prioritises:

1. repeatable deployed builds on representative geographic areas;
2. package reopening and validation independent from the original worker;
3. reliable storage and recovery of large immutable artifacts;
4. a reference incident using one exact map build across temporal states and replay;
5. documented performance and cost measurements based on archived runs rather than estimates.

These priorities are deliberately more important than adding new rendering features.
