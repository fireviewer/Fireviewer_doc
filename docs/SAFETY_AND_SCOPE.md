# FireViewer — Safety and Scope

## Positioning

FireViewer is an experimental open research and engineering project for wildfire documentation, spatial reconstruction, temporal tracking and post-event study.

It is **not**:

- an emergency alert service;
- an official wildfire information source;
- a command-and-control system;
- a firefighting operations tool;
- a substitute for instructions from public authorities;
- a certified wildfire-propagation forecast;
- an automatic legal, insurance or operational evidence service.

These boundaries apply regardless of whether FireViewer receives grants, sponsorship, cloud credits or institutional collaboration.

## No automatic confirmation

A detector, vision-language model, satellite product, OCR result, hotspot or external search result does not confirm a wildfire by itself.

Evidence types retain their own semantics and confidence boundaries.

## No automatic publication

AI and automated processing outputs remain private proposals until the required human review.

FireViewer separates decisions about:

- factual statements;
- visual anchors;
- geometry;
- uncertainty;
- reports/text;
- media publication;
- incident publication.

Submitting an event candidate can trigger private analysis, but never direct public publication.

## No authoritative generated coordinates

A language or vision model is not authorised to invent a latitude/longitude and make it authoritative.

A spatial position, when proposed, must come from a documented spatial method with reviewable evidence, transformation history and uncertainty.

Text-generation components may structure evidence around a localisation attempt; they do not replace geometric validation.

## Abstention is a valid result

FireViewer must be able to return bounded failure states such as:

- insufficient evidence;
- ambiguous visual anchor;
- no visible ground origin;
- insufficient geometry;
- unstable camera pose;
- invalid terrain raycast;
- uncertainty above the accepted threshold;
- human review required;
- controlled processing failure.

An abstention is not an error to hide.

## Viewpoint is not fire location

The location of a photographer, camera or reporting source is not automatically the location of active fire.

This distinction remains explicit through ingestion, AI analysis and public representation.

## Missing EXIF

Missing EXIF metadata does not make a media item useless.

It can still contribute to detection, transcription, OCR, temporal context or human review. Missing metadata simply removes or weakens some spatial methods.

## OCR and visible text

Text visible in an image is evidence, not truth by default. It may be old, manipulated, unrelated or out of context and therefore requires corroboration before it supports a public conclusion.

## Data, privacy and consent

FireViewer's default posture is conservative:

- contributed media is private by default;
- provenance and applicable consent are recorded;
- media moderation is separate from analysis validation;
- human correction does not automatically become training data;
- active incidents are excluded from training workflows unless a separately reviewed policy explicitly changes that rule;
- withdrawal/removal requests must be able to affect relevant derivatives where required;
- exact viewpoints are private by default unless an explicit policy permits broader disclosure.

Availability on a public website does not automatically grant FireViewer the right to redistribute a third-party image or dataset.

## Observation, reconstruction and simulation

The following classes must remain distinguishable:

```text
observation
reviewed interpretation
retrospective reconstruction
burned-area product
uncertainty envelope
simulation
prediction
```

A simulation is never published as an observation.

A retrospective reconstruction may be useful for post-event study, but it must not be presented as what was directly known in real time.

An observed hotspot is not automatically a closed fire perimeter.

A smoke detection does not define an active-fire boundary.

See [Fire Evolution Timeline](FIRE_EVOLUTION_TIMELINE.md).

## Unknown intervals

If FireViewer has two accepted temporal states separated by a period with no defensible observation, the intermediate state is allowed to remain unknown.

Presentation-layer animation must not silently become canonical intermediate geometry.

## External sources

External-source integrations must be bounded by explicit connector rules.

As applicable, a connector records:

- collection/product;
- source object/revision;
- observation/acquisition time;
- retrieval time;
- native CRS and footprint;
- licence and attribution;
- correction/retraction lineage.

Two products derived from the same upstream acquisition are not automatically independent corroboration.

## Controlled external research

Automated research or retrieval must not provide an unrestricted trust path from arbitrary web content into public incident state.

Where network-enabled research is used, the architecture should rely on bounded tools, allowlisted sources where appropriate, logging, archived source identity and protection against instructions embedded in retrieved content.

## Technical incident handling

FireViewer architecture includes or targets mechanisms such as:

- suspension / kill switch;
- append-only audit history;
- dead-letter handling;
- withdrawal/retraction;
- partial states;
- rollback or replacement through explicit revision lineage.

A validation failure should be visible, contained and auditable rather than silently discarded.

## Funding and sponsor independence

Financial or infrastructure support does not change the validation rules.

A sponsor or provider cannot require FireViewer to:

- hide uncertainty;
- remove provenance;
- relabel reconstruction as observation;
- promote a model without benchmark evidence;
- suppress relevant failure analysis;
- publish an incident automatically;
- claim operational readiness without qualification.

Funding attribution and scientific provenance are separate concerns.

## Publication language

Public documentation should use the strongest wording that the evidence supports, and no stronger.

Preferred examples:

- "observed at" when direct observation is defensible;
- "reconstructed from" for retrospective geometry;
- "model proposed" for unvalidated model output;
- "human-reviewed" where a reviewer has validated a defined object;
- "unknown" when the project lacks sufficient evidence.

Avoid language that turns model confidence or visual plausibility into certainty.

## Emergency context

In an active wildfire emergency, FireViewer must not be presented as a substitute for local emergency services, prefectures, civil-protection authorities, fire services or other competent official sources.
