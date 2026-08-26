# Repository and publication guide

## Authoritative locations

- [FireViewer documentation](https://github.com/fireviewer/Fireviewer_doc) is the canonical public project description.
- [FireViewer on Hugging Face](https://huggingface.co/fireviewer) is authoritative for hosted model/dataset cards, weights, measured-map packages, immutable revisions and artifact visibility.
- Component repositories are authoritative for their code and machine-readable contracts.
- Incident evidence tickets and reviewed backend records are authoritative for the provenance of an incident-page claim.

No README proves that a service is deployed, enabled, funded, scientifically qualified or accepted on real data.

## Component map

| Component | Responsibility | GitHub visibility on 26 August 2026 |
| --- | --- | --- |
| [`Fireviewer_doc`](https://github.com/fireviewer/Fireviewer_doc) | Canonical architecture, safety, data governance, current status and resource/repository guides. | Public |
| [`fireviewer-ai-worker`](https://github.com/fireviewer/fireviewer-ai-worker) | Evidence acquisition, visual processing, satellite evidence, deterministic geographic hypotheses, event dossiers and point assessment. | Public |
| `fireviewer-backend` | Incident registry, durable evidence, review, audit, orchestration, Part.4 3.2 reconstruction/calibration and publication gates. | Private |
| `fireviewer-frontend` | Contribution, human review, incident exploration and 2D/3D interfaces. | Private |
| [`fireviewer-spatial`](https://github.com/fireviewer/fireviewer-spatial) | Deterministic measured-map production, portable spatial packages, observed temporal layers and validation contracts. | Public |
| [`fireviewer-sdg`](https://github.com/fireviewer/fireviewer-sdg) | Synthetic-data generation, simulation research and real/synthetic separation. | Public |
| `models` | Small machine-readable/narrative registry of the public Hugging Face snapshot and resource-status policy; no weights or datasets. | Private |
| [Organisation profile](https://github.com/fireviewer) | Public entry point and links to currently accessible resources. | Public |

Repository visibility is an access decision, not a maturity level.

## Hugging Face resource boundary

The authenticated organisation inventory inspected on 26 August 2026 exposes:

- **1 public model checkpoint**: `fireviewer/rtdetr-v2-r50-fire-smoke`;
- **8 public dataset repositories**.

This is a public-visibility snapshot, not a statement about every private research artifact or historical checkpoint.

Private/restricted resources are used when rights do not support public redistribution, when material is research-only, or when artifacts are retained only for provenance. Deprecated, superseded, incomplete and low-quality model checkpoints are consolidated in a private legacy archive when retained and are not part of the active public model list.

See [Resources](RESOURCES.md) for the classification rules.

## Measured maps

The canonical hosted repository for real measured map builds is:

[`fireviewer/simple-measured-scenes-v1`](https://huggingface.co/datasets/fireviewer/simple-measured-scenes-v1)

Published map paths are treated as compatibility-sensitive interfaces because the viewer and other consumers may resolve them directly. Documentation cleanup must **not** rename, move or reorganise existing map packages.

`fireviewer-spatial/reference/map-builder-reference-v1` is a validation/migration baseline, not a production map. It remains in place because moving it is unnecessary for documentation cleanup and could break references; documentation should simply classify it correctly.

Synthetic Omniverse datasets and historical reproduction packs are separate resources and must not be listed as measured maps.

## Historical names

Some code namespaces, Hub slugs, archive names and manifests still contain `firewarning`. These names are retained for compatibility and provenance. The active project identity is **FireViewer**.

Renaming a compatibility identifier is not a documentation cleanup task unless all consumers and immutable references have a migration path.

## Repository documentation standard

Every component README should state:

1. the component's role and non-goals;
2. its place in the evidence or spatial flow;
3. capabilities visible in the source;
4. the difference between implemented, guarded and accepted behaviour;
5. safe local validation commands where applicable;
6. security, privacy, provenance and licensing boundaries;
7. the canonical documentation and contact links;
8. whether any names/paths are compatibility-sensitive or legacy.

Operational runbooks, provider secrets, private evidence, machine-specific paths, internal roadmaps and raw validation logs do not belong in the public documentation set.

## Update rule

When code changes a public architectural contract, update the canonical documentation in the same release window. In particular, Part.4 documentation must use the current **3.2** nomenclature introduced by the provenance/calibration update rather than the earlier 3.1 label.
