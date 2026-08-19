# FireViewer — licensing and citation

FireViewer uses explicit per-repository licences. A link to a model, dataset, geographic source or third-party asset never transfers or replaces the licence of that external artifact.

## Repository licensing matrix

| Repository | Code / executable files | Documentation / non-code content |
| --- | --- | --- |
| `fireviewer-frontend` | AGPL-3.0-or-later | CC BY 4.0 |
| `fireviewer-backend` | AGPL-3.0-or-later | CC BY 4.0 |
| `fireviewer-ai-worker` | AGPL-3.0-or-later | CC BY 4.0 |
| `fireviewer-spatial` | AGPL-3.0-or-later | CC BY 4.0 |
| `fireviewer-sdg` | AGPL-3.0-or-later | CC BY 4.0 |
| `Fireviewer_doc` | AGPL-3.0-or-later for original executable scripts | CC BY 4.0 |
| `models` | no model weights are hosted here; repository content is an index | CC BY 4.0 for original docs and registry metadata |
| `.github` | n/a | CC BY 4.0 for original organisation-profile content |

The component repositories contain their own `LICENSE` / documentation-licence files. The documentation repository uses a scoped root [`LICENSE`](../LICENSE), [`LICENSE-CODE.md`](../LICENSE-CODE.md) and [`LICENSE-DOCS.md`](../LICENSE-DOCS.md).

## Models and datasets

The `fireviewer/models` GitHub repository does **not** grant a common licence to the models and datasets it references.

Each Hugging Face model or dataset retains:

- its own model/dataset-card licence;
- the terms of its base model where applicable;
- the rights and redistribution restrictions of the training/evaluation sources;
- any attribution or share-alike requirements attached to upstream material.

A FireViewer registry entry is descriptive metadata, not a relicensing action.

## External geographic data and assets

MNT/MNS, orthophotography, remote-sensing products, imagery, third-party assets and other external sources keep their original licences and attribution requirements.

FireViewer provenance records are intended to preserve those relationships. Generated FireViewer code or documentation licences must never be used to imply ownership of an upstream geographic or visual source.

## Citation

The canonical project citation metadata are stored in [`CITATION.cff`](../CITATION.cff).

When research uses a specific FireViewer model, dataset or spatial artifact, cite the FireViewer project **and** the exact repository/revision used where practical. Benchmark or reproducibility claims should also preserve the exact artifact/model revision and evaluation context.

## Rule for new repositories

A new public FireViewer repository should not be considered publication-ready until it states:

1. the licence of original executable code;
2. the licence of original documentation/non-code content;
3. whether external data/assets are excluded from those licences;
4. where the canonical provenance/rights information lives.
