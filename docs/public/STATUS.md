# Implementation status and acceptance boundaries

**Documentation and repository inventory review: 19 September 2026.** This review incorporates the supplied documentation pack and checks GitHub/Hugging Face metadata and cards. It does not report a new application test run, live deployment check, model evaluation or native Unreal acceptance.

FireViewer remains an active research MVP. Code present, a package built, an integration configured, a real path accepted end to end and a scientifically qualified result are different levels of evidence. Repository separation does not close unfinished functional work.

## Read the dates before interpreting a capability

| Reference | Scope | How to use it |
| --- | --- | --- |
| [Current repository organisation](ORGANISATION.md) | Active components, UWD/FV boundaries, retired repositories and publication responsibilities. | Use for commit routing and technical stewardship. It does not establish current cloud availability or a signed rights assignment. |
| [Detailed capability snapshot, 4/6 September 2026](STATUS-20260906.md) | The full former status page: 4 September capability assessment with the 6 September web-atlas update. | Historical evidence, retained without rewriting its claims. Component locations and availability statements must be checked against newer references before reuse. |
| [Web-atlas record](WEB_MAPS.md) | Dated published coverage and selected captures. | Evidence of the documented release, not a live browser check performed during this update. |
| [Reconstruction](RECONSTRUCTION.md), [evidence and review](EVIDENCE_AND_REVIEW.md) | Contracts, methods and qualification boundaries. | A described method or implemented gate does not prove that a particular output or profile has passed it. |

The historical snapshot is preserved as its original Git blob. Its headings containing “current” refer to its stated assessment dates, not to this documentation review. No provider, model or dataset is declared currently available merely because it appears in that snapshot.

## Organisation now documented

The active inventory contains **18 FireViewer repositories (16 core/institutional/infrastructure/transitional and 2 Android auxiliaries), plus the separate generic UWD Map Builder dependency**. [Organisation](ORGANISATION.md) is the canonical routing reference; the [repository guide](REPOSITORIES.md) explains publication and stewardship.

| Boundary | Documented allocation | What this does not prove |
| --- | --- | --- |
| Generic geography production | UWD `map-builder`: measured-map production, CLI/API/UI and generic cartographic Unreal tools. | Native Unreal acceptance, every map size or browser, or current provider availability. |
| Incident authority | FV backend: incident identity, evidence persistence, accounts, rights, review decisions, audit and publication. | A complete unattended incident-processing service. |
| Public interfaces | FV frontend for viewer/administration; a separate repository for the association website. | Acceptance of every contribution, correction and publication journey. |
| Evidence and calculation | Dedicated FV contracts, ingestion, vision, geolocation, supervision, orchestration, fire-state and model-lab components. | Model quality, real-data geographic precision or calibration merely from package separation. |
| Compatibility | `fireviewer-ai-worker` retains old imports and commands; new algorithms belong in the canonical components. | Permission to duplicate implementations or remove compatibility identifiers without a migration. |
| Infrastructure and history | Infrastructure and receipts remain private; spatial, SDG and the former model-registry repositories are retired, not active development locations. | Completion of all historical recovery, local cleanup or legal attribution work. |

## Models and datasets documented on 19 September

The [public HF catalogue](HUGGINGFACE.md) separates the independent detector benchmark from RF-DETR training-validation metrics and DINOv3 pilot metrics. Public model weights do not establish runtime promotion or redistribution permission. DINOv3’s older private/public-release statements remain a rights-review issue; observed public visibility is not an approval decision.

The detection corpus has 102,257 published records according to its retained audit. The new `fire-and-smoke-corpus-point-and-detect` repository contained only `.gitattributes` at the inventory revision: no usable corpus or 250,000-image delivery is established. Historical training bundles are file archives with separate per-bundle readiness. Measured maps remain separate from fire observations.

## Public source release

Eight domain components are now public, alongside the organisation profile and canonical documentation. See the [release scope](OPEN_SOURCE.md) for the explicit list and exclusions. This visibility change retains existing licences and acceptance boundaries; it is not a new deployment or qualification.

## Publication and evidence rules

The backend retains publication authority. **Terrain packages and AI/LLM results do not follow the same acceptance rule.** Terrain packages attached to an existing incident can be published automatically after technical acceptance; sensitive AI/LLM results retain human validation. This documents the responsibility boundary, not a new verification of a deployed route.

Keep established facts, observations, external data, AI results, FireViewer calculations, estimates, hypotheses and unverified information distinguishable. Detection is not geographic localisation; a calculated or reconstructed state is not silently relabelled as an observation. Missing or contradictory evidence can require uncertainty, rejection or abstention.

FireViewer does not predict future wildfire propagation. It is not an emergency alert service, an official wildfire source or an incident-command system.

## Functional acceptance remains separate

The [4/6 September snapshot](STATUS-20260906.md) retains the detailed assessments for acquisition, text/image extraction, video, detectors, geography, satellite evidence, corpus integrity, historical evaluation, event memory, supervision, publication, Part.4, calibration and the web atlas. This documentation pass does not rerun those assessments or mark their open acceptance boundaries as completed.

The current organisation explicitly keeps these areas separate from repository cleanup:

| Area | Evidence still needed for its own acceptance |
| --- | --- |
| Agentic perimeters, activity and positioned photographs | A traceable real journey through the relevant components, attached to an incident, with separate layers and human decisions for AI results. |
| Corpus, models and providers | Identified revisions, reproducible evaluations and the relevant data/model/provider acceptance. CPU checks do not establish GPU or real-provider qualification. |
| Native Unreal execution and rendering (simulation on hold, outside current MVP work) | Native compilation, loading and visual acceptance for the intended target. Python tests and source-only plugins are insufficient. |
| Full contribution and publication journeys | End-to-end evidence for the actual route and configuration, rather than inference from individual repositories or images. |

### Dated Part.4 assessment

The 4 September assessment described **Part.4 3.3**, algorithm `3.3.0`, with the uncalibrated `part4-framed-v1` profile and no qualified affected-component profile in the registry assessed then. Those are **dated findings**, not a fresh inventory of profiles or a new calibration result.

Frozen predictions, source-availability cutoffs, incident-level evaluation, isolated holdout and explicit qualification remain essential boundaries described in [Reconstruction](RECONSTRUCTION.md). This update neither promotes a profile nor authorises unattended AI publication.

## Map compatibility and documentation scope

Existing published map paths and contracts remain compatibility interfaces. Cleaning documentation is not permission to move or rename packages in `fireviewer/simple-measured-scenes-v1`, alter incident geometry or replace the complete Die reference map.

Public pages describe responsibilities, methods and dated maturity. Detailed recovery decisions, local archives, provider identifiers, internal endpoints, raw logs and operational receipts remain in controlled private records, according to the [public documentation policy](../REPOSITORY_DOCUMENTATION_POLICY.md).

Future status updates should identify the component or artifact revision, the date and scope of the check, the result and remaining limitations. A documentation date alone must never refresh an old functional claim.
