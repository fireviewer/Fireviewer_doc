# FireViewer — Canonical Architecture

**Document role:** cross-repository source of truth for the current FireViewer architecture.

FireViewer is an open research and engineering platform for **wildfire observation, spatial reconstruction, temporal tracking and reproducible post-event analysis**.

The architecture is organised around a durable chain of evidence and artifacts rather than around one viewer technology.

```text
sources
  ↓
evidence + provenance
  ↓
analysis / localisation / abstention
  ↓
human review
  ↓
spatial + temporal incident state
  ↓
versioned publication
  ↓
replay / datasets / benchmarks / post-event studies
```

The browser viewer is a consumer of this system. It is not the canonical scientific object.

## 1. Architectural goals

FireViewer is designed to make the following possible:

1. attach observations to stable incident identities;
2. preserve evidence, time, rights and provenance;
3. build a reproducible geographic reference independently from the viewer;
4. represent wildfire evolution without silently inventing missing states;
5. use AI as a bounded analysis layer with explicit abstention;
6. require human review before publication;
7. archive immutable artifacts that can later be replayed and studied independently.

## 2. Core repositories and responsibilities

| Repository | Responsibility |
| --- | --- |
| `fireviewer-frontend` | Contribution, public incident exploration, human review and 2D/3D presentation. |
| `fireviewer-backend` | Incident registry, evidence, orchestration, audit, permissions, review and publication. |
| `fireviewer-ai-worker` | Private multimodal analysis, visual anchors, localisation attempts, structured proposals and abstention. |
| `fireviewer-spatial` | Headless map production, spatial packages, temporal perimeter packages and spatial contracts. |
| `fireviewer-sdg` | Optional synthetic-data/simulation research. It is not a runtime dependency of the FireViewer core. |
| `Fireviewer_doc` | Cross-repository architecture, terminology, safety, status, reproducibility and partner-facing documentation. |

The historical monorepo is not the source of truth for current architecture.

## 3. Stable incident identity

The public incident identity remains stable across evidence, spatial packages, timeline revisions and publications.

Canonical route:

```text
/incident/{fire_id}
```

An incident can contain several episodes, observations and revisions without silently merging their meaning.

## 4. Evidence-first event model

The preferred ingestion unit is an event candidate with context rather than an isolated image.

A candidate may contain:

- observation time or interval;
- a private viewpoint or source location where appropriate;
- message/text;
- one or more media items;
- source and rights information;
- external observations already associated by the backend.

The viewpoint describes the observer/camera. It is not automatically the location of active fire.

## 5. Evidence and provenance layer

Each source and derived artifact belongs to an explicit lineage graph.

```text
source
  ↓
evidence object
  ↓
derived artifact
  ↓
analysis result
  ↓
reviewed state
```

The platform preserves, as applicable:

- source identity and revision;
- observation/acquisition time;
- retrieval time;
- content hash;
- licence/attribution constraints;
- CRS and footprint;
- model/tool revision;
- parent/derived relationships;
- review and publication history.

See [Provenance and Reproducibility](PROVENANCE_AND_REPRODUCIBILITY.md).

## 6. Headless spatial map builder

The canonical map-production path is owned by `fireviewer-spatial`.

It is **headless, endpoint-driven and independent of Unity and NVIDIA Omniverse**.

### 6.1 Request

A build starts from a geographic centre and requested square side length.

Input geographic coordinates are WGS84 / `EPSG:4326`; production uses Lambert-93 / `EPSG:2154`.

### 6.2 Tile production

The current implementation processes the area on a 500 m tile grid.

Temporary geographic inputs can include:

- MNT;
- MNS;
- orthophoto;
- contextual geographic information required by validated placement rules.

Each tile produces deterministic terrain and packaged contextual artifacts, together with compact provenance receipts.

### 6.3 Package

A completed build contains artifacts such as:

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

The active contract prioritises a validated autonomous package. A PNG capture gallery is not part of the canonical production output.

See [Map Builder](MAP_BUILDER.md).

## 7. Backend orchestration

The backend is the boundary between the administration interface and the compute provider.

Conceptually:

```text
Admin UI
   ↓
FireViewer backend
   ↓
map job / AI job / source job
   ↓
provider-specific worker
   ↓
validated result
   ↓
private storage / registry
```

Provider credentials remain server-side. The browser never needs cloud-provider or model-registry secrets.

Map production can run as an ephemeral batch workload rather than a permanently running heavy service.

The provider is an implementation detail below the FireViewer job contract. This helps avoid making the product architecture depend on one compute vendor.

## 8. Temporal wildfire layer

The map is a stable spatial reference. Wildfire evolution is represented separately.

```text
map build
   ├── observed state T1
   ├── observed state T2
   ├── reviewed interpretation
   ├── retrospective reconstruction
   └── optional simulation input/output family
```

Core semantic rule:

```text
observed ≠ reconstructed ≠ interpolated ≠ simulated ≠ predicted
```

Unknown intervals stay unknown. A visual animation may interpolate for display, but that does not create observed intermediate geometry.

See [Fire Evolution Timeline](FIRE_EVOLUTION_TIMELINE.md).

## 9. AI analysis architecture

The AI worker receives private event bundles and returns structured results that remain proposals until reviewed.

The pipeline can include:

- media triage;
- detection;
- OCR or speech extraction where relevant;
- visual anchoring;
- structured fact extraction;
- spatial-registration attempts;
- uncertainty and contradiction handling;
- explicit abstention.

### 9.1 Model roles

Current and experimental components include FireViewer detector models, pointing/localisation components and external baselines/challengers. Their exact promotion state belongs in [STATUS_MATRIX.md](STATUS_MATRIX.md), not in architectural marketing language.

### 9.2 Abstention

Failure to produce a defensible location is not treated as a pipeline defect that must be hidden.

Examples of valid states include:

- insufficient visual anchor;
- ambiguous anchor;
- no visible ground origin;
- insufficient geometry;
- unstable camera pose;
- invalid raycast;
- uncertainty above the accepted limit.

### 9.3 No autonomous publication

A model cannot independently:

- create a public incident;
- confirm an active fire;
- publish a perimeter;
- turn smoke into a closed fire boundary;
- turn a simulation into an observation.

## 10. Spatial registration

Ground and UAV localisation remain evidence-driven spatial problems rather than text-generation tasks.

Target ground-view chain:

```text
incident map package
→ local render/reference bank
→ retrieval
→ metadata / horizon / FOV / relief filters
→ dense matching
→ 2D–3D correspondences
→ robust pose estimation
→ terrain raycast
→ uncertainty propagation
```

Candidate algorithms and models are promoted only through FireViewer-specific benchmarks.

A language model may structure evidence around the process; it is not authorised to invent coordinates.

## 11. Human review and publication

Validation is deliberately decomposed.

A reviewer may need to make separate decisions about:

- factual assertion;
- source/evidence quality;
- visual anchor;
- geometry;
- uncertainty;
- temporal interpretation;
- public wording;
- publication.

Publication creates a versioned public state. Corrections and retractions create lineage rather than silently overwriting history.

## 12. Public presentation

The frontend provides a browser-oriented representation of the archived state.

It may use:

- GLB or other web-friendly 3D assets;
- 2D fallbacks;
- textual timelines;
- uncertainty overlays;
- downloadable packages where authorised.

The public client must not reconstruct missing data when an asset is unavailable.

A browser representation can change over time without invalidating the canonical spatial or temporal package.

## 13. Replay architecture

Replay is a first-class downstream consumer.

```text
map package
+ temporal package
+ evidence references
+ processing revisions
+ human decisions
+ publication revision
        ↓
replay manifest
        ↓
post-event study / dataset / benchmark / independent inspection
```

A consumer may read these artifacts but must not silently recompute the terrain or historical timeline and still claim to be replaying the same archived incident.

See [Replay and Post-Event Studies](REPLAY_AND_POST_EVENT_STUDIES.md).

## 14. Synthetic data and simulation

Synthetic-data research is valuable but deliberately separated from the core incident pipeline.

`fireviewer-sdg` may use NVIDIA Omniverse, Isaac Sim, NuRec or other simulation/reconstruction technologies for bounded R&D campaigns.

Those workflows:

- do not make Omniverse a FireViewer runtime dependency;
- do not turn synthetic cases into real observations;
- do not replace the measured map builder;
- must preserve their own provenance and training/evaluation boundaries.

## 15. External sources

FireViewer can integrate external source families such as official communications, remote sensing, thermal detections, weather observations and geographic reference data.

Each connector must preserve:

- provider/collection;
- observation/acquisition time;
- retrieval revision;
- native CRS and footprint where relevant;
- licence/attribution;
- source-family identity so derived products are not counted as independent corroboration.

See [External Source Connectors](EXTERNAL_SOURCE_CONNECTORS.md).

## 16. Security boundaries

Key trust boundaries include:

- public browser ↔ backend;
- backend ↔ private evidence storage;
- backend ↔ compute providers;
- backend ↔ external-source providers;
- AI worker ↔ private evidence;
- public artifacts ↔ restricted evidence.

Provider secrets, private source URLs and sensitive evidence must not be embedded in public browser bundles or immutable public scene packages.

## 17. Promotion model

Capabilities move through evidence-based gates rather than a single "implemented" flag.

Typical progression:

```text
contract
→ local implementation
→ local tests
→ deployed integration
→ reproducible benchmark/replay
→ shadow/private use
→ independent review
→ limited public promotion
```

Field accuracy, provider availability, cost, latency and reliability are never inferred from local unit tests.

## 18. Funding and sustainability architecture

Sustainability is now a project constraint, not an administrative afterthought.

FireViewer prioritises support that can be linked to technical outputs:

- CPU credits → reproducible map-build campaigns;
- GPU credits → fixed benchmark runs and failure analysis;
- storage → immutable replay and dataset artifacts;
- engineering support → deployment/recovery/security gates;
- research collaboration → independent validation and methodology review.

Support does not alter the provenance, uncertainty or human-review rules.

See [Support and Partnerships](SUPPORT_AND_PARTNERSHIPS.md).

## 19. Architectural non-goals

FireViewer core is not designed to be:

- an emergency alert network;
- an automatic wildfire-confirmation service;
- an evacuation or command system;
- a certified propagation predictor;
- a national real-time 3D digital twin;
- an Omniverse- or Unity-dependent product;
- a system that replaces uncertainty with visually convincing guesses.

## 20. Canonical related documents

- [Project Overview](PROJECT_OVERVIEW.md)
- [Map Builder](MAP_BUILDER.md)
- [Fire Evolution Timeline](FIRE_EVOLUTION_TIMELINE.md)
- [Replay and Post-Event Studies](REPLAY_AND_POST_EVENT_STUDIES.md)
- [Provenance and Reproducibility](PROVENANCE_AND_REPRODUCIBILITY.md)
- [Status Matrix](STATUS_MATRIX.md)
- [Roadmap](ROADMAP.md)
- [Safety and Scope](SAFETY_AND_SCOPE.md)
- [Support and Partnerships](SUPPORT_AND_PARTNERSHIPS.md)
