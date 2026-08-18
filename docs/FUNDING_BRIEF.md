# FireViewer — Funding Brief

This page is a concise, reusable description for grant applications, infrastructure programmes, sponsorship discussions and research-partnership introductions.

For application forms that require multiple summary lengths, milestones, budget categories and reusable answers, see the [Funding Application Kit](FUNDING_APPLICATION_KIT.md).

## One-sentence description

**FireViewer is an open-source platform for documenting wildfire observations, building reproducible spatial references, tracking reviewed fire states over time and enabling replayable post-event research.**

## Short project summary

Wildfire information is fragmented across ground imagery, satellite products, public reports, terrain data and retrospective maps. FireViewer brings these sources into a provenance-aware workflow that keeps observation, reconstruction, simulation and uncertainty distinct. A headless map builder produces portable geographic scene packages; AI-assisted analysis proposes detections and localisation while preserving abstention; human review controls publication; immutable spatial and temporal artifacts allow an incident to be replayed and studied later without rewriting historical knowledge.

## Problem addressed

Existing wildfire information is often difficult to reuse for research because:

- sources arrive at different times and spatial resolutions;
- derived products are easily confused with direct observations;
- screenshots do not preserve geometry, provenance or uncertainty;
- later information can overwrite what was actually known at the time;
- AI systems can appear precise even when they lack defensible geometry;
- reproducible post-event datasets require far more context than a final perimeter alone.

## FireViewer's approach

FireViewer combines:

1. an evidence and provenance registry;
2. a headless endpoint-driven geographic map builder;
3. AI-assisted analysis with explicit abstention;
4. human-reviewed temporal fire states;
5. immutable packages for replay, datasets and post-event studies.

The core runtime does not depend on Unity or NVIDIA Omniverse. Omniverse can remain part of optional synthetic-data research only.

## Current technical foundation

The project already contains:

- a React/TypeScript frontend for contribution, review and incident exploration;
- backend primitives for stable incident identity, evidence, audit, orchestration and publication;
- a private AI worker with event bundles, model stages, localisation attempts and abstention contracts;
- a spatial pipeline that produces OpenUSD/Blender map packages on a Lambert-93 tile grid;
- temporal perimeter package tooling;
- FireViewer models and datasets published through the FireViewer Hugging Face organisation;
- cross-repository contracts for safety, provenance and replay.

These components are at different validation levels. FireViewer does not claim operational emergency readiness.

## Funding objective

The immediate objective is to move from a strong independently developed technical base to a **reproducible and externally reviewable research platform**.

Priority funded outputs are:

- one canonical map-build campaign with archived metrics and independent reopening;
- one fully replayable reference incident;
- a fixed localisation/abstention benchmark with failure analysis;
- deployed validation of selected external data connectors;
- durable storage, backup and recovery evidence for large artifacts;
- several public post-event technical case studies.

## Use of support

Support may fund or provide:

| Category | Typical use |
| --- | --- |
| GPU compute | model evaluation, localisation benchmarks, controlled SDG experiments |
| CPU compute | headless map production and spatial validation |
| Object storage | immutable map, timeline, dataset and replay packages |
| Bandwidth | delivery and independent reproduction of large artifacts |
| Engineering time | integration, reliability, security, documentation and replay tooling |
| Domain expertise | wildfire science, GIS, remote sensing and methodology review |
| Evaluation data | held-out retrospective cases suitable for reproducible validation |

## Expected measurable outputs

Depending on the support programme, progress can be reported through evidence such as:

- number of reproducible map builds completed and independently reopened;
- map-build runtime, storage and failure metrics from archived runs;
- number of replay artifacts passing integrity checks;
- benchmark cases and fixed incident-level splits;
- localisation error and abstention metrics where defensible targets exist;
- live source connectors validated with provenance/licence records;
- documented backup/recovery exercises;
- published technical case studies and reproducibility instructions.

The project deliberately prefers these measurements over vanity metrics such as raw screenshot count or unqualified model scores.

## Public-interest value

FireViewer can contribute to open technical work in:

- reproducible wildfire research;
- geospatial evidence fusion;
- remote-sensing methodology;
- computer-vision evaluation under uncertainty;
- post-event analysis;
- transparent distinction between direct observation and reconstruction;
- reusable benchmark and dataset methodology.

## Safety boundaries

FireViewer is not:

- an emergency alert service;
- an official wildfire information source;
- a command-and-control system;
- a certified propagation forecast;
- an automatic fire-confirmation service.

Automated outputs remain proposals until the required human review. Simulation and reconstruction remain distinct from observation.

## Independence

A sponsor, infrastructure provider or research partner does not gain authority over scientific conclusions, incident validation or publication decisions.

Support may be acknowledged where appropriate, but FireViewer's provenance and uncertainty rules remain unchanged.

## Project structure

FireViewer is currently an independent project maintained by **Unicorn Who Dev**. This repository does not claim charitable status, tax-deductible donations or institutional affiliation.

Funding mechanisms must therefore be selected according to the eligibility and legal requirements of each programme or partner.

## Contact

**unicornwhodev@gmail.com**

Useful references:

- [Funding Application Kit](FUNDING_APPLICATION_KIT.md)
- [Project Overview](PROJECT_OVERVIEW.md)
- [Architecture](ARCHITECTURE.md)
- [Roadmap](ROADMAP.md)
- [Status Matrix](STATUS_MATRIX.md)
- [Support and Partnerships](SUPPORT_AND_PARTNERSHIPS.md)
