# Repository and publication guide

## Authoritative locations

- [FireViewer documentation](https://github.com/fireviewer/Fireviewer_doc) is the canonical public project description.
- [FireViewer on Hugging Face](https://huggingface.co/fireviewer) is authoritative for hosted model/dataset cards, weights, measured-map packages, immutable revisions and artifact visibility.
- Component repositories are authoritative for their code and machine-readable contracts.
- Incident evidence tickets and reviewed backend records are authoritative for the provenance of an incident-page claim.

No README proves that a service is deployed, enabled, funded, scientifically qualified or accepted on real data.

## Component map

| Component | Responsibility | GitHub visibility on 4 September 2026 |
| --- | --- | --- |
| [`.github`](https://github.com/fireviewer/.github) | Organisation profile and shared contribution, conduct, security and support policies. | Public |
| [`Fireviewer_doc`](https://github.com/fireviewer/Fireviewer_doc) | Canonical architecture, safety, data governance, current status and resource/repository guides. | Public |
| [`fireviewer-ai-worker`](https://github.com/fireviewer/fireviewer-ai-worker) | Evidence acquisition, visual processing, satellite evidence, deterministic geographic hypotheses, event dossiers and point assessment. | Public |
| `fireviewer-backend` | Incident registry, durable evidence, review, audit, orchestration, Part.4 3.3 reconstruction/calibration and publication gates. | Private |
| `fireviewer-frontend` | Contribution, human review, incident exploration and 2D/3D interfaces. | Private |
| [`fireviewer-spatial`](https://github.com/fireviewer/fireviewer-spatial) | Deterministic measured-map production, portable spatial packages, observed temporal layers and validation contracts. | Public |
| `fireviewer-unreal` | Source-only Unreal Engine consumer prepared locally for portable map contracts, guarded map assembly and local visual review. Its publication is paused; it contains no Unreal content library, dataset, model or generated reproduction. | Local only; not published |
| [`fireviewer-sdg`](https://github.com/fireviewer/fireviewer-sdg) | Synthetic-data generation, simulation research and real/synthetic separation. | Public |
| `models` | Small machine-readable/narrative registry of the public Hugging Face snapshot and resource-status policy; no weights or datasets. | Private |
| [Organisation profile](https://github.com/fireviewer) | Public entry point and links to currently accessible resources. | Public |

Repository visibility is an access decision, not a maturity level.

## Hugging Face resource boundary

The anonymous public organisation inventory inspected on 4 September 2026 exposes:

- **2 public model checkpoints**: `fireviewer/rtdetr-v2-r50-fire-smoke` and `fireviewer/dfine-large-fire-smoke-v7`;
- **7 public dataset repositories**.

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

Git repositories are source-only publication surfaces. Datasets, weights,
checkpoints, imported 3D assets, measured-map packages and reproduction outputs
remain outside Git. One fully synthetic incident configuration fixture is kept
in the local, unpublished `fireviewer-unreal` working tree to document the
JSON/GeoJSON contract without publishing real incident data. See
[Repository hygiene](REPOSITORY_HYGIENE.md).

## Community and governance

FireViewer is currently small, so project-wide community policies are kept in one place rather than copied and slowly diverging across every repository.

Shared policies:

- [Contributing](https://github.com/fireviewer/.github/blob/main/CONTRIBUTING.md)
- [Code of Conduct](https://github.com/fireviewer/.github/blob/main/CODE_OF_CONDUCT.md)
- [Security](https://github.com/fireviewer/.github/blob/main/SECURITY.md)
- [Support](https://github.com/fireviewer/.github/blob/main/SUPPORT.md)

Technical governance is documented in [`GOVERNANCE.md`](../../GOVERNANCE.md).

FireViewer currently uses maintainer-led technical governance.

A French non-profit association is being created to provide administrative and financial stewardship. It does not replace the technical governance model unless a later public decision explicitly changes that structure.

Repositories with a component-specific security note may retain a local `SECURITY.md`, but it should point back to the project-wide policy rather than define a separate incompatible process.

## Update rule

When code changes a public architectural contract, update the canonical documentation in the same release window. As of 4 September 2026, the current Part.4 line is **3.3**, adding dated administrative initialization and restorable state chains to the earlier provenance/calibration implementation. See [Daily reconstruction](RECONSTRUCTION.md) for its qualification boundary.
