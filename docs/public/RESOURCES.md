# FireViewer resource status

**Snapshot: 26 August 2026.**

This page defines how FireViewer describes models, datasets, maps, simulations and retained historical artifacts. It prevents a resource from becoming "active" merely because a file, checkpoint or repository still exists.

## Status vocabulary

| Status | Meaning |
| --- | --- |
| **public reference** | Publicly visible and documented resource that remains useful as a current reference. This does not by itself mean deployed or scientifically qualified. |
| **public research** | Public dataset or artifact useful for research/evaluation but not an operational runtime dependency by default. |
| **measured map** | Real measured geographic production retained under a versioned map contract. |
| **synthetic** | Generated or simulated material that must remain explicitly separate from real-event evidence. |
| **restricted research** | Private resource kept private because of rights, research scope or redistribution constraints. |
| **legacy** | Deprecated, superseded, incomplete or low-quality artifact retained only for provenance, comparison or reproducibility. |
| **upstream** | Third-party resource referenced by immutable source/revision and not redistributed by FireViewer unless rights permit it. |

## Public Hugging Face snapshot

The authenticated FireViewer organisation inventory inspected on 26 August 2026 exposes **1 public model** and **8 public datasets**.

### Public model

| Resource | Role | FireViewer status |
| --- | --- | --- |
| [`fireviewer/rtdetr-v2-r50-fire-smoke`](https://huggingface.co/fireviewer/rtdetr-v2-r50-fire-smoke) | Visible smoke/flame object detection | **Public reference detector**; not publication authority and not automatically promoted into every runtime. |

### Public datasets and hosted artifacts

| Resource | Role | Status |
| --- | --- | --- |
| [`fire-smoke-detection-corpus-v1`](https://huggingface.co/datasets/fireviewer/fire-smoke-detection-corpus-v1) | Visible fire/smoke object detection corpus | Public research / reference corpus |
| [`fire-smoke-pointing-ground-v1`](https://huggingface.co/datasets/fireviewer/fire-smoke-pointing-ground-v1) | Ground fire/smoke pointing and grounding | Public research; historical associated checkpoint is not active |
| [`dinov3-cross-view-fireviewer-v1-dataset`](https://huggingface.co/datasets/fireviewer/dinov3-cross-view-fireviewer-v1-dataset) | Cross-view registration/localisation research | Public research |
| [`prithvi-burnscars-training-dataset-v1`](https://huggingface.co/datasets/fireviewer/prithvi-burnscars-training-dataset-v1) | Burn-scar segmentation materialisation | Public research; burn scar is not active fire |
| [`firewarning-train-bundles-v1`](https://huggingface.co/datasets/fireviewer/firewarning-train-bundles-v1) | Historical reproducible training packages | Public archive / legacy training inputs |
| [`firewarning-training-corpus`](https://huggingface.co/datasets/fireviewer/firewarning-training-corpus) | Critical evaluation/reference packages | Public evaluation |
| [`dataset-from-simulations`](https://huggingface.co/datasets/fireviewer/dataset-from-simulations) | Omniverse-generated observations | Public synthetic |
| [`simple-measured-scenes-v1`](https://huggingface.co/datasets/fireviewer/simple-measured-scenes-v1) | Versioned real measured geographic packages | **Measured map** |

Historical `firewarning-*` slugs remain for compatibility and provenance. The active project identity is FireViewer.

## Measured maps

`simple-measured-scenes-v1` is the canonical hosted repository for real measured map builds.

Current retained production includes Die / Justin in Drôme, France. The repository is designed to grow as additional real areas are produced and validated.

### Compatibility rule

Existing published map directories, filenames and package paths can be consumed directly by the FireViewer viewer. They are therefore compatibility-sensitive.

**Do not rename, move, flatten or reorganise existing measured-map packages as part of documentation or repository cleanup.**

A future structural migration must be explicitly versioned and coordinated with every consumer.

## Synthetic and reproduction resources

Synthetic and historical-reproduction material is not a measured-map production and is not real-event evidence.

Examples include:

- `dataset-from-simulations` — public synthetic observations;
- `omniverse-die-reproduction-pack-v1` — restricted historical simulation/reproduction package;
- generated scenarios and synthetic campaigns produced by `fireviewer-sdg`.

These resources can support development and evaluation, but their outputs must remain labelled as synthetic/reproduction material.

## Restricted research

Private datasets can be retained when one or more upstream sources do not provide sufficiently explicit redistribution rights or when a campaign is intentionally research-only.

Identified examples include private DINOv3 campaign archives and the restricted SegFormer baseline dataset. Private access never broadens upstream redistribution rights.

## Legacy model archive

Deprecated, superseded, incomplete and low-quality historical model checkpoints are not listed as active public FireViewer models.

When such artifacts are worth retaining, they are consolidated in the private `fireviewer/fireviewer-legacy-models` archive for:

- provenance;
- reproducibility;
- comparison;
- hash/revision retention;
- audit of past experiments.

Production code must not consume the common legacy archive directly. Reactivation requires re-evaluation under a current benchmark, rights review and explicit promotion into a dedicated repository.

Private historical RF-DETR and SegFormer releases that remain accessible are treated as legacy/research resources unless explicitly promoted again.

## Upstream models and assets

Third-party weights and datasets are referenced by provider, identifier and immutable revision whenever possible. They are not copied into FireViewer storage merely for convenience when redistribution rights are unclear or unnecessary.

## Relationship to pipeline status

Resource status and pipeline status are different concepts:

- a **public** model can still be unqualified for production;
- a **private** resource can still be useful research material;
- a **legacy** checkpoint can remain reproducible without being active;
- a **measured map** can be valid geography without asserting any wildfire state;
- a **synthetic** dataset can be high quality without becoming real-world evidence.

As of 28 August 2026, the deterministic event reconstruction is Part.4 **3.3**, using the uncalibrated `part4-framed-v1` profile. This implementation update does not reclassify resources or refresh the dated Hub inventory above; resource visibility and pipeline qualification remain separate.

## Update procedure

When the Hugging Face inventory changes:

1. verify public/private visibility from the Hub;
2. record immutable revisions in the machine-readable registry where applicable;
3. classify the resource using this status vocabulary;
4. update the resource card without overstating deployment or qualification;
5. update the organisation profile only after the individual resource status is clear;
6. never reorganise measured-map paths merely to make the Hub look cleaner.
