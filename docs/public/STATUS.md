# Current implementation status

**Public status snapshot: 24 August 2026.**

This page distinguishes source code, guarded cloud integration, and real
end-to-end acceptance. A repository, container image, configured adapter, or
deployed scale-to-zero service is not evidence of an enabled production path.

| Area | Current verified state | Remaining acceptance boundary |
| --- | --- | --- |
| Evidence contracts | `EventEvidence`, geographic-hypothesis, point-bundle, point-assessment, immutable revision, checksum, and publication-receipt structures are implemented across worker/backend boundaries. | Contract presence does not prove that every live provider supplies complete real evidence. |
| Source acquisition | Bounded HTTP acquisition, domain policies, automatic query planning, adaptive evidence-gap waves, source/media candidate tickets, deduplication, hashing, and failure reporting are implemented. Production collection is driven by incident-day and lifecycle coverage, not a fixed media count; the former 20-media target is local benchmark scope only. | A complete unattended run from one real candidate through every downstream block has not been accepted. |
| Text and image extraction | An interchangeable multimodal evidence-provider interface and a managed provider adapter exist. Pages and a bounded image set can be processed without durable raw-content retention. | Provider availability, cost coverage, extraction quality, and source completeness require live pilot evidence. |
| Video | Keyframe selection and CPU service/container paths exist. | Cross-platform OpenCV/runtime acceptance and a real uploaded-video flow remain to be completed. |
| Visual detection | A provisional CPU YOLO stage emits boxes and visual scores into evidence. | It is not a localisation model and is not qualified as a final wildfire detector. |
| Deterministic geography | Upload location, declared accuracy, orientation/FOV fields, Azure Maps integration, terrain/DEM adapters, camera constraints, and geographic-hypothesis contracts are implemented. Missing inputs can force uncertainty or abstention. | Real-candidate acceptance with complete camera metadata, durable terrain decoding, satellite evidence, and historical-front comparison is still required. |
| Satellite observations | Copernicus Data Space STAC discovery and automatic planning cover Sentinel-2 L2A, Sentinel-3 SLSTR FRP NRT/NTC, CLMS daily 300 m burnt area, and Sentinel-1 GRD. The CPU path decodes CLMS DOB/CP/BF burn-scar masks, classified Sentinel-3 vegetation-fire points, bounded Sentinel-2 pre/post optical change, and a bounded Sentinel-1 VV/VH radar-change second opinion. NASA FIRMS supplies MODIS and VIIRS pixel footprints. Every derived observation keeps time, geometry, accuracy, metrics, source revision, and attribution without retaining raw claim payloads. | The real CDSE and openEO paths still require authorised credentials and live Azure acceptance. Code and synthetic tests do not qualify the change observations on real incidents. Prithvi/MegaLoc remain optional GPU evidence. |
| Optional GPU evidence | Provider boundaries and asynchronous GPU-service preparation exist for heavier cross-view and satellite work. | MegaLoc/Prithvi placement, model quality, cost coverage, and any paid endpoint activation remain explicit later decisions. No paid GPU endpoint is implied active. |
| Event memory and dossier assembly | Spatio-temporal retrieval, evidence selection, durable backend reads, and `PointEvidenceBundle` construction exist. CLMS, Sentinel-3, and FIRMS observations are converted into sourced claims, satellite observations, and geographic references for Eve/RAG. | Retrieval quality and evidence sufficiency need validation on a genuine multi-source event. |
| Final multimodal assessment | Managed and simulated supervisor modes, strict JSON assessment, contradiction handling, competing-point proposals, and abstention are implemented. Simulated output cannot be publication-eligible. | The final managed provider and operational cost envelope still require an authorised live end-to-end pilot. |
| Publication policy | Eligibility requires `accept`, calibrated confidence above 0.85, managed-VL mode, no hard contradiction, and no missing required evidence. Backend wiring and audit receipts exist. | Event pipeline, event-v2, and publication are independent guarded features; this snapshot does not claim that unattended public publication is enabled. |
| Backend and frontend | Incident/evidence/review APIs and contribution, review, 2D/3D exploration, and spatial-production interfaces exist. | Production authentication, public availability, and the complete contribution-to-publication journey are not claimed qualified by this page. |
| Spatial products | Deterministic measured-map and observed-timeline tooling, portable-package contracts, provenance, and validation gates exist as a separate subsystem. Part.4 now builds daily `affected` and `active` GeoJSON only from georeferenced observed masks and prior generated daily state. Accepted GPS and thermal points can corroborate or contradict a mask but are never buffered into geometry. | Real incident/day output must still be frozen and compared with the held-out published perimeter. Model output never substitutes for the deterministic geometry step. |
| Map production | The provider-neutral Map Builder supports resumable tile shards, deterministic checkpoint ownership, a dependent final assembler, direct tiled-viewer packages, and an asset-free mode. Cloud launch, storage, and publication remain adapters outside the spatial engine. | A successful unit test or cloud job does not by itself qualify every map size, source condition, browser, or publication path. Production acceptance remains map- and environment-specific. |
| Synthetic data | Synthetic scenario, asset, and simulation tooling is maintained separately from real-event evidence. | Synthetic validation never proves real-event geographic or operational quality. |

## Safe interpretation

The project is suitable for continued MVP integration, contract testing,
read-only evidence pilots, and bounded evaluation. It must not yet be described
as an autonomous wildfire monitoring, warning, localisation, or publication
service.

The next meaningful acceptance milestone is a real, naturally acquired
incident/day processed in sequence from automatic source planning through web,
media, official and satellite acquisition, keyframes where applicable,
deterministic geographic hypotheses, dossier assembly, managed multimodal
assessment, and deterministic Part.4 output. The produced daily perimeter and
its hashes must be frozen before the held-out published perimeter is loaded for
evaluation. No stage output may be injected manually.
