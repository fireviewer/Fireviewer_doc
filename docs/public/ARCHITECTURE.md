# FireViewer public architecture

## Design objective

FireViewer turns heterogeneous wildfire observations into reviewable evidence
and versioned geographic representations. The system is incident-centred: a
photo, article, satellite item, or model output is never treated as an isolated
fact and never becomes publication authority by itself.

## End-to-end flow

```text
public pages / official feeds / authorised uploads
                         |
                         v
CPU acquisition and normalisation
- bounded web and media discovery
- source tickets and provenance
- video keyframe extraction
- provisional visual detections
- upload location and camera metadata
                         |
                         v
Deterministic geographic stage
- map and geocoding references
- camera ray and field-of-view constraints
- terrain and visibility checks
- satellite and prior-front consistency
- zero, one, or several candidate GPS points
                         |
                         v
Optional accelerated evidence stage
- visual and satellite embeddings
- cross-view comparison
- remote-sensing encoders or segmentation
                         |
                         v
EventEvidence + spatio-temporal event memory
                         |
                         v
CPU evidence assembly
- retrieve relevant history
- select a compact evidence set
- build one PointEvidenceBundle per candidate
                         |
                         v
Managed multimodal supervisor
- compare the supplied candidate with its evidence
- report support, contradictions, and missing evidence
- accept, reject, or abstain
                         |
                         v
PointAssessment + policy gate + human review
                         |
                         v
versioned event record and reviewed spatial products
```

Providers are interchangeable behind explicit contracts. A CPU stage can run
without an accelerated stage; a missing optional provider must reduce evidence
quality or cause abstention rather than be silently replaced by invented data.

## Component responsibilities

### Acquisition and normalisation

The acquisition layer discovers official information, public reporting, and
eligible media. It records source identity, retrieval time, publisher, URL,
content hashes, and processing outcomes. Public page contents and transcripts
may be analysed in memory but are not retained as a shadow article archive.

Video is reduced to selected keyframes before visual analysis. The provisional
YOLO stage supplies visual boxes and scores only. It does not localise the fire
and does not publish an event.

### Deterministic geography

Geographic hypotheses are built separately from object detection. Inputs can
include:

- the upload position and declared horizontal accuracy;
- capture time, heading, pitch, roll, and field of view;
- image-space observations and their uncertainty;
- terrain elevation and line-of-sight calculations;
- map, geocoding, satellite, and official geographic references;
- earlier reviewed fire states and perimeters.

If essential camera metadata is missing, the correct result is a larger search
region, a low-confidence hypothesis, or `abstain`. The historical front is a
prior, not an absolute veto: spotting and secondary ignitions can occur outside
the dominant direction of travel.

### Optional accelerated evidence

Satellite encoders, cross-view localisation, embeddings, and heavier vision
models can be attached as elastic providers. They enrich evidence and rank
matches; they do not bypass deterministic geographic constraints or the review
policy. No public documentation assumes that a paid GPU endpoint is active.

### Event memory and evidence assembly

Evidence is stored by event, time, geographic distance, type, revision, and
source. Spatial and temporal filtering happens before semantic retrieval. Each
summary assertion keeps references to the immutable evidence from which it was
derived; a new snapshot does not silently overwrite an earlier state.

The evidence assembler selects a bounded, relevant dossier for one candidate
point. The final supervisor is not given every raw image from an incident.

### Multimodal assessment

The final vision-language provider receives the candidate and its compact
evidence dossier. It returns structured support, contradictions, missing
evidence, and an `accept`, `reject`, or `abstain` verdict. Its confidence is not
publication confidence: a separate calibrator and deterministic policy decide
whether the result may proceed automatically.

### Backend, review, and publication

The backend owns durable incident records, immutable evidence revisions,
assessment receipts, audit events, review state, and publication gates. A
deployed worker is not automatically enabled. High-impact routes are protected
by independent feature flags and authentication requirements.

### Frontend and spatial products

The frontend provides contribution, review, and public exploration surfaces.
The spatial component consumes reviewed geographic packages to build map and
temporal layers. Map production remains a separate deterministic subsystem;
the detector and multimodal supervisor do not author the final map geometry.

## Trust boundaries

- External sources are untrusted until parsed, bounded, attributed, and hashed.
- Uploaded media require explicit authorisation and malware controls before
  durable handling.
- Model outputs are derived evidence, never source evidence.
- Simulation and synthetic data remain labelled and separate from real events.
- Publication is a backend policy decision, not a model tool call.
- Every sensitive service follows least privilege and may remain disabled even
  when its code or deployment exists.

## What this architecture does not claim

It does not claim real-time alerting, official incident status, operational
readiness, certified geographic accuracy, autonomous perimeter generation, or
validated fire-spread prediction.
