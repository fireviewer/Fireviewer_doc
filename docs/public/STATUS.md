# Current implementation status

**Public status snapshot: 26 August 2026.**

This page distinguishes source code, guarded integration and real end-to-end acceptance. A repository, container image, configured adapter or deployed scale-to-zero service is not evidence that a production path is enabled or scientifically qualified.

| Area | Current verified state | Remaining acceptance boundary |
| --- | --- | --- |
| Evidence contracts | `EventEvidence`, geographic-hypothesis, point-bundle, point-assessment, immutable revision, checksum and publication-receipt structures are implemented across worker/backend boundaries. | Contract presence does not prove that every live provider supplies complete real evidence. |
| Source acquisition | Bounded HTTP acquisition, domain policies, automatic query planning, adaptive evidence-gap waves, source/media candidate tickets, deduplication, hashing and failure reporting are implemented. | A complete unattended run from one naturally acquired real candidate through every downstream block has not been accepted. |
| Text and image extraction | Interchangeable multimodal evidence-provider interfaces and managed-provider adapters exist. Pages and bounded image sets can be processed without durable raw-content retention. | Provider availability, cost coverage, extraction quality and source completeness require live pilot evidence. |
| Video | Keyframe selection and CPU service/container paths exist with durable derivative metadata. | Cross-platform runtime acceptance and a complete real uploaded-video journey remain to be accepted. |
| Visual detection | A provisional CPU visual-detection stage emits image-space boxes and scores. The public RT-DETR checkpoint is a documented reference detector on Hugging Face. | Visual detection is not geographic localisation and no detector is publication authority. Runtime promotion remains separately gated. |
| Deterministic geography | Upload location, declared accuracy, camera orientation/FOV fields, maps, terrain/DEM, visibility and history-aware geographic-hypothesis contracts are implemented. Missing inputs can force uncertainty or abstention. | Real-candidate acceptance with complete camera metadata, durable terrain, satellite evidence and historical-front comparison is still required. |
| Satellite observations | CDSE/CLMS/Sentinel and NASA FIRMS paths cover CLMS burn-scar masks, Sentinel-3 FRP, Sentinel-2 materialisation/change, bounded Sentinel-1 radar change and MODIS/VIIRS thermal footprints. Derived observations keep time, geometry, accuracy, source revision and attribution. | Real credentialed provider acceptance and quality qualification remain separate from code and synthetic tests. Optional GPU evidence is not assumed active. |
| Event memory and dossier assembly | Spatio-temporal retrieval, durable evidence reads, evidence selection and compact `PointEvidenceBundle` construction exist. | Retrieval quality and evidence sufficiency need validation on genuine multi-source events. |
| Final multimodal assessment | Managed and simulated supervisor modes, structured assessment, contradiction handling, competing-point proposals and abstention are implemented. Simulated output cannot be publication-eligible. | The managed-provider operational envelope and complete live pilot remain to be accepted. |
| Publication policy | Publication is backend-controlled. Accepted model output alone is insufficient; contradiction, missing-evidence, calibrated-confidence and provider-mode gates are checked and receipted. | Event ingestion, event-v2 and public publication remain independent guarded features; unattended publication is not claimed. |
| Part.4 3.2 fire-state reconstruction | Algorithm line `3.2.0` normalises spatial observations on an adaptive EPSG:2154 probability grid and emits EPSG:4326 `affected`, `active` and uncertainty products. The `part4-baseline-v3-provenance` profile carries immutable identity and SHA-256. Probability and provenance COG products are aligned and versioned. | The baseline profile is explicitly uncalibrated. No France profile is currently qualified for unattended publication. |
| Part.4 calibration | Offline CPU calibration, immutable Hugging Face corpus revisions, frozen predictions, pre-reference cutoffs, threshold/profile screening, grouped metrics, bootstrap confidence and isolated holdout contracts are implemented. | Screening/calibration results must pass all qualification gates on sufficient real incidents before any profile can be promoted. Holdout isolation must remain intact. |
| Backend and frontend | Incident/evidence/review APIs and contribution, review, 2D/3D exploration and spatial-production interfaces exist. | Production authentication, public availability and the full contribution-to-publication journey are not claimed qualified here. |
| Measured-map production | The provider-neutral Map Builder supports resumable tile shards, deterministic checkpoint ownership, a dependent final assembler, tiled viewer packages and asset-free production. | A successful unit test or cloud replay does not qualify every map size, source condition, browser or publication route. |
| Published measured maps | `fireviewer/simple-measured-scenes-v1` is the canonical Hub location for retained real measured map packages. Existing published paths are treated as viewer compatibility interfaces. | Documentation updates must not move or rename those packages. New maps require their own identity, provenance and validation before addition. |
| Synthetic data | Synthetic scenario, asset and simulation tooling is maintained separately from real-event evidence. | Synthetic validation never proves real-event geographic or operational quality. |
| Legacy resources | Deprecated, superseded, incomplete and low-quality checkpoints can be retained in a private consolidated archive for provenance. Historical `firewarning-*` identifiers remain where compatibility requires them. | Legacy artifacts must not be consumed as active runtime models without re-evaluation and explicit promotion into a dedicated repository. |

## Part.4 version note

Documentation written before the provenance/calibration update referred to the probabilistic fusion implementation as **Part.4 3.1**. The backend update of 26 August 2026 advanced the documented implementation to **Part.4 3.2**, algorithm line `3.2.0`, adding aligned provenance products and the current calibration/qualification workflow.

Current documentation should therefore use **Part.4 3.2**.

## Safe interpretation

FireViewer is suitable for continued MVP integration, contract testing, read-only evidence pilots, measured-map production and bounded evaluation. It must not yet be described as an autonomous wildfire monitoring, warning, localisation or publication service.

The next meaningful acceptance milestones are:

1. a naturally acquired real incident/day processed end to end without manually injecting stage outputs;
2. frozen Part.4 3.2 outputs evaluated only after the prediction hashes are fixed;
3. a sufficiently broad real calibration campaign followed by an isolated holdout evaluation;
4. explicit qualification of any profile before automatic publication is considered.

## Map compatibility boundary

The FireViewer viewer can depend on published map directory and file paths. Cleaning documentation or repository presentation is **not** permission to reorganise `simple-measured-scenes-v1`. Existing map packages remain unchanged unless a dedicated migration updates every consumer together.
