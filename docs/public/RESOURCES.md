# FireViewer resource status

This page defines how FireViewer describes models, datasets, measured maps,
synthetic material and retained historical artifacts. A resource does not become
active merely because a file, checkpoint or repository still exists.

The FireViewer Hugging Face organisation is authoritative for public artifact
visibility, cards and immutable revisions. The private
`fireviewer-model-lab/registry` is the canonical internal lifecycle registry.

## Status vocabulary

| Status | Meaning |
| --- | --- |
| **public reference** | Public and useful as a current reference; not automatically deployed or scientifically qualified. |
| **public research** | Public material intended for research or evaluation rather than production authority. |
| **measured map** | Real measured geographic production retained under a versioned map contract. |
| **synthetic** | Generated material kept explicitly separate from real-event evidence. |
| **restricted research** | Private material retained because of rights, research scope or redistribution constraints. |
| **legacy** | Superseded, incomplete or low-quality material kept only for provenance, comparison or recovery. |
| **upstream** | Third-party material referenced by source and revision and not redistributed unless rights permit it. |

## Public models

Public model cards may include FireViewer fire/smoke detectors such as:

- `fireviewer/rtdetr-v2-r50-fire-smoke`;
- `fireviewer/dfine-large-fire-smoke-v7`.

Public visibility does not make a model publication authority, prove current
runtime promotion or establish scientific qualification. The exact current
inventory must be read from the Hub rather than inferred from this page.

## Public datasets and hosted artifacts

Current or historical public resource families include:

| Resource | Role | Classification |
| --- | --- | --- |
| `fire-smoke-detection-corpus-v1` | Visible fire/smoke detection corpus | Public research/reference |
| `fire-smoke-pointing-ground-v1` | Ground pointing and grounding material | Public research |
| `dinov3-cross-view-fireviewer-v1-dataset` | Cross-view registration/localisation research | Public research |
| `prithvi-burnscars-training-dataset-v1` | Burn-scar segmentation research | Public research; burn scar is not active fire |
| `firewarning-train-bundles-v1` | Historical reproducible training packages | Legacy/public archive |
| `dataset-from-simulations` | Generated observations | Synthetic |
| `simple-measured-scenes-v1` | Versioned real measured geographic packages | Measured map |

Historical identifiers can remain where changing them would break provenance or
immutable links. They do not create a second active project.

## Measured maps

`simple-measured-scenes-v1` is the canonical hosted repository for retained real
measured-map builds.

Published directories, filenames and package paths can be consumed directly by
the viewer and are therefore compatibility-sensitive. A documentation cleanup
must not move, rename or flatten those paths. Structural changes require a
versioned migration and coordinated consumer updates.

A measured map describes geographic context. It does not assert wildfire
activity and must remain separate from dated incident layers and Fire State
calculations.

## Synthetic and historical material

Synthetic data can support training, testing and evaluation but cannot become
evidence of a real wildfire event. Superseded simulation chains and reproduction
packages are retained privately only when provenance, comparison or recovery
requires them. They are not active production components.

Independent reusable generation helpers can remain in `fireviewer-model-lab`
when they are still used and clearly isolated from real-event evidence.

## Restricted research

A dataset or checkpoint remains private when source rights do not support public
redistribution, when it contains private evidence or when a campaign is still
research-only. Private access never broadens upstream rights.

Restricted material must preserve:

- source and licence records;
- immutable revision or content hashes;
- intended task and split;
- known exclusions and limitations;
- access and retention decisions.

## Legacy model archive

Deprecated, superseded, incomplete and low-quality checkpoints are not listed as
active FireViewer models. When retention is useful, they belong in a private
legacy archive for provenance, reproducibility and comparison.

Production code must not consume a common legacy archive directly. Reactivation
requires rights review, evaluation under a current protocol and explicit
promotion into a dedicated release.

## Upstream models, data and assets

Third-party weights, datasets, geographic sources and assets are referenced by
provider, identifier and immutable revision whenever possible. They are not
copied into FireViewer storage merely for convenience when redistribution rights
are unclear or unnecessary.

## Resource status versus pipeline status

- a public model can remain unqualified for production;
- a private resource can still be useful research material;
- a legacy checkpoint can remain reproducible without being active;
- a measured map can be valid geography without asserting a fire state;
- a synthetic dataset can be useful without becoming real-world evidence.

## Update procedure

When an artifact changes:

1. verify its actual public/private visibility;
2. record its immutable revision;
3. classify it using this vocabulary;
4. review source rights and redistribution terms;
5. update the resource card without overstating deployment or qualification;
6. preserve compatibility-sensitive measured-map paths;
7. remove obsolete public promotion while retaining private provenance when
   justified.
