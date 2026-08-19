# FireViewer — Status Matrix

This matrix separates **documented intent, implementation, local validation, deployed validation and scientific qualification**.

A working code path is not automatically a validated field capability. A published model is not automatically promoted into the runtime. A successful local test is not proof of provider availability, operational safety or geographic accuracy.

## Status vocabulary

| Status | Meaning |
| --- | --- |
| `contract_defined` | Contract or target behaviour is documented. No runtime claim. |
| `specified_not_implemented` | Target behaviour exists in documentation but the runtime is absent. |
| `implementation_in_progress` | Partial implementation exists but the capability is incomplete. |
| `implemented_unverified` | Code exists, but targeted validation has not been recorded. |
| `implemented_tested_local` | Code exists and targeted local tests have passed. No deployed/live claim. |
| `implemented_not_live_verified` | Code/integration exists, but the relevant live provider or deployed environment has not been fully exercised. |
| `integrated_unbenchmarked` | Connected to a workflow but not scientifically promoted through a FireViewer benchmark. |
| `benchmark_preliminary` | Benchmark evidence exists, but environment/data/revision controls are not yet strong enough for stable scientific promotion. |
| `shadow` | Executes without authority to produce a publishable result. |
| `benchmark_only` | Available only for evaluation/comparison. |
| `blocked` | Implementation or plan exists but promotion is forbidden until an explicit gate is satisfied. |
| `pending` | Required implementation/evidence is still missing. |
| `historical` | Kept for history or migration; not part of the canonical current path. |

## Project-level capabilities

| Capability | Status | Evidence / current boundary |
| --- | --- | --- |
| Canonical cross-repository documentation | `implementation_in_progress` | Current refactor establishes the spatial-temporal-replay architecture and partner-facing documentation. |
| Stable incident identity and event model | `implemented_tested_local` | Backend/event contracts and frontend flows exist with targeted tests; deployed end-to-end qualification remains separate. |
| Evidence/provenance registry | `implemented_tested_local` | Hashes, revisions, source identity and audit primitives exist locally; full replay qualification remains pending. |
| Human review before publication | `implemented_tested_local` | Review/publication separation is implemented in the event architecture; live multi-role deployment remains separately gated. |
| Headless map builder core | `implemented_tested_local` | `fireviewer-spatial` contains the canonical map-production code and contracts. |
| Provider-backed map batch execution | `implemented_not_live_verified` | Lightning-oriented batch-job path and backend contract are documented/implemented; representative live campaign evidence is still required. |
| Autonomous spatial package | `implemented_tested_local` | OpenUSD/Blender package generation and hashing paths exist; independent reference-build reopening is a current milestone. |
| PNG capture gallery as production artifact | `historical` | The canonical production path now prioritises the validated ZIP and exposes no required capture gallery. |
| Observed perimeter package | `implemented_tested_local` | Spatial code normalises perimeter geometry and produces reference timeline artifacts. |
| Full reviewed fire-evolution timeline | `implementation_in_progress` | Temporal contracts and public event timeline exist, but complete observed/reconstructed replay qualification remains incomplete. |
| Complete reference replay incident | `pending` | Replay doctrine exists; one independently reopened end-to-end reference incident is still required. |
| Post-event study package | `contract_defined` | Method and boundaries documented; reference study artifact still required. |
| External-source live validation | `implemented_not_live_verified` / `pending` | Depends on connector family; local adapters exist for some sources, but live provider validation is incomplete. |
| Public emergency/operational capability | `blocked` | FireViewer is not qualified or positioned as an operational emergency system. |
| Wildfire propagation prediction | `blocked` | Not part of FireViewer core. Simulation/research must remain semantically separate from observation. |

## Repositories

| Repository | Role | Current status |
| --- | --- | --- |
| `fireviewer-frontend` | Contribution, review, public presentation | `implemented_tested_local` with deployed-path gates tracked separately |
| `fireviewer-backend` | Registry, evidence, orchestration, audit, publication | `implemented_tested_local` with provider/PostGIS live gates tracked separately |
| `fireviewer-ai-worker` | Private AI analysis/localisation/abstention | `implemented_tested_local`; scientific promotion depends on benchmark evidence |
| `fireviewer-spatial` | Map packages and temporal spatial layers | `implemented_tested_local`; representative deployed production/replay gates remain |
| `fireviewer-sdg` | Optional synthetic-data/simulation R&D | `implemented` as a separate research component; not a FireViewer core dependency |
| `Fireviewer_doc` | Canonical cross-project documentation | active source of truth |
| historical monorepo | Previous integrated codebase | `historical` |

## Spatial production

| Function | Status | Current boundary |
| --- | --- | --- |
| WGS84 request → Lambert-93 production plan | `implemented_tested_local` | Axis/CRS correctness still requires representative live evidence in the reference build. |
| 500 m tile production | `implemented_tested_local` | Canonical current map-builder design. |
| Temporary MNT/MNS/orthophoto acquisition | `implemented_not_live_verified` | Code path exists; provider availability/licensing and representative live runs remain gates. |
| Terrain and orthophoto packaging | `implemented_tested_local` | Package integrity is checked by spatial tooling. |
| MNS−MNT contextual placement path | `implemented_tested_local` | Scientific/visual accuracy remains separate from code correctness. |
| Shared prototype bundle and hashing | `implemented_tested_local` | Used to avoid unnecessary duplication in packages. |
| `zone.usda` generation | `implemented_tested_local` | Independent reopening gate still required for reference incident. |
| `zone.blend` generation | `implemented_tested_local` | Same independent-reopening requirement. |
| Large-package storage and delivery | `implemented_not_live_verified` | Provider-specific delivery/recovery requires representative validation. |
| Map-job cancellation/recovery | `implemented_not_live_verified` | Contracts/path exist; failure-injection on deployed jobs remains important. |
| Runtime dependence on Unity | `historical` | Not part of canonical map production. |
| Runtime dependence on Omniverse | `historical` for core | Omniverse may remain in optional SDG research only. |

## Temporal and replay

| Function | Status | Current boundary |
| --- | --- | --- |
| Normalised observed perimeter package | `implemented_tested_local` | Semantic source qualification remains source-specific. |
| Timeline JSON / OpenUSD perimeter layer | `implemented_tested_local` | Canonical data remains distinct from browser GLB views. |
| Unknown intervals preserved | `contract_defined` and implemented in perimeter semantics | Full cross-system replay case still pending. |
| Retrospective reconstruction family | `implemented` as data methodology | Must never be relabelled as observed perimeter. |
| Public event timeline v2 | `implemented_tested_local` | Deployed replay/rollback qualification remains. |
| Complete immutable replay manifest | `pending` | Required for reference replay milestone. |
| Independent replay reopening | `pending` | Key project milestone. |
| Post-event benchmark export | `contract_defined` | Requires explicit export/split methodology and leakage review. |

## AI and perception components

These statuses describe FireViewer integration/promotion, not whether an upstream model exists.

The current public model/dataset inventory and benchmark details are documented in [Models, Datasets and Benchmarks](MODELS_DATASETS_BENCHMARKS.md).

| Function | Component | Status |
| --- | --- | --- |
| Speech-to-text | Whisper Large V3 Turbo | `integrated_unbenchmarked` |
| Primary image detection | D-FINE XLarge FireViewer | `benchmark_preliminary` — integrated; preliminary detection comparison exists but is not scientifically qualified |
| Video triage / secondary detection | RT-DETRv2-R50 FireViewer | `benchmark_preliminary` — integrated; preliminary detection comparison exists but is not scientifically qualified |
| Compact detection challenger | RF-DETR Small FireViewer | `benchmark_preliminary` — preliminary detection comparison exists; remains a challenger until common qualification |
| Large detection challenger | RF-DETR Large FireViewer | `benchmark_only` |
| Visual pointing reference | MolmoPoint-8B FireViewer | `benchmark_preliminary` — integrated; small public independent benchmark exists |
| Structured-analysis historical path | Qwen-family integration | `historical` / migration-dependent |
| Structured-analysis target work | Ministral-family target | `blocked` until integration and qualification evidence |
| OCR | PP-OCRv6 Small | `blocked` until fully connected/qualified |
| DINOv3 segmentation/pointing challenger | DINOv3 multi-task | `benchmark_only` |
| Segmentation baseline | SegFormer | `benchmark_only` |
| Annotation/correction | SAM-family tooling | `benchmark_only` / tooling |
| Burned-area auxiliary analysis | Prithvi | `integrated_unbenchmarked` |
| Ground/UAV matching candidates | RoMa-family / related matchers | `benchmark_only` or `blocked` depending on path |
| Deterministic pose | PyCOLMAP | `blocked` for promotion until full integration/benchmark |
| Auxiliary depth | MoGe | `benchmark_only` |

## Event and backend gates

| Function | Status | Remaining evidence |
| --- | --- | --- |
| Event v2 contracts/API/provenance | `implemented_tested_local` | deployed integration and replay campaign |
| PostgreSQL/PostGIS migrations | `implemented_not_live_verified` | representative live migration, backup and restore |
| Frontend authentication path | `implemented_tested_local` | live identity-provider/session recipe |
| Private evidence upload/finalisation | `implemented_tested_local` | live blob/scan/large-media validation |
| Persistent dispatcher | `implemented_tested_local` | real transport interruption/recovery campaign |
| Worker event bundle/result | `implemented_tested_local` | GPU benchmark and representative incident evidence |
| Localisation attempt + abstention persistence | `implemented_tested_local` | metric benchmark and correction/replay evidence |
| Analyst/editor review separation | `implemented_tested_local` | deployed multi-role/browser recipe |
| External source registry/revisions | `implemented_tested_local` | live provider families and storage backends |
| Hosted scheduler/connectors | `implemented_not_live_verified` | credentials, quota, correction and downtime behaviour |
| Activity envelope engine | `pending` | calibrated engine and evidence-support rules |
| Progression delta engine | `pending` | deterministic computation and replay |
| Replacement/rollback of public v2 state | `pending` | action contracts, storage and replay |

## Evidence already recorded in earlier local validation

Previous project documentation records substantial local test coverage across the backend, worker and frontend. Those counts remain useful historical evidence of code quality at those revisions, but they must not be treated as proof that the current deployed system or current branch has identical behaviour.

For that reason, this matrix intentionally avoids using historical test totals as marketing claims. New public claims should reference reproducible CI/build/benchmark artifacts tied to the exact revision being described.

## Funding-readiness gaps

The highest-value gaps before larger grant/sponsorship requests are:

1. one independently reopened reference map build;
2. one complete replay incident;
3. archived map-job cost/runtime/storage measurements;
4. a fixed localisation/abstention benchmark;
5. at least one live external-source connector validation;
6. a documented deployed backup/recovery exercise;
7. a small number of public technical case studies.

These gaps are attractive funding targets because each can produce a concrete, auditable deliverable.

## Update rule

A status promotion should reference, as applicable:

- exact code revision;
- contract revision;
- test or recipe artifact;
- benchmark/replay artifact;
- provider/environment used;
- known limitations;
- promotion/review decision.

A README must not silently upgrade a capability beyond this matrix.
