# FireViewer — Support and Partnerships

FireViewer is an independent open-source research and engineering project. It is currently maintained with limited personal resources, while the cost of compute, storage, validation and sustained engineering continues to grow with the technical scope of the project.

This document explains **what kind of support is useful, what it would fund and which safeguards remain non-negotiable**.

## Why support is needed

FireViewer already has working implementation across its spatial, backend, frontend and AI components. The next steps are less about adding another isolated feature and more about proving that the system can be reproduced, validated and maintained responsibly.

The main constraints are now:

- repeated CPU-heavy map-production jobs;
- GPU inference and benchmark runs;
- durable storage for immutable scene packages, datasets and replay artifacts;
- validation of external geographic and remote-sensing sources;
- independent review of spatial and AI failure cases;
- deployment, monitoring and backup costs;
- time required to maintain several repositories, contracts and datasets coherently.

For a single independent maintainer, these costs directly limit how quickly FireViewer can move from a strong technical prototype to a well-documented and independently reproducible research platform.

## Forms of support that help

### Infrastructure credits

Useful support includes:

- GPU compute credits;
- CPU batch-compute credits;
- object-storage credits;
- bandwidth and artifact-delivery credits;
- CI/CD and observability credits;
- access to suitable test hardware or temporary high-memory machines.

These contributions are particularly useful because they can be tied directly to reproducible technical milestones.

### Research and engineering collaboration

FireViewer is open to collaboration in areas such as:

- wildfire science;
- remote sensing;
- GIS and geodesy;
- photogrammetry and cross-view localisation;
- computer vision;
- uncertainty calibration;
- reproducible ML evaluation;
- data provenance and scientific archiving;
- frontend geospatial visualisation;
- infrastructure and reliability engineering.

A collaboration can be limited to a narrow technical question. It does not require adopting the whole FireViewer stack.

### Data and validation partnerships

Partnerships can also contribute through:

- access to legally reusable imagery or geographic products;
- reference incidents suitable for retrospective study;
- validation feedback from domain experts;
- review of source attribution and data-licensing constraints;
- independent evaluation datasets kept outside the training corpus.

FireViewer is especially interested in material that improves **evaluation and reproducibility**, not only model training.

### Financial sponsorship and grants

Direct financial support can fund:

- infrastructure invoices;
- longer benchmark campaigns;
- storage of reproducible public artifacts;
- development time for core maintenance and documentation;
- security and deployment hardening;
- external expertise or independent review where appropriate.

FireViewer does not currently claim charitable status, tax deductibility or institutional affiliation. Organisations interested in financial support should contact the maintainer so that an appropriate mechanism can be agreed before funds are committed.

## Priority funding targets

Support is most valuable when attached to concrete outputs. Current priorities are:

| Priority | What support enables | Verifiable output |
| --- | --- | --- |
| **Canonical map builder** | CPU compute, storage, deployment testing | Reproducible headless map builds with preserved provenance and validation receipts |
| **Reference replay incident** | storage, engineering time, data review | One incident that can be reopened from immutable spatial, temporal and evidence artifacts |
| **Localisation benchmark** | GPU compute, independent cases, expert review | Published benchmark methodology, metrics, failure analysis and abstention behaviour |
| **Temporal fire layers** | engineering and geospatial review | Versioned observed/reconstructed timeline packages with unknown intervals preserved |
| **Infrastructure hardening** | hosting credits, observability, backup | Reproducible deployment recipe, monitoring and recovery evidence |
| **Public technical case studies** | engineering and documentation time | Clear post-event studies showing what FireViewer can and cannot conclude |

## What support does not buy

Financial or infrastructure support does **not** grant authority over incident validation or technical conclusions.

The following principles remain unchanged:

- automated model output is not published as fact without the required review;
- provenance is not removed to satisfy a partner;
- uncertainty is not hidden to make a result look stronger;
- simulated or reconstructed data are not relabelled as observations;
- benchmark results are not selectively reported to favour a sponsor or provider;
- FireViewer is not presented as an emergency-response product without evidence and qualification that do not currently exist.

## For cloud and infrastructure providers

A useful infrastructure partnership can be modest. FireViewer can work with bounded grants or credits attached to a specific technical objective, for example:

```text
€ / credits
   ↓
map-production runs
   ↓
validated immutable packages
   ↓
public methodology + reproducibility report
```

or:

```text
GPU credits
   ↓
fixed benchmark corpus
   ↓
model comparison + abstention analysis
   ↓
archived benchmark report
```

This makes it possible to show what a contribution enabled without converting the project into promotional material.

## For universities and research groups

Potential collaboration formats include:

- independent benchmark design;
- student projects on bounded components;
- retrospective incident studies;
- geospatial-validation work;
- reproducibility audits;
- dataset methodology reviews;
- comparisons with established academic baselines.

FireViewer can expose contracts, code and reproducible artifacts while keeping sensitive or restricted source material outside public repositories when required.

## For public-interest and wildfire organisations

The project is particularly interested in feedback on:

- which retrospective questions are genuinely useful;
- which uncertainty representations are understandable and honest;
- how to avoid confusing observed, reconstructed and simulated fire states;
- what evidence is necessary for a useful post-event technical reconstruction;
- which outputs would help researchers without creating an unsafe operational impression.

## Transparency

When a material contribution directly enables a public FireViewer artifact, the project should document that support where appropriate while keeping technical conclusions independent.

A future public funding ledger may record infrastructure grants, sponsorships and their associated technical milestones once stable funding channels exist. This repository intentionally does not invent or advertise a donation mechanism that has not actually been configured.

## Contact

For grants, infrastructure programmes, sponsorship, research collaboration or technical support:

**unicornwhodev@gmail.com**

When contacting the project, it is useful to include:

- the organisation or programme;
- the type of support available;
- any eligibility or reporting constraints;
- the expected duration;
- whether publication or attribution is required;
- a technical contact when relevant.
