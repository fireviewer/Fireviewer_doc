# Repository and publication guide

## Authoritative locations

- [FireViewer documentation](https://github.com/fireviewer/Fireviewer_doc) is
  the canonical public project description.
- [FireViewer on Hugging Face](https://huggingface.co/fireviewer) is
  authoritative for publicly visible model and dataset cards, hosted weights,
  revisions, and artifact visibility.
- Component repositories are authoritative for their code and machine-readable
  contracts.
- Incident evidence tickets and reviewed backend records are authoritative for
  the provenance of an incident-page claim.

No README proves that a service is deployed, enabled, funded, scientifically
qualified, or accepted on real data.

## Component map

| Component | Responsibility | Public GitHub availability on 24 August 2026 |
| --- | --- | --- |
| [`Fireviewer_doc`](https://github.com/fireviewer/Fireviewer_doc) | Canonical public documentation, licensing, safety, and status boundary. | Public |
| [`fireviewer-ai-worker`](https://github.com/fireviewer/fireviewer-ai-worker) | Evidence acquisition, visual processing, deterministic geographic hypotheses, optional provider adapters, dossier assembly, and point assessment. | Public |
| `fireviewer-backend` | Incident registry, durable evidence, review, audit, orchestration, authentication boundaries, and publication gates. | Private |
| `fireviewer-frontend` | Contribution, human review, incident exploration, and 2D/3D interfaces. | Private |
| [`fireviewer-spatial`](https://github.com/fireviewer/fireviewer-spatial) | Deterministic measured-map production, portable spatial packages, observed temporal layers, and validation contracts. | Public |
| [`fireviewer-sdg`](https://github.com/fireviewer/fireviewer-sdg) | Synthetic-data generation, simulation research, and real/synthetic separation. | Public |
| `models` | Small Git registry describing publicly visible Hugging Face resources; it does not host model weights or datasets. | Private |
| [Organisation profile](https://github.com/fireviewer) | Public entry point and links to currently accessible project resources. | Public |

Repository visibility is an access decision, not a maturity level. Private
components are included here to explain the architecture; their source is not
presented as publicly accessible.

## Public model and dataset snapshot

The unauthenticated Hugging Face API returned the following on 24 August 2026:

- **1 public model**: `fireviewer/rtdetr-v2-r50-fire-smoke`;
- **8 public dataset repositories**.

The model is a visual object detector. Its existence does not mean that it is
deployed, geographically localising, scientifically qualified, or authorised
to publish an incident.

The registry snapshot should always record immutable Hugging Face revisions.
Private, deleted, draft, or locally stored resources must not be inferred from
the public API.

## Repository documentation standard

Every component README should state:

1. the component's role and non-goals;
2. its place in the evidence flow;
3. the public capabilities visible in its source;
4. the difference between implemented, guarded, and accepted behavior;
5. safe local validation commands where applicable;
6. security, privacy, provenance, and licensing boundaries;
7. the canonical documentation and contact links.

Operational runbooks, resource identifiers, private evidence, provider tokens,
machine paths, internal roadmaps, and raw validation logs do not belong in the
public documentation set.
