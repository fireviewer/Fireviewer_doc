# FireViewer — Models, datasets and benchmarks

This page is the public, cross-project index of FireViewer resources visible on
Hugging Face. Hugging Face remains authoritative for model weights, model cards,
dataset cards, visibility and hosted artifacts. The
[`fireviewer/models`](https://github.com/fireviewer/models) repository mirrors
this small, machine-readable public inventory; it never stores weights or
datasets.

## Scope of this snapshot

The inventory was reconciled on **22 August 2026** with the unauthenticated
public Hugging Face API. It therefore describes only resources that are publicly
visible at that date. It does not infer private repositories, local checkpoints,
draft model cards, deleted resources or future publication plans.

Public visibility is not a claim that a model is operational, scientifically
qualified or suitable for life-safety decisions.

## Publicly visible model checkpoint

One public FireViewer model was visible in this snapshot.

| Model | Immutable Hub revision | Declared task | Base model | Declared dataset | Public status |
| --- | --- | --- | --- | --- | --- |
| [`fireviewer/rtdetr-v2-r50-fire-smoke`](https://huggingface.co/fireviewer/rtdetr-v2-r50-fire-smoke) | `c177a12ccd9f0ed1c0ddadbc3e7ad2ac56ae0218` | object detection | `PekingU/rtdetr_v2_r50vd` | [`fireviewer/fire-smoke-detection-corpus-v1`](https://huggingface.co/datasets/fireviewer/fire-smoke-detection-corpus-v1) | published public checkpoint; no FireViewer qualification claim in this index |

The Hub card contains quantitative metadata marked `verified: false`. Those
values are deliberately not promoted here as a FireViewer benchmark claim.

There is no public active pointing checkpoint in this inventory. Local
experiments, withdrawn candidates and resources not visible on Hugging Face are
not listed as public models.

## Publicly visible dataset repositories

Eight public dataset repositories were visible. The role column only repeats
the public card name, declared task category or tags; it does not silently
promote a resource to a current training, evaluation or production role.

| Dataset | Immutable Hub revision | Publicly declared scope |
| --- | --- | --- |
| [`fireviewer/dataset-from-simulations`](https://huggingface.co/datasets/fireviewer/dataset-from-simulations) | `71664807b9bb20812a5d423f4dc7de2614436fbc` | synthetic data / Omniverse / OpenUSD tags |
| [`fireviewer/dinov3-cross-view-fireviewer-v1-dataset`](https://huggingface.co/datasets/fireviewer/dinov3-cross-view-fireviewer-v1-dataset) | `d4e6a78739a8e0a8efc3d9635f1bc64551911034` | image segmentation and image-to-image; cross-view tags |
| [`fireviewer/fire-smoke-detection-corpus-v1`](https://huggingface.co/datasets/fireviewer/fire-smoke-detection-corpus-v1) | `85ad763e6275537386f7eefdae5e3a18a55f1c71` | object detection; fire/smoke/wildfire tags |
| [`fireviewer/fire-smoke-pointing-ground-v1`](https://huggingface.co/datasets/fireviewer/fire-smoke-pointing-ground-v1) | `084c50a77664af53513e8e89953fed57d467194b` | visual question answering and image-to-text; pointing/grounding tags |
| [`fireviewer/firewarning-train-bundles-v1`](https://huggingface.co/datasets/fireviewer/firewarning-train-bundles-v1) | `55bf88cb63ff14672d24a921a2f143acd5cbddb7` | FireViewer Training Bundles v1; declared multi-task categories |
| [`fireviewer/firewarning-training-corpus`](https://huggingface.co/datasets/fireviewer/firewarning-training-corpus) | `cd2abc87c097b7981566ca992026c761c411d0bc` | FireViewer Critical Evaluation Corpus; evaluation/provenance tags |
| [`fireviewer/prithvi-burnscars-training-dataset-v1`](https://huggingface.co/datasets/fireviewer/prithvi-burnscars-training-dataset-v1) | `5a1f6006002000aea031c261daf807ea1500c762` | image segmentation; burn-scar/satellite/Prithvi tags |
| [`fireviewer/simple-measured-scenes-v1`](https://huggingface.co/datasets/fireviewer/simple-measured-scenes-v1) | `45383131eca22a4f8efecb11781daaf5d2701334` | public card does not declare a task category |

Each repository retains its own licence and conditions. A public listing does
not grant permission to reuse underlying third-party data, model weights or
derived artifacts beyond those stated by the relevant source card.

## Public benchmark status

No comparative score is promoted by this public index as a qualified FireViewer
benchmark. Earlier local and historical measurements referred to withdrawn,
non-public or insufficiently evidenced resources, or did not preserve the full
evaluation and runtime context. They remain local working material rather than
project-facing performance claims.

## Qualification rule

A benchmark may be published as a stable FireViewer claim only when it
preserves, as applicable:

- exact model and base-model revisions or hashes;
- evaluation dataset and split, with evidence of training/evaluation separation;
- preprocessing, image resolution, thresholds, backend and inference precision;
- hardware, software, warmup and repetition methodology;
- task-appropriate quality metrics, latency, throughput and memory method;
- raw predictions where rights permit, failures, contradictions and abstention;
- confidence intervals or other uncertainty treatment; and
- an explicit review or promotion decision.

Until then, the correct status is **unqualified**. A detection is not a
geographic localisation, a pointing result is not a geographic coordinate, and
no model output is a publication authority.

## Canonical locations

- Hugging Face organisation: <https://huggingface.co/fireviewer>
- GitHub public model/data registry: <https://github.com/fireviewer/models>
- AI worker implementation: <https://github.com/fireviewer/fireviewer-ai-worker>
- Cross-project documentation: <https://github.com/fireviewer/Fireviewer_doc>
