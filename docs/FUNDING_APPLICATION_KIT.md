# FireViewer — Funding Application Kit

This document provides reusable material for grant applications, infrastructure-credit programmes, sponsorship discussions and research-partnership forms.

It is intentionally factual and modular. Adapt the wording to the programme, but do not strengthen maturity or operational claims beyond the canonical [Status Matrix](STATUS_MATRIX.md).

## Project name

**FireViewer**

## Maintainer

**Unicorn Who Dev** — independent project maintainer.

Contact: **unicornwhodev@gmail.com**

## One-line description

FireViewer is open-source infrastructure for wildfire observation, spatial reconstruction, temporal tracking and reproducible post-event analysis.

## ~50-word description

FireViewer combines provenance-aware evidence, a headless geospatial map builder, AI-assisted analysis with explicit abstention, human review and versioned temporal fire states. Its goal is to preserve enough spatial, temporal and processing context to inspect wildfire information while active and replay incidents reproducibly for later research, datasets and benchmarks.

## ~100-word description

FireViewer is an independent open-source research and engineering project for documenting wildfire observations and preserving how the understanding of an incident evolves over time. It combines a headless geospatial map builder, provenance-aware evidence management, AI-assisted detection/localisation with explicit abstention, human review and versioned temporal fire layers. Instead of treating a browser visualisation as the scientific record, FireViewer stores portable spatial packages, hashes, source receipts and processing revisions so an incident can later be reopened for post-event studies, datasets and benchmarks. Observation, retrospective reconstruction, simulation and prediction remain explicitly separated.

## ~250-word description

Wildfire information is fragmented across photographs, videos, satellite products, public reports, terrain data and retrospective maps. These sources describe different parts of an incident, at different times and with different levels of uncertainty. They are difficult to combine responsibly and even harder to reuse later when screenshots, mutable web maps or undocumented model outputs are the only surviving artifacts.

FireViewer is an independent open-source research and engineering project designed to make this information spatially inspectable, temporally comparable and reproducible. Its canonical spatial pipeline is a headless, endpoint-driven map builder that processes measured geographic inputs into portable OpenUSD/Blender packages on a Lambert-93 tile grid. Temporal fire states are attached separately to the exact map build, so new observations do not require the terrain to be regenerated and unknown periods can remain explicitly unknown.

AI components can assist with detection, visual anchoring, structured extraction and localisation attempts, but they are not authorised to publish facts or invent authoritative coordinates. When evidence is insufficient, explicit abstention is a valid result. Human review remains the publication boundary.

A major objective is to make completed incidents replayable: exact spatial packages, temporal states, evidence references, model/tool revisions, hashes and review decisions can be bound into a reproducible reference for post-event research, dataset creation and benchmark evaluation.

FireViewer is not an emergency alert service, an official wildfire information source, a command system or a certified propagation predictor.

## Problem statement

Fire-related technical information is difficult to reuse because:

- evidence comes from heterogeneous sources and resolutions;
- observation time and source lineage are often lost;
- observer/camera location can be confused with fire location;
- thermal detections, smoke, burned area and active fronts are different phenomena;
- later retrospective knowledge can overwrite what was known at the time;
- AI outputs can look precise without defensible geometry;
- screenshots do not preserve CRS, geometry, uncertainty, provenance or processing revisions;
- training/evaluation datasets can accidentally leak incidents, scenes or source families.

## Proposed solution

FireViewer combines five bounded layers:

1. **Evidence and provenance** — source identity, time, rights, hashes and lineage.
2. **Spatial reference generation** — endpoint-driven measured map packages independent from the web viewer.
3. **AI-assisted analysis** — detection/anchoring/localisation proposals with explicit abstention.
4. **Human-reviewed temporal states** — observed/reconstructed states remain semantically distinct and versioned.
5. **Replay and post-event study** — immutable artifacts can later support reproducible analysis and benchmarks.

## Technical differentiation

### Headless measured map builder

The canonical map pipeline is independent from Unity and NVIDIA Omniverse. Current spatial production uses a Lambert-93 / `EPSG:2154` 500 m tile grid with measured terrain/surface/orthophoto inputs and portable OpenUSD/Blender output packages.

### Temporal truth separation

FireViewer enforces:

```text
observed ≠ reconstructed ≠ interpolated ≠ simulated ≠ predicted
```

Unknown intervals may remain undefined rather than being silently filled.

### Reproducibility before rendering

The web viewer is a consumer. Spatial packages, temporal layers, hashes and provenance remain canonical independently of the current browser rendering stack.

### AI abstention

The project treats an explicit inability to localise as preferable to a visually plausible invented coordinate.

### Post-event research

Archived incidents can become stable inputs for reproducible benchmarks, method comparison and datasets without mutating the historical record.

## Current maturity

FireViewer already has implementation across:

- React/TypeScript frontend contribution/review/public exploration;
- FastAPI backend incident/evidence/orchestration/audit/publication primitives;
- private AI worker event bundles, model stages, localisation attempts and abstention contracts;
- headless spatial map-package generation;
- observed-perimeter/timeline package tooling;
- published FireViewer models and datasets on Hugging Face;
- cross-repository safety, provenance and replay contracts.

Different capabilities are at different evidence levels. FireViewer does **not** claim operational emergency readiness. Exact status is maintained in [STATUS_MATRIX.md](STATUS_MATRIX.md).

## Current funding objective

Move FireViewer from a substantial independently built technical foundation to a reproducible, externally reviewable research platform with measured infrastructure costs and public reference cases.

## Priority funded milestones

### Milestone A — Reference map build

**Work**

- run the canonical map builder on representative real geographic inputs;
- archive source receipts and runtime/storage metrics;
- validate the final package after storage round-trip;
- reopen it independently without rebuilding terrain.

**Deliverables**

- accepted measured-map package;
- integrity/provenance report;
- runtime/storage/cost measurements;
- independent reopening procedure.

### Milestone B — Fully replayable reference incident

**Work**

- bind one map build, temporal fire states, evidence, processing revisions and human review into a replay manifest;
- preserve unknown intervals and semantic state classes;
- run one post-event study from the archived replay.

**Deliverables**

- replay manifest/package;
- reproducibility instructions;
- post-event technical case study;
- limitations/failure report.

### Milestone C — Localisation and abstention benchmark

**Work**

- define held-out incident-aware splits;
- compare current and challenger localisation components;
- analyse accepted error, abstention and failure families.

**Deliverables**

- benchmark protocol;
- fixed evaluation manifest;
- metrics and failure analysis;
- model/tool promotion recommendation.

### Milestone D — Deployed data/storage validation

**Work**

- exercise selected external-source connectors;
- validate large artifact storage/download;
- test backup/restore and failure recovery.

**Deliverables**

- provider receipts;
- recovery report;
- source/licence records;
- deployment acceptance evidence.

## Funding / support categories

Do not insert arbitrary monetary amounts before measuring the target programme and representative real runs.

Useful budget categories are:

| Category | Covers |
| --- | --- |
| GPU compute | model inference, benchmark campaigns, bounded synthetic-data experiments |
| CPU compute | map production, geometry processing, packaging and validation |
| Object storage | immutable maps, timelines, replays, datasets and benchmark artifacts |
| Bandwidth | artifact upload/download and independent reproduction |
| Development time | core implementation, integration, maintenance, documentation and case studies |
| External expertise | GIS, wildfire science, remote sensing, security or reproducibility review |
| Testing infrastructure | staging services, databases, monitoring, backup/recovery exercises |
| Data access | legally reusable imagery/reference material when a programme does not already provide it |

## Budget methodology

Before submitting a monetary budget, derive it from archived measurements:

```text
representative map job cost
+ representative AI benchmark cost
+ expected artifact storage / retention
+ expected bandwidth
+ required external services
+ development / validation effort allowed by the programme
```

Keep provider credits and cash budgets separate when the application requires it.

Do not present list-price estimates as measured FireViewer costs.

## Measurable outcomes

Possible reporting indicators include:

- accepted/reopened map packages;
- replay artifacts passing integrity checks;
- number of representative external-source paths validated;
- storage round-trips verified by hash;
- benchmark cases and fixed incident-level splits;
- localisation error on admissible cases;
- abstention rate and failure-family distribution;
- backup/recovery exercises completed;
- public technical case studies published;
- external reviewers/collaborators contributing methodology feedback.

## Public-interest / research value

Potential value areas include:

- reproducible wildfire research;
- transparent geospatial evidence fusion;
- remote-sensing methodology;
- AI evaluation under spatial uncertainty;
- post-event analysis;
- training/evaluation dataset methodology;
- explicit distinction between observation and reconstruction;
- open technical documentation for geospatial evidence workflows.

## Sustainability statement

The technical scope now includes several infrastructure-intensive workstreams. External support would reduce dependence on personal funding for compute/storage and make it possible to spend more effort on validation, reproducibility and public documentation rather than limiting experiments to what can be financed ad hoc.

The objective is not to hide project constraints; it is to convert them into bounded, auditable milestones suitable for grants, credits and technical partnerships.

## Independence statement

Infrastructure or financial support does not grant authority over:

- scientific conclusions;
- incident validation;
- uncertainty representation;
- benchmark reporting;
- public publication decisions.

Material support may be acknowledged separately from technical provenance.

## Safety statement

FireViewer is not:

- an emergency alert service;
- an official wildfire information source;
- a firefighting command system;
- an evacuation decision tool;
- a certified propagation forecast;
- an automatic legal/insurance evidence service.

## Legal / organisational wording

Current documentation must not claim charitable status, tax-deductibility, institutional endorsement or grant eligibility unless that status has actually been established for the relevant application.

When a programme requires a legal entity, fiscal sponsor, university affiliation or company registration, verify eligibility before applying and adapt the funding mechanism accordingly.

## Reusable answers for common application questions

### Why now?

The architecture and core implementation are sufficiently developed that the next bottleneck is validation rather than ideation. Representative map runs, replay artifacts, benchmarks and durable storage require compute, infrastructure and review capacity that are difficult to sustain with a single independent maintainer.

### What would support change?

It would turn isolated successful components into evidence-backed, reproducible workflows: real map-production campaigns, independently reopened artifacts, fixed benchmarks, live provider validation and public post-event case studies.

### What is the main technical risk?

The key risk is not whether individual components can run, but whether spatial/temporal provenance, model uncertainty and deployed infrastructure remain reproducible and honest across heterogeneous real-world sources. The roadmap is intentionally organised around those gates.

### How will failure be reported?

FireViewer preserves abstentions, partial states and failure families. A funded benchmark or technical case study should publish important limitations and failures alongside successful results.

### How is vendor lock-in reduced?

Provider-specific compute/storage sits behind FireViewer contracts. Canonical artifact identity uses versioned contracts, hashes and provenance rather than one cloud URL. The project aims to keep the map/replay artifacts consumable independently of the provider that generated them.

## Canonical references

- [Project Overview](PROJECT_OVERVIEW.md)
- [Funding Brief](FUNDING_BRIEF.md)
- [Support and Partnerships](SUPPORT_AND_PARTNERSHIPS.md)
- [Architecture](ARCHITECTURE.md)
- [Roadmap](ROADMAP.md)
- [Status Matrix](STATUS_MATRIX.md)
- [Acceptance and Replay Matrix](ACCEPTANCE_AND_REPLAY_MATRIX.md)
- [Safety and Scope](SAFETY_AND_SCOPE.md)
