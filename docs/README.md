# FireViewer Documentation

This directory is the canonical cross-project documentation for FireViewer.

## Public and development documentation

| Scope | Canonical location |
| --- | --- |
| Public project narrative, architecture, safety, status, contracts and roadmap | This `fireviewer_doc` repository |
| Component setup, implementation notes, audits, tests and operational runbooks | The `docs/` directory of the repository that owns the component |

Component repositories link back here instead of copying the public narrative. See the [Repository Documentation Policy](REPOSITORY_DOCUMENTATION_POLICY.md) for the complete rule.

## Start here

| Document | Purpose |
| --- | --- |
| [Project Overview](PROJECT_OVERVIEW.md) | What FireViewer is, the problem it addresses and why the architecture matters. |
| [Architecture](ARCHITECTURE.md) | Canonical cross-repository technical architecture. |
| [Roadmap](ROADMAP.md) | Evidence-based technical milestones and sustainability priorities. |
| [Status Matrix](STATUS_MATRIX.md) | What is implemented, locally tested, live-validated, benchmarked or still pending. |
| [Safety and Scope](SAFETY_AND_SCOPE.md) | Non-goals, safety boundaries and publication principles. |

## Models, datasets and evaluation

| Document | Purpose |
| --- | --- |
| [Models, Datasets and Benchmarks](MODELS_DATASETS_BENCHMARKS.md) | Active FireViewer checkpoints, current/restricted/legacy dataset relationships, benchmark evidence and qualification rules. |

Hugging Face is the canonical publication location for FireViewer model weights, model cards and dataset cards. The [`fireviewer/models`](https://github.com/fireviewer/models) repository provides the detailed Hub inventory and machine-readable lifecycle registries.

## Funding, grants and partnerships

| Document | Purpose |
| --- | --- |
| [Funding Brief](FUNDING_BRIEF.md) | Short English project/funding brief. |
| [Brief financement — FR](FUNDING_BRIEF_FR.md) | Version française pour appels à projets et prises de contact. |
| [Funding Application Kit](FUNDING_APPLICATION_KIT.md) | Reusable 1-line/50/100/250-word summaries, milestones, budget categories and application answers. |
| [Support and Partnerships](SUPPORT_AND_PARTNERSHIPS.md) | Concrete support needs, collaboration formats and independence safeguards. |

## Spatial and temporal core

| Document | Purpose |
| --- | --- |
| [Map Builder](MAP_BUILDER.md) | Canonical headless endpoint-driven map-production path. |
| [Fire Evolution Timeline](FIRE_EVOLUTION_TIMELINE.md) | Observed/reconstructed/simulated semantics and unknown intervals. |
| [Replay and Post-Event Studies](REPLAY_AND_POST_EVENT_STUDIES.md) | Replay model and reproducible retrospective studies. |
| [Provenance and Reproducibility](PROVENANCE_AND_REPRODUCIBILITY.md) | Source, processing, model and human-decision provenance. |
| [Storage and Retention](STORAGE_AND_RETENTION.md) | Durable artifacts, temporary work data, recovery and storage policy. |

## Contracts and acceptance

| Document | Purpose |
| --- | --- |
| [Contract Map](CONTRACT_MAP.md) | Cross-repository producer/consumer boundaries and versions. |
| [Acceptance and Replay Matrix](ACCEPTANCE_AND_REPLAY_MATRIX.md) | Evidence required before capability promotion. |
| [External Source Connectors](EXTERNAL_SOURCE_CONNECTORS.md) | Rules and boundaries for external data/source integration. |
| [Migration and Feature Flags](MIGRATION_AND_FEATURE_FLAGS.md) | Additive v1/v2 migration details; implementation flags are not product doctrine. |
| [Security and Privacy](SECURITY_PRIVACY_EVENT_PIPELINE.md) | Private evidence, identities, permissions, retention and security gates. |

## Project consistency

| Document | Purpose |
| --- | --- |
| [Terminology](TERMINOLOGY.md) | Canonical vocabulary used across repositories. |
| [Repository Documentation Policy](REPOSITORY_DOCUMENTATION_POLICY.md) | Keeps component repositories clean and avoids duplicated project narratives. |
| [Licensing and Citation](LICENSING.md) | Cross-repository licence scopes, external-artifact boundary and canonical citation metadata. |
| [Simulation and Dataset Consumer Boundary](SIMULATION_COMPOSITION_RESTART.md) | Compatibility note: simulation/datasets are downstream consumers, not FireViewer core. |

The canonical project citation is also available directly as [`../CITATION.cff`](../CITATION.cff).

## Core positioning

FireViewer is open infrastructure for **wildfire observation, spatial reconstruction, temporal tracking and reproducible post-event analysis**.

The core map-production path is headless and endpoint-driven. Unity and NVIDIA Omniverse are not FireViewer core dependencies. Omniverse can remain part of optional synthetic-data research in `fireviewer-sdg`.

```text
observed ≠ reconstructed ≠ interpolated ≠ simulated ≠ predicted
```

FireViewer is not an emergency alert service, an official wildfire source, a command system or a certified propagation predictor.
