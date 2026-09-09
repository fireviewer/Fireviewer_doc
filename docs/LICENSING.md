# FireViewer licensing and citation

FireViewer uses explicit licences and provenance records. A repository location,
link or organisation name does not transfer ownership or replace the licence of
an external artifact.

## Public documentation repositories

| Repository | Executable code | Documentation and original non-code content |
| --- | --- | --- |
| `fireviewer/Fireviewer_doc` | AGPL-3.0-or-later for original executable scripts | CC BY 4.0 unless a file states otherwise |
| `fireviewer/.github` | Not applicable unless a file states otherwise | CC BY 4.0 for original organisation-profile and policy content |

Each private component repository contains, or must contain before external
distribution, its own licence and notices. A private repository is not
automatically proprietary, transferred or relicensed merely because access is
restricted.

## FireViewer component packages

The contracts, ingestion, vision, geolocation, supervisor, orchestrator, Fire
State and model-lab packages retain their applicable historical notices and
per-repository licences. Their technical allocation to the FireViewer
organisation records stewardship, not a retroactive assignment of every prior
copyright contribution.

The backend, frontend, FireViewer Docker composition, institutional website and
FireViewer-specific Unreal source follow their own repository notices and any
formal asset-transfer decisions adopted by the association.

## UWD Map Builder

The generic Map Builder is maintained by Unicorn Who Dev in
`unicornwhodev/map-builder`. Its root licence, directory notices and provenance
files define the scope of original UWD code, extracted compatible code and
third-party material.

FireViewer's right to use, integrate and retain outputs from the Map Builder is
governed by the applicable open-source terms and any written UWD/FIRE-VIEWER
agreement. Repository movement alone is not treated as a legal transfer.

## Models and datasets

Each hosted model or dataset retains:

- its own model or dataset-card licence;
- the terms of its base model where applicable;
- source-data rights and redistribution restrictions;
- attribution and share-alike obligations;
- its immutable revision and known limitations.

A registry entry is descriptive metadata, not a relicensing action.

## Geographic data and external assets

Terrain, orthophotography, satellite products, public imagery, articles,
third-party assets and software dependencies keep their original licences and
terms. FireViewer code and documentation licences must not be used to imply
ownership of those upstream resources.

## Citation

The canonical project citation metadata are stored in `CITATION.cff`.

When research uses a specific FireViewer model, dataset or spatial artifact,
cite the project and the exact resource revision where practical. Benchmark or
reproducibility claims should preserve the evaluated model, corpus, split,
environment and result artifact.

## Publication gate

A repository or release is not publication-ready until it states:

1. the licence of original executable code;
2. the licence of original documentation and non-code material;
3. exclusions for external data, models and assets;
4. the provenance location;
5. the steward or intended rights holder;
6. whether any transfer or usage agreement is actually signed.
