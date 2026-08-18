# FireViewer

**Open infrastructure for wildfire observation, spatial reconstruction, temporal tracking and reproducible post-event analysis.**

FireViewer is an independent open-source research and engineering project maintained by **Unicorn Who Dev**. Its goal is to make wildfire information easier to inspect, compare, preserve and replay over time without turning uncertain observations into false certainty.

FireViewer is not primarily a 3D viewer. The viewer is one interface over a larger technical system that combines geospatial processing, evidence management, computer vision, temporal modelling, reproducible scene generation and human validation.

> **FireViewer is not an emergency alert service, an official source, a firefighting command tool or a wildfire propagation predictor.** In an active emergency, follow the instructions of the relevant public authorities and emergency services.

## Why FireViewer exists

Wildfire information is fragmented across photographs, videos, satellite products, public reports, maps, terrain data and retrospective assessments. These sources often arrive at different times, at different spatial resolutions, with different levels of confidence.

FireViewer is designed around a simple principle:

> **Every published state should remain traceable to what was observed, when it was observed, where it was placed, how it was transformed and which exact spatial build was used.**

The project therefore focuses on four capabilities:

| Capability | Purpose |
| --- | --- |
| **Observe and document** | Keep evidence, timestamps, provenance, uncertainty and human review attached to each incident. |
| **Build a reproducible spatial reference** | Generate a deterministic geographic scene from measured terrain and imagery through a headless map-production pipeline. |
| **Track change over time** | Represent observations and reviewed fire states as a temporal sequence without silently filling unknown periods. |
| **Replay and study afterwards** | Reopen an incident later with the exact map build, evidence, revisions, hashes and temporal states used at the time. |

## From sources to a reproducible incident

```text
external and contributed sources
            │
            ▼
   provenance + evidence registry
            │
            ├──────────────► AI-assisted analysis
            │                    │
            │                    ▼
            │             localisation / abstention
            │
            ▼
     human review and validation
            │
            ├──────────────► temporal fire states
            │
            ▼
   immutable spatial map build
            │
            ▼
 versioned incident representation
            │
            ├──────────────► public exploration
            ├──────────────► datasets / benchmarks
            └──────────────► replay / post-event studies
```

Observation, reconstruction, interpretation, simulation and prediction are deliberately kept separate. A reconstructed historical perimeter is not presented as a direct observation. A simulation is not presented as an observed future state.

## Headless map builder

The active FireViewer map builder no longer depends on Unity or NVIDIA Omniverse.

A map build is requested through the backend and executed as a headless production job. The spatial pipeline works from a geographic centre and requested area, acquires the required geographic inputs, processes the area on a **Lambert-93 / EPSG:2154 grid of 500 m tiles**, and produces a portable spatial package.

Current outputs include, among other artifacts:

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

The final package contains the spatial scene, the assets actually used and compact provenance receipts. Raw MNT, MNS and orthophoto rasters are temporary processing inputs and are not required in the delivered package.

The browser consumes derived web representations where useful, but the spatial reference remains the versioned map package rather than a screenshot or a client-specific scene.

See [Map Builder](docs/MAP_BUILDER.md).

## Tracking wildfire evolution

FireViewer treats the map as a stable spatial reference and wildfire evolution as a separate temporal layer.

Observed or reviewed geographic states can be attached to the exact map build used for an incident. Each state belongs to a known observation time or an explicitly documented interval. When nothing is known between two states, FireViewer keeps that period unknown instead of inventing a smooth progression.

```text
observed ≠ reconstructed ≠ interpolated ≠ simulated ≠ predicted
```

This distinction is central to the project and to every dataset, replay or public representation derived from it.

See [Fire Evolution Timeline](docs/FIRE_EVOLUTION_TIMELINE.md).

## Reproducibility and post-event studies

FireViewer is designed to remain useful after an incident has ended.

A replay can bind together:

- the exact spatial package and its hashes;
- geographic source receipts and coordinate-reference information;
- time-stamped observations and reviewed temporal states;
- evidence and derived artifacts;
- AI model revisions and processing profiles;
- human review decisions and publication revisions.

This makes it possible to compare what was known at different moments, create reproducible datasets and benchmarks, test new analysis methods on archived incidents, and study how the documented understanding of a fire evolved without rewriting history with hindsight.

See [Replay and Post-Event Studies](docs/REPLAY_AND_POST_EVENT_STUDIES.md) and [Provenance and Reproducibility](docs/PROVENANCE_AND_REPRODUCIBILITY.md).

## AI-assisted analysis, with abstention

FireViewer can use computer-vision and multimodal models to help analyse private evidence. Model output is treated as a proposal or derived artifact, never as an automatically published fact.

The system is designed to preserve:

- detection and visual anchors;
- localisation attempts;
- uncertainty and contradictions;
- model and contract revisions;
- explicit reasons for abstention or failure.

When a defensible geometry cannot be produced, **abstention is a valid result**. Human review remains the publication boundary.

## Core components

| Component | Responsibility |
| --- | --- |
| **Frontend** | Contribution, incident exploration, review and 2D/3D presentation. |
| **Backend** | Incident registry, orchestration, audit, evidence, validation and publication. |
| **AI worker** | Private multimodal analysis, visual anchors, localisation attempts and abstention. |
| **Spatial** | Map generation, geographic packages, temporal perimeter layers and spatial contracts. |
| **SDG** | Optional synthetic-data and simulation research; not a runtime dependency of FireViewer core. |
| **Documentation** | Cross-repository architecture, contracts, safety boundaries, status and reproducibility rules. |

The canonical cross-project documentation lives in this repository. Technical implementation details remain in the repository responsible for each component.

## Current maturity

FireViewer already contains substantial implementation across the frontend, backend, AI worker and spatial pipeline, but it must not be presented as an operational emergency system. Local tests, working code paths and published models do not by themselves prove field accuracy, live-provider availability or operational safety.

The project tracks those distinctions explicitly in the [Status Matrix](docs/STATUS_MATRIX.md) and [Acceptance and Replay Matrix](docs/ACCEPTANCE_AND_REPLAY_MATRIX.md).

## What support would unlock

FireViewer is currently maintained as an independent project with very limited resources. The technical scope now exceeds what can be sustainably developed, validated and operated by one person without external support.

Support can have a direct, measurable effect on the project. Priority needs include:

- **compute credits** for GPU inference, model evaluation and controlled synthetic-data work;
- **CPU and storage credits** for map production, spatial packages, datasets and replay artifacts;
- **data and imagery partnerships** for better validation and reproducible research cases;
- **engineering and research collaboration** on geospatial processing, computer vision, wildfire science, benchmarking and reproducibility;
- **testing and validation support** from organisations able to review methodology and failure cases;
- **financial sponsorship or grants** that can fund infrastructure costs and sustained development time.

A contribution does not buy influence over scientific conclusions, incident validation or publication decisions. Provenance, uncertainty and safety boundaries remain part of the project regardless of the source of support.

See the concise [Funding Brief](docs/FUNDING_BRIEF.md) and the detailed [Support and Partnerships](docs/SUPPORT_AND_PARTNERSHIPS.md) guide.

## Useful starting points

- [Project Overview](docs/PROJECT_OVERVIEW.md)
- [Funding Brief](docs/FUNDING_BRIEF.md)
- [Architecture](docs/ARCHITECTURE.md)
- [Map Builder](docs/MAP_BUILDER.md)
- [Fire Evolution Timeline](docs/FIRE_EVOLUTION_TIMELINE.md)
- [Replay and Post-Event Studies](docs/REPLAY_AND_POST_EVENT_STUDIES.md)
- [Provenance and Reproducibility](docs/PROVENANCE_AND_REPRODUCIBILITY.md)
- [Support and Partnerships](docs/SUPPORT_AND_PARTNERSHIPS.md)
- [Roadmap](docs/ROADMAP.md)
- [Status Matrix](docs/STATUS_MATRIX.md)
- [Safety and Scope](docs/SAFETY_AND_SCOPE.md)

Models and datasets published by the project are available through the [FireViewer organisation on Hugging Face](https://huggingface.co/fireviewer).

## Contact

FireViewer is maintained by **Unicorn Who Dev**.

For research collaboration, infrastructure support, sponsorship discussions, provenance questions, security reports or data-removal requests: **unicornwhodev@gmail.com**.

No tax-deductibility, charitable status or institutional affiliation is implied by this repository. Any funding or partnership arrangement must use terms appropriate to the parties involved.

---

### Résumé en français

FireViewer est une infrastructure ouverte de **documentation des incendies, reconstruction spatiale, suivi temporel et étude reproductible après événement**. Le projet cherche à conserver non seulement une représentation finale, mais aussi les sources, dates, incertitudes, versions, décisions humaines et artefacts nécessaires pour comprendre et rejouer l'évolution documentée d'un incendie.

Le cœur du projet ne dépend plus de Unity ni d'Omniverse. La construction des cartes est réalisée par un pipeline headless déclenché par le backend. Omniverse peut subsister dans des travaux R&D de génération synthétique séparés, sans être une dépendance du produit principal.
