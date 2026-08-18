# FireViewer — Project Overview

## Mission

FireViewer is an independent open-source research and engineering project focused on **wildfire observation, spatial reconstruction, temporal tracking and reproducible post-event analysis**.

The project addresses a practical problem: information about a wildfire is rarely produced by one system or at one resolution. Ground photographs, videos, satellite detections, public reports, orthophotography, terrain data and retrospective maps all describe different parts of the same event, often at different times and with different levels of confidence.

FireViewer aims to preserve those differences rather than flatten them into a single opaque map.

Its long-term value is not only to display an incident while it is active, but to preserve enough technical context that the incident can later be **reopened, compared, audited and studied reproducibly**.

## The problem

Wildfire information is difficult to reuse reliably because several kinds of uncertainty are usually mixed together:

- the location of the observer is not the location of the fire;
- a visible smoke column does not define a fire perimeter;
- a thermal hotspot is not the same object as an active front;
- a burned-area product is not an instantaneous activity map;
- a retrospective reconstruction is not a direct observation;
- a simulation is not a prediction and neither is an observation;
- screenshots and mutable web maps are poor archival formats for later scientific comparison.

FireViewer treats these distinctions as part of the data model.

## The approach

The project combines five technical layers.

### 1. Evidence and provenance

Each contribution or external source is associated with its time, source, rights, hashes and processing history. Derived artifacts keep references to their parents.

### 2. Spatial reference generation

A headless map-production pipeline builds a reproducible geographic scene from measured geographic inputs. The current path processes terrain on a Lambert-93 grid of 500 m tiles and creates portable OpenUSD and Blender scene packages.

The map builder is executed through a production endpoint and is independent from Unity or Omniverse.

### 3. AI-assisted analysis

Computer-vision and multimodal models can assist with detection, visual anchoring, structured extraction and localisation attempts. Their outputs remain private proposals until reviewed.

FireViewer explicitly supports abstention when the evidence is insufficient for a defensible spatial result.

### 4. Human-reviewed temporal states

Validated observations and reconstructed states are organised along a timeline while preserving their semantic class. Unknown intervals remain unknown.

### 5. Replay and post-event study

A replay binds an exact map build, temporal states, evidence, model revisions, processing parameters and human decisions. This allows later research without silently replacing historical knowledge with newer information.

## Technical flow

```text
sources / contributions
        │
        ▼
provenance + evidence
        │
        ├────► AI analysis
        │         │
        │         ▼
        │    localisation or abstention
        │
        ▼
human review
        │
        ├────► reviewed temporal states
        │
        ▼
immutable map build
        │
        ▼
versioned incident representation
        │
        ├────► public exploration
        ├────► replay
        ├────► datasets
        └────► benchmarks / post-event studies
```

## What exists today

FireViewer is not a slide-deck concept. The project already contains implementation across several specialised repositories:

- a React/TypeScript frontend for contribution, review and public incident exploration;
- a backend with incident identity, evidence, audit, review and orchestration primitives;
- an AI worker with event bundles, model stages, localisation attempts and abstention contracts;
- a spatial pipeline able to generate portable geographic scene packages and temporal perimeter layers;
- synthetic-data and simulation R&D kept separate from the production core;
- published FireViewer models and datasets on Hugging Face.

At the same time, FireViewer is **not** represented as an operational emergency product. Live-provider validation, field accuracy, deployment resilience and full replay qualification remain separate gates.

The exact state of each capability is maintained in the [Status Matrix](STATUS_MATRIX.md).

## What makes the project technically distinctive

### Reproducibility before presentation

The project treats a visualisation as a derived view, not the canonical scientific object. Spatial packages, timelines, hashes and provenance remain available independently from the browser rendering path.

### Spatial and temporal separation

Terrain does not need to be rebuilt each time a new observation arrives. A temporal fire layer can be attached to the same immutable map build.

### Explicit unknowns

FireViewer does not silently interpolate between two observations. Missing information is represented as missing information.

### Human validation as a boundary

Models can propose; they do not publish. Fact validation, geometry validation and publication are separate actions.

### Post-event value

A completed incident can become a reproducible research object for method comparison, dataset creation, model evaluation and retrospective study.

## Potential beneficiaries

FireViewer may be useful to several communities, provided its safety boundaries are respected:

- wildfire and environmental researchers;
- geospatial and remote-sensing researchers;
- computer-vision and multimodal-AI researchers;
- open-data and reproducibility projects;
- universities and educational programmes;
- public-interest technology organisations;
- organisations building retrospective datasets or benchmarks;
- technical teams studying geospatial evidence fusion.

FireViewer does not position itself as a substitute for official emergency systems.

## Why external support matters now

The project has reached a stage where the main limitation is no longer the absence of ideas or a prototype architecture. The limiting factors are increasingly **infrastructure, validation capacity, sustained engineering time and access to expertise**.

The highest-value next steps require resources that are difficult for a single independent maintainer to absorb indefinitely:

- repeated map-production runs on real geographic areas;
- GPU evaluation of several model families;
- storage of immutable spatial and replay artifacts;
- independent benchmark and failure-case review;
- validation of external data connectors and licences;
- resilient deployment and observability;
- structured post-event case studies.

This is why the project is actively preparing for grants, infrastructure programmes, research partnerships and sponsorship discussions.

## Near-term objectives

The current programme is organised around practical gates rather than promises of operational deployment:

1. consolidate the headless map builder as the canonical spatial production path;
2. complete the observed/reconstructed fire-evolution timeline contracts;
3. produce one fully replayable reference incident with immutable artifacts;
4. validate provenance and storage boundaries on deployed infrastructure;
5. benchmark localisation and abstention on independent cases;
6. publish clear reproducibility material and technical case studies;
7. reduce single-maintainer infrastructure risk through partnerships and support.

See the [Roadmap](ROADMAP.md) for the detailed sequence.

## Independence and safety

Support does not change FireViewer's evidence rules. A sponsor, cloud provider or research partner does not gain authority to validate an incident or alter a scientific conclusion.

FireViewer remains explicit about what it is not:

- not an emergency-alert service;
- not an official wildfire information source;
- not a command-and-control tool;
- not a certified forecasting system;
- not an insurance or legal evidence service.

These boundaries are documented in [Safety and Scope](SAFETY_AND_SCOPE.md).

## Contact

For research collaboration, infrastructure support, sponsorship discussions or technical partnerships:

**unicornwhodev@gmail.com**

No charitable, tax-deductible or institutional status is implied. Funding mechanisms must be agreed according to the legal status and requirements of the parties involved.
