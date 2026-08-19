# FireViewer — Models, datasets and benchmarks

This page is the canonical cross-project overview of the FireViewer model/data landscape and of benchmark evidence that is currently safe to cite.

Hugging Face remains the canonical publication location for model weights, model cards, dataset cards and hosted artifacts. The [`fireviewer/models`](https://github.com/fireviewer/models) repository maintains the detailed GitHub inventory and machine-readable lifecycle registry.

## Active model checkpoints

FireViewer currently indexes **eight active checkpoints** on Hugging Face.

| Model | Task | Base / stack | FireViewer status |
| --- | --- | --- | --- |
| [`fireviewer/rtdetr-v2-r50-fire-smoke`](https://huggingface.co/fireviewer/rtdetr-v2-r50-fire-smoke) | fire / smoke detection | RT-DETR v2 R50 · Transformers | integrated; preliminary benchmark evidence |
| [`fireviewer/dfine-xlarge-fire-smoke-v2`](https://huggingface.co/fireviewer/dfine-xlarge-fire-smoke-v2) | fire / smoke detection | D-FINE XLarge · Transformers | integrated; preliminary benchmark evidence |
| [`fireviewer/rf-detr-large-ground-fire-smoke-v2`](https://huggingface.co/fireviewer/rf-detr-large-ground-fire-smoke-v2) | fire / smoke detection | RF-DETR Large · ONNX/RF-DETR | benchmark / challenger |
| [`fireviewer/rf-detr-small-ground-elite-fire-smoke-v1`](https://huggingface.co/fireviewer/rf-detr-small-ground-elite-fire-smoke-v1) | compact fire / smoke detection | RF-DETR Small · ONNX/RF-DETR | benchmark / challenger; preliminary evidence |
| [`fireviewer/fireviewer-dinov3-vitb16-multitask-boreal-v1`](https://huggingface.co/fireviewer/fireviewer-dinov3-vitb16-multitask-boreal-v1) | segmentation / visual grounding research | DINOv3 ViT-B/16 | benchmark / research |
| [`fireviewer/dinov3-vitb16-multitask-fireviewer-v3`](https://huggingface.co/fireviewer/dinov3-vitb16-multitask-fireviewer-v3) | segmentation / visual grounding | DINOv3 ViT-B/16 | benchmark / research |
| [`fireviewer/segformer-b2-fire-smoke-baseline-v1`](https://huggingface.co/fireviewer/segformer-b2-fire-smoke-baseline-v1) | segmentation baseline | SegFormer-B2 | benchmark baseline |
| [`fireviewer/molmopoint-8b-fire-smoke-pointing`](https://huggingface.co/fireviewer/molmopoint-8b-fire-smoke-pointing) | visual pointing / grounding | MolmoPoint-8B | integrated; public preliminary benchmark |

A published model is not automatically a FireViewer publication authority. Model outputs remain derived proposals and are subject to FireViewer review, provenance and abstention rules.

Historical references such as `fireviewer/dfine-xlarge-fire-smoke` and `fireviewer/prithvi-burnscars-firewarning-v1-deprecated` are excluded from the active count.

## Current dataset showcase

The main project-facing dataset/spatial showcase is intentionally limited to resources that represent current FireViewer work and have a clear status.

| Dataset | Main use | Status |
| --- | --- | --- |
| [`fire-smoke-detection-corpus-v1`](https://huggingface.co/datasets/fireviewer/fire-smoke-detection-corpus-v1) | RT-DETR / D-FINE detection work | current public |
| [`fire-smoke-pointing-ground-v1`](https://huggingface.co/datasets/fireviewer/fire-smoke-pointing-ground-v1) | MolmoPoint pointing / grounding | current public |
| [`prithvi-burnscars-training-dataset-v1`](https://huggingface.co/datasets/fireviewer/prithvi-burnscars-training-dataset-v1) | burn-scar segmentation research | current public research |
| [`dinov3-cross-view-fireviewer-v1-dataset`](https://huggingface.co/datasets/fireviewer/dinov3-cross-view-fireviewer-v1-dataset) | cross-view registration research | current public research |
| [`simple-measured-scenes-v1`](https://huggingface.co/datasets/fireviewer/simple-measured-scenes-v1) | portable measured map builds | current spatial-artifact collection; not a training dataset by default |

### Current restricted training data

The following repositories remain private because at least one upstream source does not provide sufficiently explicit redistribution rights:

- `fireviewer/dinov3-multitask-fireviewer-v3-dataset`;
- `fireviewer/segformer-b2-fire-smoke-baseline-v1-dataset`.

Their role can be documented, but their contents must not be represented as public reusable data.

## Legacy and specialised resources

Historical resources remain available where useful for traceability and reproducibility, but they are **not part of the primary FireViewer showcase**.

| Resource | Classification | Current presentation rule |
| --- | --- | --- |
| `fireviewer/firewarning-train-bundles-v1` | legacy compatibility / historical training bundles | retain old links and manifests; do not present as current primary corpus |
| `fireviewer/firewarning-training-corpus` | legacy compatibility / critical evaluation-reference material | retain for evaluation/provenance; do not present as current training corpus |
| `fireviewer/dataset-from-simulations` | synthetic simulation R&D | keep explicitly synthetic and separate from measured incident data |
| `fireviewer/omniverse-die-reproduction-pack-v1` | historical/specialised private Omniverse pack | retain as historical R&D; not part of current headless map-builder showcase |

The historical `firewarning-*` slugs are **preserved, not promoted**. They do not represent a separate active project; FireViewer is the canonical editorial identity.

The detailed inventory and lifecycle rules live in [`fireviewer/models/docs/HUGGING_FACE_INVENTORY.md`](https://github.com/fireviewer/models/blob/main/docs/HUGGING_FACE_INVENTORY.md).

## RF-DETR metadata issue

The current RF-DETR model cards reference:

- `fireviewer/fire-smoke-ground-only-rfdetr-large-v1`;
- `fireviewer/fire-smoke-ground-elite-rfdetr-small-v1`.

Those identifiers do not currently resolve as actual FireViewer Hugging Face dataset repositories. They are **unresolved metadata references**, not valid public dataset links, and are excluded from the real dataset inventory count until corrected or restored.

## Current benchmark evidence

### MolmoPoint — public preliminary benchmark

The `fireviewer/molmopoint-8b-fire-smoke-pointing` model card contains a small independent terrestrial pointing comparison using 20 images and 18 expected targets.

| Model | Returned targets | Mean normalised distance ↓ | Median ↓ | Hit@5% ↑ | Images/s |
| --- | ---: | ---: | ---: | ---: | ---: |
| **FireViewer MolmoPoint-8B** | 14/18 | **0.0520** | **0.0422** | **57.1%** | 0.544 |
| MolmoPoint-8B base | 14/18 | 0.0578 | 0.0501 | 50.0% | 0.566 |
| Florence-2-large-ft | 18/18 | 0.1925 | 0.1820 | 0% | **3.72** |

Compared with the base MolmoPoint model in that small evaluation, the FireViewer checkpoint improves mean normalised distance by about 10.1%, median distance by about 15.7%, and Hit@5% by 7.1 percentage points.

The sample is small. These values are useful preliminary evidence, not a broad claim of performance across wildfire scenes or sensors.

### Detection — preliminary comparison, 17 August 2026

| Model | mAP50 | Precision | Recall | p50 | p95 | FPS |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| **RF-DETR Small FireViewer** | **0.80** | **0.667** | **0.80** | **70.57 ms** | 75.56 ms | **14.2** |
| RT-DETR v2 R50 base | 0.00 | 0.00 | 0.00 | 1367.38 ms | 1830.52 ms | 0.7 |
| **RT-DETR FireViewer** | 0.20 | 0.20 | 0.20 | 1863.54 ms | 2256.32 ms | 0.5 |
| **D-FINE XLarge FireViewer v2** | 0.20 | 0.20 | 0.20 | 3083.46 ms | 3540.61 ms | 0.3 |

This run is **not an official architecture benchmark**. The archived result does not contain enough environment and evaluation-corpus provenance for scientific qualification, and the inference backends differ. Runtime values therefore must not be presented as a pure comparison of architectures.

## Qualification rule

A benchmark should only be promoted into a stable FireViewer claim when it preserves, as applicable:

- exact model revision or hash;
- evaluation dataset and split;
- evidence that evaluation data are independent from training data;
- preprocessing, image resolution and thresholds;
- inference precision and backend;
- hardware and environment;
- warmup and repetition methodology;
- raw predictions where rights permit;
- quality metrics;
- latency p50 / p95 and throughput;
- memory methodology;
- failures, contradictions and abstention;
- limitations and rights information.

Until those conditions are met, the correct label is **preliminary benchmark evidence**.

## Canonical locations

- Hugging Face organisation: <https://huggingface.co/fireviewer>
- GitHub model index: <https://github.com/fireviewer/models>
- Detailed Hub inventory: <https://github.com/fireviewer/models/blob/main/docs/HUGGING_FACE_INVENTORY.md>
- AI worker: <https://github.com/fireviewer/fireviewer-ai-worker>
- Cross-project documentation: <https://github.com/fireviewer/Fireviewer_doc>
