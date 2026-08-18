# FireViewer — Contract Map

## Principle

Every cross-component contract has:

- a producer;
- one or more consumers;
- a version;
- a schema or typed representation;
- compatibility rules;
- an integrity/version lock where applicable;
- a documented owner.

Contracts are the boundaries that let FireViewer change runtimes or providers without silently changing the meaning of archived incidents.

## Cross-repository contracts

| Contract / family | Producer | Consumers | Role |
| --- | --- | --- | --- |
| Event candidate v2 | Frontend / Backend | Backend / AI worker | Private viewpoint, time, message/evidence and admission context. |
| Event and provenance v2 | Backend | Frontend / AI worker / spatial | Events, revisions, relations, temporal semantics and provenance. |
| External source artifact | Connector / Backend | Backend / AI worker | Versioned external product with licence, time, CRS and lineage. |
| Evidence artifact | Backend / worker | Backend / Admin frontend | Immutable evidence/derived-artifact lineage. |
| Localization attempt | AI worker / spatial | Backend / Admin frontend | Proposed spatial result or typed abstention. |
| Fire activity event | Backend | Frontend / replay consumers | Reviewed event state with evidence, time and geometry references. |
| Activity envelope revision | Backend / spatial | Frontend / publication | Multi-event interpretation with explicit supports; not a direct observation. |
| Publication snapshot | Backend | Frontend / replay | Immutable public revision and retraction/replacement lineage. |
| Incident public metadata | Backend | Frontend | Stable incident identity and public state. |
| Viewer manifest | Backend | Frontend | Current web-view asset references and cache/version state. |
| Public incident view | Backend | Frontend | Public facts, temporal states, sources and download references. |
| Admin review | Backend | Frontend | Private review dossier and authorised actions. |
| Agent batch / event bundle | Backend | AI worker | Private evidence bundle, stages and execution constraints. |
| Agent result | AI worker | Backend | Structured proposals, anchors, localisation attempts, abstentions and reports. |
| `fireviewer.simple-measured-map-package.v2` | Spatial | Backend / frontend / replay/dataset consumers | Canonical autonomous OpenUSD/Blender map package, tile packages, used assets and provenance receipts. |
| `fireviewer.simple-measured-map-upload-contract.v2` | Spatial | Backend/storage | Validation boundary for ingestion of a measured map package. |
| `fireviewer.observed-perimeter-package.v1` | Spatial | Backend / frontend / replay/dataset consumers | Normalised observed perimeter layer and timeline bound to an exact map build. |
| `fireviewer.observed-perimeter-upload-contract.v1` | Spatial | Backend/storage | Validation boundary for observed-perimeter package ingestion. |
| `scene-consumer-input.v1` | Replay/dataset/simulation orchestration | Replay/dataset/simulation runtime | Immutable references to a map build and optional temporal package without rebuilding them. |
| Incident map download | Spatial production / publication | Public incident page / authorised consumers | Original accepted ZIP and exact build/hash reference. |
| Spatial registration input | Backend / spatial | AI worker | Authorised spatial references for localisation attempts. |
| Spatial proposal/result | AI worker / spatial | Backend / Admin frontend | Pose, raycast/intersection, uncertainty or abstention. |
| SDG case | SDG | Training/evaluation pipelines | Explicitly synthetic case with its own provenance. |
| Model manifest | AI worker / model registry | Runtime / bootstrap / docs | Model revision, role, profile and activation state. |
| Replay manifest | Replay orchestrator | Post-event study / benchmark / archive tools | Binding of exact spatial, temporal, evidence, processing and review revisions. |
| Post-event study artifact | Study workflow | Researchers / publication | New derived analysis that references a replay without rewriting it. |

## Important spatial correction

The canonical measured-map contract is **v2**.

The active map-production path does **not** require a gallery of 20 PNG captures. The canonical result is the validated autonomous package containing the OpenUSD/Blender scenes, tile packages, used prototype bundle and provenance receipts.

Browser views and study renders are derived consumers, not required canonical map artifacts.

## Canonical route

```text
/incident/{fire_id}
```

Compatibility aliases may exist during migrations, but the canonical public identity is stable.

## Separate decisions

The following decisions must not collapse into one status:

- fact validation;
- evidence validation/moderation;
- visual-anchor validation;
- geometry validation;
- uncertainty review;
- temporal-state classification;
- report/text validation;
- media publication;
- incident/public revision publication.

## Versioning

An incompatible semantic or structural change creates a new contract version.

Consumers should lock, where applicable:

- contract version;
- schema path/identifier;
- producer revision;
- expected hash or lockfile entry.

A new implementation behind an unchanged contract must still preserve the same observable semantics.

## Invalid or partial output

Invalid input is rejected before it becomes an accepted artifact.

A valid partial output may be preserved only when its partial status, missing stages and limitations are explicit. FireViewer prefers a typed partial/abstention state over fabricating a complete result.

## Replay rule

A replay consumer may read and analyse accepted packages. It must not silently regenerate terrain, rewrite historical perimeter states or substitute a newer model revision and still claim that the result is the original replay.

A changed method produces a new **study artifact** referencing the original replay.

## Canonical documentation

- [Architecture](ARCHITECTURE.md)
- [Map Builder](MAP_BUILDER.md)
- [Fire Evolution Timeline](FIRE_EVOLUTION_TIMELINE.md)
- [Replay and Post-Event Studies](REPLAY_AND_POST_EVENT_STUDIES.md)
- [Provenance and Reproducibility](PROVENANCE_AND_REPRODUCIBILITY.md)
- [Event API v2](contracts/EVENT_API_V2.md)
- [Event and Provenance v2](contracts/EVENT_AND_PROVENANCE_V2.md)
- [External Source Connectors](EXTERNAL_SOURCE_CONNECTORS.md)
- [Acceptance and Replay Matrix](ACCEPTANCE_AND_REPLAY_MATRIX.md)

Repository-specific schemas and implementation documents remain owned by their producer repositories. This repository defines the cross-project meaning and boundaries rather than duplicating every implementation file.
