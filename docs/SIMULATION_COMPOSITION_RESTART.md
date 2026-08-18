# FireViewer — Simulation and Dataset Consumer Boundary

**Role of this document:** compatibility note for simulation/dataset consumers. It is **not** the canonical description of FireViewer core.

The canonical architecture is documented in [ARCHITECTURE.md](ARCHITECTURE.md), the map-production path in [MAP_BUILDER.md](MAP_BUILDER.md), and replay/post-event use in [REPLAY_AND_POST_EVENT_STUDIES.md](REPLAY_AND_POST_EVENT_STUDIES.md).

## Current decision

FireViewer spatial production and downstream simulation are separate responsibilities.

The core system produces immutable spatial and temporal packages. A simulation engine, dataset pipeline or replay/study tool may consume those packages without being allowed to silently rebuild or replace them.

```text
measured map build
        │
        ├── observed/reviewed temporal package
        │
        ▼
scene-consumer input
        │
        ├── replay / post-event study
        ├── dataset export
        └── optional simulation research
```

Simulation is therefore a **consumer family**, not the centre of the FireViewer product architecture.

## Canonical map package

The active map builder creates a portable package containing artifacts such as:

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

The active measured-map contract is `fireviewer.simple-measured-map-package.v2` with its corresponding upload contract.

The production path does **not** require a gallery of 20 control captures. The canonical result is the validated package itself. Renders/screenshots can be produced by review or study tools as derived artifacts without becoming part of the measured-map contract.

## Temporal package

Observed geographic states are produced separately from the map build.

Current spatial outputs can include:

```text
geographic-perimeters.usda
fire-progression-timeline.json
perimeters.normalized.json
perimeter-layer.manifest.json
preview/perimeter-viewer.manifest.json
preview/frame-*.glb
```

The normalised geometry, timeline and OpenUSD layer are the reference data. Browser-oriented GLB files are derived views.

Unknown intervals remain unknown; no simulation consumer is allowed to rewrite that semantic rule and still describe the result as the original observed timeline.

## Consumer contract

`scene-consumer-input.v1` binds a consumer to immutable spatial/temporal references.

A consumer should be able to identify:

- map package ID/build/revision;
- map-package contract version;
- archive/hash reference;
- canonical spatial entry point;
- CRS/vertical-reference information;
- optional temporal package and its exact base map build;
- prohibition on silent terrain/perimeter reconstruction.

## Replay versus simulation

Replay and simulation are not synonyms.

### Replay

A replay preserves the historical spatial, temporal, evidence and processing revisions and allows them to be inspected/re-executed at the level documented by the replay contract.

### Simulation

A simulation produces a new model-derived scenario from selected inputs.

Its output is a new derived artifact and must carry its own model/configuration provenance.

A simulation must never be inserted into the observed timeline as if it were an historical observation.

## Dataset export

A dataset is also a separate derived product.

Exporting data from an incident/replay requires explicit rules for:

- source licences;
- included/excluded artifact families;
- labels and their semantic class;
- train/validation/test split policy;
- incident/source leakage;
- transformation history.

The dataset does not modify the source incident.

## Optional SDG research

`fireviewer-sdg` may use simulation technologies such as NVIDIA Omniverse/Isaac Sim in controlled synthetic-data campaigns.

That work:

- is optional R&D;
- is not a dependency of the canonical map builder;
- does not define the public FireViewer architecture;
- must label synthetic cases explicitly;
- must preserve its own provenance and split/leakage rules.

## Publication and downloads

A published incident may expose an accepted map package and other authorised artifacts as downloads.

A future simulation pack, benchmark export or post-event study can appear as an additional artifact linked to the exact map/replay inputs it consumed. It does not replace the base map package.

Publication remains a separate reviewed action.

## Gates

| Gate | Evidence required |
| --- | --- |
| Map package accepted | package contract valid, hashes valid, source/provenance receipts present, package independently inspectable according to the current gate |
| Temporal package accepted | explicit state types/times, normalised geometry, exact map-build reference, integrity hashes |
| Replay consumption | immutable references preserved; no silent terrain/timeline substitution |
| Dataset consumption | export methodology, labels, rights and split/leakage policy documented |
| Simulation consumption | model/configuration provenance explicit and output labelled simulated |
| Public release | human publication decision and applicable rights checks |

Local tests alone do not prove live source acquisition, deployed provider resilience, scientific accuracy or operational safety.
