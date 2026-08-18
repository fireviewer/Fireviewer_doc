# FireViewer — Terminology

This glossary defines the meanings used across FireViewer repositories. Terms that look similar in a viewer must remain semantically distinct in contracts and archived artifacts.

## Incident

Stable aggregate representing one wildfire case or a dossier being reconciled. It has a canonical `fire_id`.

## Episode

A distinct temporal phase inside the same incident, for example a documented reactivation.

## Source

Origin of information: contributor, organisation, sensor, publication, dataset, imagery provider or connector.

A source is not automatically independent from another source; two services may expose products derived from the same upstream acquisition.

## `EventCandidate`

Private object created during contribution/admission. It can contain a viewpoint, observation time, message, media/evidence references and analysis permissions. It may remain useful even when spatial localisation abstains.

## `Viewpoint`

Position of the observer or camera. It does not automatically represent active fire, smoke origin or fire-front location.

## Evidence

Immutable or versioned material used to support analysis or review: contributed media, derived frame, archived text, detector output, remote-sensing artifact or spatial reference.

Evidence can have parents. A crop or frame derived from one image is not an independent source.

## `EvidenceAsset`

Private contributed media object associated with an event candidate. External official/satellite/geographic products belong to the external-artifact family rather than being treated as user uploads.

## Evidence artifact

Derived artifact that preserves its parent references, hash, producing method/model and revision.

## Observation

Structured statement tied to one or more evidence references and a time/interval.

An observation can still be uncertain or contradictory.

## Sensor observation

Measurement or detection produced by a sensor/product with acquisition time, footprint and quality metadata. Its centroid is not automatically the exact location of the phenomenon.

## Interpreted observation

Derived interpretation produced by an algorithm or human analysis, for example a reviewed active zone or burned-area interpretation. Its method and parents remain visible.

## Official statement

Assertion attributed to an identified authority. Official status does not automatically imply exact spatial precision for every statement.

## Geographic reference

Data used to project, locate or contextualise information, for example a terrain model or orthophoto. A geographic reference does not prove fire activity.

## `MapBuild`

Immutable versioned spatial package produced by the canonical FireViewer map builder for a defined request and geographic area.

A map build contains/references its map-package contract, terrain/scene artifacts, used asset bundle and provenance receipts.

## Map builder

Headless production pipeline that converts a geographic request and measured source inputs into a portable spatial package.

The canonical FireViewer map builder does not depend on Unity or NVIDIA Omniverse.

## Tile

Current spatial production unit aligned to the Lambert-93 grid. The canonical active builder uses 500 m tiles.

## Spatial package

Portable output containing the spatial reference required by consumers. Current measured-map packages include OpenUSD and Blender scene representations plus tile/provenance artifacts.

## `LocalizationAttempt`

Replayable attempt to derive a defensible spatial result from evidence and an authorised spatial reference.

It returns either a geometry with uncertainty/provenance or a typed abstention/failure.

## Pointing

Production of a visual anchor in image coordinates. Pointing is not geolocation.

## Visual anchor

Point or line in an image representing a visible feature such as flame base, smoke-column base or visible front.

## Visual abstention

The model cannot propose a defensible anchor from the image.

Examples:

- `insufficient_visual_anchor`
- `ambiguous_anchor`
- `no_visible_ground_origin`

## Spatial registration

Estimation of the relationship between an image/camera and a georeferenced spatial reference.

## Camera pose

Camera position, orientation and model in a versioned metric reference frame.

## Raycast

Intersection of a ray derived from the camera model with the reference terrain/geometry.

## Geometric abstention

The spatial branch cannot produce a defensible location.

Examples:

- `insufficient_geometry`
- `unstable_camera_pose`
- `invalid_raycast`
- `uncertainty_above_limit`

## `uncertainty_envelope`

Geometry representing combined uncertainty from the relevant spatial stages. It should not be called a calibrated confidence ellipse until empirical calibration supports that interpretation.

## `FireActivityEvent`

Stable business object representing documented fire activity inside an incident. Information, geometry, interval, uncertainty, evidence and review evolve through explicit revisions.

## `EventRelation`

Versioned relationship between events/candidates such as temporal order, support, contradiction, replacement, proposed identity, split or merge.

## `ActivityEnvelopeRevision`

Reviewed multi-event interpretation representing a probable activity envelope. It is neither a direct observation nor a simulation/prediction.

## `ProgressionDelta`

Descriptive difference between two accepted revisions/states. It does not fill an unobserved period and does not forecast future propagation.

## Observed state

Temporal state represented as directly supported by an admissible observation/product under its contract.

`Observed` does not mean infallible; it means the state is being represented as observation rather than reconstruction or simulation.

## `observed_hotspot`

Thermal point/detection from a compatible sensor/product. It does not automatically confirm an active wildfire or exact fire-front position.

## `observed_burned_perimeter`

Surface observed/interpreted as burned under a compatible reviewed product contract. It does not automatically represent current active fire.

## `human_reviewed_active_zone`

Active-zone interpretation accepted or corrected through the human review path. It remains semantically distinct from direct observation and simulation.

## Retrospective reconstruction

Post-event geometry/state derived from historical evidence, area reports, sectors, maps or remote-sensing information.

A reconstruction can improve later understanding but must not be presented as what was directly observed at the historical time.

## Unknown interval

Time interval for which FireViewer has insufficient evidence to represent a canonical intermediate state.

Unknown intervals are intentionally preserved instead of silently interpolated.

## Simulation

State generated by a simulation/scenario model. It is separate from observations and reconstructions.

## `simulated_scenario`

Explicitly simulated scenario object/layer with its own model provenance.

## Prediction

Future-oriented model output generated from a dated run and assumptions. Prediction is not part of the canonical observed timeline and FireViewer core is not positioned as a certified forecasting product.

## `PublicationSnapshot`

Immutable versioned public representation produced from reviewed state. Later correction/retraction should create lineage rather than silently overwriting historical publication state.

## Replay

Reopening/re-execution context bound to the same recorded inputs, contracts, revisions and parameters.

A FireViewer replay is intended to preserve the exact spatial and temporal reference used historically rather than rebuilding them from current upstream data.

## Replay manifest

Versioned binding that identifies the spatial package, temporal states, evidence references, processing/model revisions and human decision references needed to inspect or reproduce a FireViewer replay.

## Post-event study

New analysis performed from an archived replay after the incident. Its outputs are new derived artifacts and do not rewrite the archived incident or historical timeline.

## Benchmark

Versioned evaluation with fixed inputs/splits, documented metrics and leakage rules. A benchmark result is meaningful only relative to its exact corpus and protocol.

## Shadow mode

Execution of a component without authority to create a publishable result, used for comparison and evidence gathering.

## Gate

Explicit condition that permits, blocks, redirects or sends a capability/output to review.

## Provenance

Information required to understand an artifact's origin, parents, timing, rights, transformations, producing revision and integrity.

## Integrity hash

Digest used to verify that an archived artifact has not changed. A hash proves integrity relative to recorded bytes; it does not prove scientific correctness.

## Reproducibility

Ability to reopen or regenerate an artifact/study from documented inputs, revisions and methods at the level actually claimed by the project.

See [Provenance and Reproducibility](PROVENANCE_AND_REPRODUCIBILITY.md) for FireViewer's reproducibility levels.
