# FireViewer

**Evidence-centred infrastructure for documenting, reviewing, mapping, and
studying wildfire events.**

FireViewer is an independent research and engineering project maintained by
**Unicorn Who Dev**. It combines public sources, contributed media, official
geographic products, deterministic spatial calculations, machine-assisted
analysis, and human review while keeping provenance and uncertainty visible.

> FireViewer is not an emergency alert service, an official wildfire source,
> an incident-command tool, or a certified fire-propagation predictor. In an
> emergency, follow the relevant authorities and emergency services.

## Purpose

Wildfire information is fragmented across official bulletins, press reports,
photos, videos, satellite products, maps, and first-hand contributions.
FireViewer is designed to preserve the relationship between a published claim
and the evidence used to support it.

The project aims to provide:

- incident pages with source-backed facts and clearly dated revisions;
- visual and geographic evidence with immutable provenance references;
- candidate fire points with uncertainty, contradiction, and review status;
- temporal geographic layers that distinguish observations from reconstruction;
- reproducible spatial packages for public exploration and post-event study;
- explicit abstention whenever the available evidence is insufficient.

## System at a glance

```text
public sources + user-authorised media + official geographic products
                              |
                              v
                 acquisition and normalisation
                              |
                              v
        visual observations + deterministic geographic hypotheses
                              |
                              v
             versioned EventEvidence and event memory
                              |
                              v
          compact point dossier + multimodal assessment
                              |
                              v
                policy gate and human review
                              |
                              v
       versioned incident facts and spatial representations
```

Detectors can identify visual regions, but they do not create geographic
truth. Candidate coordinates come from a separate deterministic geographic
stage using the documented camera position, orientation and field of view when
available, terrain, map references, satellite observations, and prior event
states. A multimodal model may assess a candidate; it may not silently replace
its coordinates.

Read the [public architecture](docs/public/ARCHITECTURE.md) for the complete
component and trust-boundary view.

## Public documentation

| Document | Scope |
| --- | --- |
| [Architecture](docs/public/ARCHITECTURE.md) | Components, data flow, provider boundaries, and separation from map production. |
| [Evidence and review](docs/public/EVIDENCE_AND_REVIEW.md) | Evidence contracts, geographic candidates, model arbitration, and publication policy. |
| [Data governance](docs/public/DATA_GOVERNANCE.md) | Retention, provenance, rights, privacy, and removal requests. |
| [Map Builder](docs/public/MAP_BUILDER.md) | Provider-neutral production contract, tiled viewer, resumable workers, and publication boundary. |
| [Current status](docs/public/STATUS.md) | Implemented capabilities, guarded integrations, and remaining acceptance gaps. |
| [Repository guide](docs/public/REPOSITORIES.md) | Repository roles, current public availability, and authoritative sources. |
| [Funding and collaboration](docs/FUNDING_BRIEF.md) | Ways to support or collaborate with the project. |
| [Licensing and citation](docs/LICENSING.md) | Code, documentation, model, dataset, and upstream-asset licensing boundaries. |
| [Documentation policy](docs/REPOSITORY_DOCUMENTATION_POLICY.md) | Rules for public documentation and local working material. |

Model cards, dataset cards, weights, and hosted artifacts are published through
the [FireViewer Hugging Face organisation](https://huggingface.co/fireviewer).
GitHub documentation never overrides the licence or limitations of an upstream
resource.

## Current maturity

FireViewer is an active research MVP. Core contracts, evidence services,
geographic hypothesis generation, source-acquisition components, review
surfaces, and spatial tooling exist. Several cloud adapters and scale-to-zero
service shells have also been prepared or deployed behind safeguards.

The complete real-data path has **not** yet been qualified as an unattended
production pipeline. Publication features remain guarded, optional GPU stages
are not assumed to be running, and missing camera or satellite evidence must
produce uncertainty or abstention. See the dated [status page](docs/public/STATUS.md)
for the precise boundary.

## Core principles

- Preserve source, time, rights, revision, hash, and uncertainty.
- Separate observation, claim, reconstruction, simulation, and prediction.
- Keep raw third-party content only as long as needed for bounded processing.
- Never treat a detector box as a geographic coordinate.
- Never let a simulated model output become publication-eligible.
- Keep the original point JSON immutable; a proposed correction is a competing
  JSON object with its own evidence and review trail.
- Prefer `abstain` to a precise-looking answer unsupported by evidence.

## Contact

For research collaboration, infrastructure support, security reports,
provenance questions, rights concerns, or data-removal requests, contact
**unicornwhodev@gmail.com**.
