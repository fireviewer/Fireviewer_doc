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
    └── sealing
    │
    ├────► browser viewer publication
    │
    └────► scientific/source-folder publication
```

The current spatial implementation processes the requested area on a **500 m Lambert-93 tile grid**.

For each tile, the production path can temporarily acquire:

- MNT / terrain elevation;
- MNS / surface elevation;
- orthophotography;
- geographic context required by the active placement rules.

These source rasters are processing inputs. They are validated before deletion and are not required in the sealed publication folder once their derived artifacts have passed validation.

## Tile and zone outputs

The spatial repository currently produces, among other artifacts:

- deterministic terrain geometry with multiple LODs;
- a baked local orthophoto ground texture;
- context and object information derived from measured surface/terrain differences;
- references to the versioned assets actually used;
- compact provenance receipts;
- hashes needed to validate the package.

A completed zone can contain files such as:

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

`zone.usda` and `zone.blend` are portable scene representations of the accepted build. The active path prioritises the **validated spatial package and its provenance**, not a generated PNG capture gallery.

The exact implementation and schemas remain owned by `fireviewer/fireviewer-spatial`.

## Folder-native publication

The current Lightning batch path does **not create a final ZIP for new map jobs**.

Publication is split deliberately into two stages:

1. the complete browser viewer is published first to the public FireViewer Hugging Face dataset and can become eligible for incident publication;
2. the sealed scientific/source folder is published separately through Hugging Face/Xet as a resumable artifact.

A failure while publishing the scientific/source folder does not invalidate a browser viewer that was already published successfully. The two publication states remain distinct and must be tracked independently.

This separation prevents long-running source publication from blocking the browser-facing artifact while preserving the complete scientific package as a separate reproducibility object.

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
+ viewer publication identity
+ scientific/source publication identity
```

Temporal fire observations, replays, datasets and benchmarks can then refer to that exact build.

This avoids a common reproducibility problem: reopening an old incident against newly downloaded terrain or imagery and unintentionally changing the geometry under historical observations.

## Endpoint-driven execution

The backend is the orchestration boundary exposed to the FireViewer administration interface.

Map production is asynchronous and provider-specific execution remains below that boundary. A compatible worker or batch platform can host the builder without changing the incident model as long as the output and publication contracts remain satisfied.

The current Lightning-oriented path uses ephemeral batch compute rather than keeping the heavy map-production environment online permanently.

The current worker separately reports map-job progress, viewer readiness and scientific/source publication state. Consumers should not assume that one final ZIP or one download URL represents the complete publication lifecycle.

## Separation from the frontend

The browser is not responsible for geographic reconstruction.

The frontend consumes a viewer-oriented representation, but it does not become the canonical source of terrain or scientific provenance.

This separation allows:

- independent package validation;
- browser technology changes without invalidating archived incidents;
- future consumers to use the spatial package without reproducing the web application;
- post-event analysis outside the original FireViewer deployment;
- viewer availability to remain distinct from source-folder publication state.

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

## Unity and Omniverse

Unity and NVIDIA Omniverse are **not dependencies of the canonical map-production path**.

Older experiments may still appear in repository history or specialised research documentation. NVIDIA Omniverse can remain useful inside optional synthetic-data-generation work in `fireviewer-sdg`, but it does not define the current FireViewer map-builder architecture.

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
- viewer publication integrity;
- scientific/source-folder publication integrity;
- storage and recovery behaviour.

The [Status Matrix](STATUS_MATRIX.md) records which of these gates have actually been exercised.

## Reproducibility contract

A map build is suitable for replay only if a later consumer can identify:

- the exact sealed package/folder;
- the browser viewer artifact when one was published;
- the package contract version;
- the spatial reference system;
- the source receipts;
- the asset bundle revision;
- the hashes;
- the production code or release revision;
- any repairs or exceptional processing decisions;
- the publication state of each artifact family.

See [Provenance and Reproducibility](PROVENANCE_AND_REPRODUCIBILITY.md).

## Current priorities

The map-builder workstream currently prioritises:

1. repeatable deployed builds on representative geographic areas;
2. independent reopening and validation of sealed spatial packages;
3. reliable viewer-first and scientific/source-folder publication;
4. reliable storage and recovery of large immutable artifacts;
5. a reference incident using one exact map build across temporal states and replay;
6. simple archived performance, storage and runtime measurements from stable runs.

These priorities are deliberately more important than adding new rendering features.
