# FireViewer — Migration and Feature Flags

**Additive migration code:** `implemented_not_live_verified`

**Deployed activation:** `pending`

This document describes the technical migration from historical v1 paths to the event-oriented v2 implementation. It does not redefine the canonical FireViewer architecture documented in [ARCHITECTURE.md](ARCHITECTURE.md).

The migration `b7f2e4a9c810` adds the event domain, jobs, review, external-source registry, source plans and publication snapshots without deleting historical objects. Compilation/schema-drift checks were performed locally. The migration still requires representative PostgreSQL/PostGIS upgrade, backup, restore and downgrade evidence before broader activation.

## Strategy

- additive migration only;
- keep required v1 routes during compatibility period;
- v2 contribution, analysis, connectors and publication remain flag-controlled;
- no automatic backfill;
- no legacy object is silently upgraded into a richer semantic class;
- rollback is performed by disabling v2 paths and returning to the compatible public projection, not by deleting v2 data.

## Important note about 3D flags

`FV_3D_PRIMARY_ENABLED` / `VITE_FV_3D_PRIMARY_ENABLED` are **historical implementation/migration switches**.

They do not define current FireViewer product doctrine. The canonical architecture treats text, 2D and 3D as presentation/inspection layers over immutable spatial and temporal artifacts. The core map builder is headless and independent from browser rendering technology.

The flags can remain until the migration code no longer needs them, but documentation outside implementation details should not describe FireViewer as a "3D-primary" product.

## Tables added

- `incident_candidate`;
- `viewpoint`;
- `event_candidate`;
- `event_analysis_job`;
- `evidence_asset`;
- `localization_attempt`;
- `fire_activity_event`;
- `fire_activity_event_evidence`;
- `event_relation`;
- `activity_envelope_revision`;
- `activity_envelope_support`;
- `progression_delta`;
- `publication_snapshot`;
- `external_provider`;
- `external_collection`;
- `external_artifact_revision`;
- `external_claim`;
- `artifact_lineage`;
- `incident_source_plan`.

On PostgreSQL, the migration also adds PostGIS columns, GiST indexes, synchronisation triggers, append-oriented protections for the external registry and public-snapshot immutability/retraction guards. These remain `implemented_not_live_verified` until exercised on a representative live instance.

## Historical object mapping

| Historical object | Possible target | Rule |
| --- | --- | --- |
| `Observation` | `EventCandidate` or assertion | Only if viewpoint, time and context really exist. |
| `AgentSpatialProposal` | `LocalizationAttempt` | Preserve method, model, revision and abstention. |
| `AgentFactProposal` | `ExternalClaim` or assertion | Never invent missing geometry. |
| `IncidentSpatialMarker` | candidate geometry | Human review required before accepted event state. |
| `ActiveFireZoneRevision` | `ActivityEnvelopeRevision` | Preserve source/support lineage; do not assume source independence. |
| `IncidentBulletinEntry` | editorial assertion | Do not create a spatial event without spatial evidence. |
| media/contribution | `EvidenceAsset` | An isolated media item does not automatically become an event. |

Future migration adapters should report `convertible`, `incomplete`, `ambiguous` or `rejected`. `incomplete` and `ambiguous` remain private. Complete backfill/report tooling remains `pending`.

## Backend and worker flags

| Variable | Initial value | Status | Enables |
| --- | --- | --- | --- |
| `FV_EVENT_V2_ENABLED` | `false` | `implemented_tested_local` | v2 contribution/review routes; deployed activation still requires its dependencies. |
| `FV_SUPABASE_AUTH_ENABLED` | `false` | `implemented_tested_local` | Supabase-backed auth mode with matching server configuration. |
| `FV_AGENT_EVENT_PIPELINE_ENABLED` | `false` | `implemented_tested_local` | Worker handling of `schema_version=event-2.0` payloads. |
| `FV_AGENT_EVENT_PIPELINE_ENABLED` via backend dispatcher config | `false` | `implemented_tested_local` | Event-oriented dispatch path. |
| `FV_OFFICIAL_CONNECTORS_ENABLED` | `false` | `implemented_tested_local` for registry/scheduler | Claims source plans; does not imply any live provider is qualified. |
| `FV_3D_PRIMARY_ENABLED` | `false` | `implemented_tested_local` for legacy switch/fallback | Historical frontend display preference only; temporary backend alias may exist. |
| `FV_V2_PUBLICATION_ENABLED` | `false` | `implemented_tested_local` for transition | Publication of an analyst-validated event under the current role/session policy. |

The general dispatcher retains its own historical gates, including `FV_AGENT_DISPATCH_ENABLED`. Enabling the event pipeline without a functioning dispatcher does not process jobs.

The official-source registry can be initialised without network access through repository tooling. Scheduler entry points existing in code do not by themselves prove hosted execution or successful live provider collection.

## Frontend flags

Vite exposes only variables prefixed with `VITE_`, including:

- `VITE_FV_EVENT_V2_ENABLED`;
- `VITE_FV_SUPABASE_AUTH_ENABLED`;
- `VITE_FV_OFFICIAL_CONNECTORS_ENABLED`;
- `VITE_FV_AGENT_EVENT_PIPELINE_ENABLED`;
- `VITE_FV_3D_PRIMARY_ENABLED`;
- `VITE_FV_V2_PUBLICATION_ENABLED`.

Only the exact configured activation value enables a flag according to the frontend implementation. Frontend flags grant no server authority; backend roles and transitions remain authoritative.

## Activation sequence

1. restore a representative recent database copy;
2. run migration upgrade, PostGIS checks and downgrade on that copy;
3. upgrade again and verify historical objects;
4. configure identity, private storage/scanning and other required deployed dependencies;
5. enable v2 only in a private/staging environment;
6. validate contribution, upload, dispatch, abstention and review;
7. validate each external-source adapter independently;
8. enable publication only on a controlled reference incident;
9. compare legacy/current projections where migration still requires it;
10. test rollback and restoration;
11. document an explicit decision before any broader activation.

## Double write / v1 delegation

Double-write and automatic delegation remain `pending`. They are acceptable only if:

- one transaction links v1/v2 identities;
- a partial failure cannot publish a partial state;
- immutable source material is not duplicated as independent evidence;
- divergences are measured;
- only one public projection is authoritative at a time.

## Backfill

A future backfill must:

- operate by incident/time window;
- be replayable and idempotent;
- preserve historical objects;
- never invent viewpoint, precision, observation time or lineage;
- publish nothing automatically;
- produce a coverage/rejection report.

## Rollback

Functional rollback disables v2 paths and restores the compatible public read path. It does not delete v2 tables or evidence. Private jobs are completed, failed or suspended according to explicit state.

Destructive migration remains out of scope until the compatibility period is closed by a documented decision.
