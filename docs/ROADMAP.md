# FireViewer — Roadmap

**Purpose:** cross-repository roadmap organised around verifiable technical milestones.

FireViewer does not use this document to promise operational wildfire capabilities or delivery dates. A milestone is complete only when its required evidence exists.

The current programme is intentionally centred on **spatial reproducibility, temporal evidence, replay, independent evaluation and sustainability** rather than adding more disconnected features.

## Guiding sequence

```text
canonical map builder
        ↓
reviewed temporal fire layers
        ↓
fully replayable reference incident
        ↓
independent localisation / AI benchmarks
        ↓
deployed source + storage validation
        ↓
public technical case studies
        ↓
research / infrastructure partnerships at larger scale
```

## P0 — Documentation and project clarity

**State:** in progress on the current documentation refactor.

### Objectives

- establish one public description of what FireViewer is;
- remove Unity/Omniverse from the core product architecture;
- keep Omniverse only where it accurately describes optional SDG research;
- align architecture, status, map production, timeline and replay terminology;
- make current limitations visible without burying the project under warnings;
- expose concrete ways for research groups, cloud providers and sponsors to help.

### Gate

- README, architecture and status documents do not contradict each other;
- each major capability links to a technical document;
- partner-facing claims are traceable to implementation or explicitly described as planned;
- no unconfigured funding mechanism or institutional status is advertised.

## P1 — Canonical headless map builder

**Core implementation:** present in `fireviewer-spatial`.

### Objectives

- use the endpoint-driven map builder as the only canonical spatial production path;
- keep map generation independent from the browser, Unity and Omniverse;
- validate representative map builds from live geographic inputs;
- preserve source receipts, CRS, tile metadata, hashes and asset revisions;
- validate autonomous `zone.usda` and `zone.blend` reopening;
- archive real run metrics for compute time, storage size and failure modes.

### Gate

A reference build must be reproducible from a documented request and independently inspectable from its delivered package without regenerating the terrain.

### Support that helps

- CPU batch credits;
- object storage;
- bandwidth;
- infrastructure/reliability review;
- geospatial expertise.

See [Map Builder](MAP_BUILDER.md).

## P2 — Fire evolution timeline

### Objectives

- make observed perimeter packages and reviewed temporal states first-class artifacts;
- keep observed, reconstructed, interpreted, simulated and predicted states separate;
- preserve unknown intervals rather than inventing interpolation;
- bind every temporal package to an exact map build;
- expose derived browser views without making GLB the canonical timeline format.

### Gate

A timeline can be reopened and interpreted without ambiguity about state type, time, supporting evidence or map revision.

### Support that helps

- GIS review;
- wildfire-domain review;
- retrospective reference cases;
- storage for temporal artifacts.

See [Fire Evolution Timeline](FIRE_EVOLUTION_TIMELINE.md).

## P3 — Fully replayable reference incident

This is the most important credibility milestone for the current architecture.

### Objectives

Produce at least one incident/reconstruction package that links:

- source/evidence registry;
- immutable map build;
- temporal fire states;
- AI and deterministic processing revisions;
- localisation/abstention results;
- human review decisions;
- public snapshot;
- replay manifest;
- one independent post-event analysis.

### Gate

A second environment or reviewer can inspect the archived package and reproduce the documented study without silently downloading a newer terrain, model or temporal state.

### Support that helps

- durable storage;
- compute credits;
- independent methodology review;
- engineering time for packaging and replay tooling.

See [Replay and Post-Event Studies](REPLAY_AND_POST_EVENT_STUDIES.md).

## P4 — Event/localisation benchmark

Long model-training campaigns are not the priority until the evaluation contract is strong enough.

### Objectives

- define fixed incident-level splits;
- keep training/evaluation leakage under control;
- measure localisation error in metres where valid targets exist;
- evaluate abstention separately from accepted localisations;
- preserve difficult negatives and ambiguous views;
- compare model revisions and deterministic spatial methods on the same cases;
- publish failure analysis, not only aggregate scores.

### Candidate components

Depending on their status in [STATUS_MATRIX.md](STATUS_MATRIX.md), evaluation can cover:

- FireViewer D-FINE detector;
- FireViewer RT-DETRv2 detector;
- a future visual-pointing candidate, selected only after an external benchmark;
- DINOv3 challenger work;
- RoMa-family matching;
- PyCOLMAP pose estimation;
- other registered baselines/challengers.

### Gate

No model or matcher is promoted on a single headline score. The benchmark must document uncertainty, abstention and major failure families.

### Support that helps

- GPU credits;
- held-out evaluation data;
- computer-vision expertise;
- independent benchmark review.

## P5 — External sources and deployed reproducibility

### Objectives

- validate selected external connectors against live providers;
- preserve collection, revision, licence, acquisition time and CRS;
- confirm that mirrors/derived products are not counted as independent corroboration;
- exercise production storage, backup and restoration;
- validate long-running jobs, cancellation, recovery and artifact delivery;
- archive provider failures and recovery behaviour.

### Gate

At least one representative source family and one large spatial/replay artifact path are exercised on deployed infrastructure with documented recovery evidence.

### Support that helps

- provider/data partnerships;
- hosting credits;
- security/reliability engineering;
- licence review.

## P6 — Public technical case studies

### Objectives

Publish a small number of high-quality technical studies rather than a large number of opaque demos.

Each case study should explain:

- the question being studied;
- the available evidence;
- the exact map/timeline build;
- what FireViewer could conclude;
- what remained uncertain;
- what failed or abstained;
- how the result can be reproduced.

### Gate

A reader outside the project can understand both the value and the limitations without needing private context from the maintainer.

### Support that helps

- research collaborators;
- domain review;
- documentation support;
- public-interest organisations able to evaluate usefulness.

## P7 — Sustainable operation

FireViewer currently has significant single-maintainer risk. Sustainability is therefore a technical roadmap item.

### Objectives

- reduce personally funded infrastructure where credits or sponsorship are available;
- document recurring infrastructure costs from measured runs;
- establish at least one stable support channel appropriate to the maintainer's legal status;
- obtain external technical review on one or more critical workstreams;
- make contribution tasks small enough for external collaborators;
- keep core public artifacts reproducible even if a specific cloud provider changes.

### Gate

The project can continue core validation work without relying exclusively on unbounded personal spending and one person's undocumented operational knowledge.

See [Support and Partnerships](SUPPORT_AND_PARTNERSHIPS.md).

---

# Research workstreams

The following research streams continue in parallel but do not override P1–P7.

## R1 — Detection and media triage

- D-FINE remains a FireViewer detection component subject to benchmark evidence;
- RT-DETRv2 remains available for video triage / comparison;
- challengers are evaluated on the same fixed corpus before promotion.

## R2 — Visual anchors and segmentation

- no FireViewer pointing checkpoint is current; a replacement remains blocked
  until the dataset and external evaluation are independently reviewed;
- DINOv3 segmentation/pointing work remains a research/challenger path;
- SAM is primarily an annotation/correction tool unless separately promoted.

## R3 — Ground-view spatial registration

Target chain:

```text
map package
→ local reference/retrieval
→ geometric filters
→ dense matching
→ 2D–3D correspondences
→ robust pose
→ terrain raycast
→ uncertainty
```

No language model is authorised to fill missing coordinates.

## R4 — UAV / remote-sensing evaluation

Matching and remote-sensing methods are compared using source-aware evaluation. A hotspot, burned-area product and active-fire interpretation remain different data families.

## R5 — Synthetic data

`fireviewer-sdg` remains a separate R&D workstream for synthetic data and simulation experiments.

Omniverse, Isaac Sim, NuRec and related NVIDIA technologies may be used there when useful, but do not define the FireViewer core runtime.

---

# Promotion rule

Typical promotion path:

```text
contract
→ implementation
→ local tests
→ deployed integration
→ benchmark / replay evidence
→ shadow or private use
→ independent review
→ limited public promotion
```

A README claim does not replace a gate.

# What FireViewer will not claim before evidence

- operational emergency readiness;
- certified propagation forecasting;
- field localisation accuracy without a reproducible benchmark;
- provider availability without live tests;
- infrastructure cost without archived measurements;
- complete replay without an independently reopened reference case;
- model superiority without fixed comparative evaluation.
