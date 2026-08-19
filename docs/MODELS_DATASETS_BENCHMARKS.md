# FireViewer — Models, datasets and benchmarks

This page is the canonical cross-project overview of the public FireViewer model and dataset landscape and of the benchmark evidence that is currently safe to cite.

Hugging Face remains the canonical publication location for model weights, model cards and dataset cards. GitHub documents how those resources fit into FireViewer and which evidence is considered preliminary, public, restricted or historical.

## Active model checkpoints

FireViewer currently publishes eight main checkpoints on Hugging Face.

| Model | Task | Base / stack | FireViewer status |
| --- | --- | --- | --- |
| [`fireviewer/rtdetr-v2-r50-fire-smoke`](https://huggingface.co/fireviewer/rtdetr-v2-r50-fire-smoke) | fire / smoke detection | RT-DETR v2 R50 · Transformers | integrated; preliminary benchmark evidence |
| [`fireviewer/dfine-xlarge-fire-smoke-v2`](https://huggingface.co/fireviewer/dfine-xlarge-fire-smoke-v2) | fire / smoke detection | D-FINE XLarge · Transformers | integrated; preliminary benchmark evidence |
| [`fireviewer/rf-detr-large-ground-fire-smoke-v2`](https://huggingface.co/fireviewer/rf-detr-large-ground-fire-smoke-v2) | fire / smoke detection | RF-DETR Large · ONNX/RF-DETR | benchmark / challenger |
| [`fireviewer/rf-detr-small-ground-elite-fire-smoke-v1`](https://huggingface.co/fireviewer/rf-detr-small-ground-elite-fire-smoke-v1) | compact fire / smoke detection | RF-DETR Small · ONNX/RF-DETR | benchmark / challenger; preliminary benchmark evidence |
| [`fireviewer/fireviewer-dinov3-vitb16-multitask-boreal-v1`](https://huggingface.co/fireviewer/fireviewer-dinov3-vitb16-multitask-boreal-v1) | segmentation / visual grounding research | DINOv3 ViT-B/16 | benchmark / research |
| [`fireviewer/dinov3-vitb16-multitask-fireviewer-v3`](https://huggingface.co/fireviewer/dinov3-vitb16-multitask-fireviewer-v3) | segmentation / visual grounding | DINOv3 ViT-B/16 | benchmark / research |
| [`fireviewer/segformer-b2-fire-smoke-baseline-v1`](https://huggingface.co/fireviewer/segformer-b2-fire-smoke-baseline-v1) | segmentation baseline | SegFormer-B2 | benchmark baseline |
| [`fireviewer/molmopoint-8b-fire-smoke-pointing`](https://huggingface.co/fireviewer/molmopoint-8b-fire-smoke-pointing) | visual pointing / grounding | MolmoPoint-8B | integrated; public preliminary benchmark |

A published model is not automatically a FireViewer publication authority. Model outputs remain derived proposals and are subject to FireViewer review, provenance and abstention rules.

## Dataset relationships

### Main public datasets

| Dataset | Main use | Current public content |
| --- | --- | --- |
| [`fire-smoke-detection-corpus-v1`](https://huggingface.co/datasets/fireviewer/fire-smoke-detection-corpus-v1) | RT-DETR / D-FINE detection work | public Parquet detection corpus; Hub size category 100K–1M |
| [`fire-smoke-pointing-ground-v1`](https://huggingface.co/datasets/fireviewer/fire-smoke-pointing-ground-v1) | MolmoPoint pointing / grounding | 96 source images, 376 cleaned views, 730 targets |
| [`prithvi-burnscars-training-dataset-v1`](https://huggingface.co/datasets/fireviewer/prithvi-burnscars-training-dataset-v1) | burn-scar segmentation research | 32,534 image/mask pairs |
| [`dinov3-cross-view-fireviewer-v1-dataset`](https://huggingface.co/datasets/fireviewer/dinov3-cross-view-fireviewer-v1-dataset) | cross-view registration research | 7,890 logical pairs across train/validation/test |

### Restricted training datasets

The following training repositories remain private because at least one upstream source does not provide sufficiently explicit redistribution rights:

- `fireviewer/dinov3-multitask-fireviewer-v3-dataset`;
- `fireviewer/segformer-b2-fire-smoke-baseline-v1-dataset`.

Their existence and role may be documented, but their contents must not be represented as public reusable data.

### RF-DETR metadata issue

The current RF-DETR model cards reference:

- `fireviewer/fire-smoke-ground-only-rfdetr-large-v1`;
- `fireviewer/fire-smoke-ground-elite-rfdetr-small-v1`.

Those dataset repository IDs do not currently resolve as active FireViewer Hub datasets. Until the cards are corrected or the intended repositories are restored, these references must be treated as **unresolved metadata**, not as valid public dataset links.

### Specialised and historical resources

FireViewer also retains specialised resources for simulation, training-bundle preparation, critical evaluation and measured spatial scenes. They should remain clearly separated from the main public model-training datasets so that real, synthetic, training, evaluation and spatial artifacts are not silently mixed.

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

### Detection — preliminary FireViewer comparison, 17 August 2026

A preliminary FireViewer run compared a compact RF-DETR checkpoint, the RT-DETR base, the FireViewer RT-DETR checkpoint and the FireViewer D-FINE checkpoint.

| Model | mAP50 | Precision | Recall | p50 | p95 | FPS |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| **RF-DETR Small FireViewer** | **0.80** | **0.667** | **0.80** | **70.57 ms** | 75.56 ms | **14.2** |
| RT-DETR v2 R50 base | 0.00 | 0.00 | 0.00 | 1367.38 ms | 1830.52 ms | 0.7 |
| **RT-DETR FireViewer** | 0.20 | 0.20 | 0.20 | 1863.54 ms | 2256.32 ms | 0.5 |
| **D-FINE XLarge FireViewer v2** | 0.20 | 0.20 | 0.20 | 3083.46 ms | 3540.61 ms | 0.3 |

This run is **not an official architecture benchmark**. The archived result does not contain enough environment and evaluation-corpus provenance for a scientific qualification, and the inference backends differ (for example ONNX versus Transformers). Runtime values therefore must not be presented as a pure comparison of architectures.

## Qualification rule

A benchmark should only be promoted into a stable FireViewer claim when it preserves, as applicable:

- exact model revision or hash;
- evaluation dataset and split;
- evidence that evaluation data are independent from training data;
- preprocessing, image resolution and thresholds;
- inference precision and backend;
- hardware and environment;
- warmup and repetition methodology;
- raw predictions;
- quality metrics;
- latency p50 / p95 and throughput;
- memory methodology;
- failures, contradictions and abstention;
- limitations and rights information.

Until those conditions are met, the correct label is **preliminary benchmark evidence**.

## Canonical locations

- Hugging Face organisation: <https://huggingface.co/fireviewer>
- GitHub model index: <https://github.com/fireviewer/models>
- AI worker: <https://github.com/fireviewer/fireviewer-ai-worker>
- Cross-project documentation: <https://github.com/fireviewer/Fireviewer_doc>
