# FireViewer — Acceptance and Replay Matrix

This document defines **what must be demonstrated** before a FireViewer capability is described as reproducible, deployed, benchmarked or ready for broader public/research use.

It complements [STATUS_MATRIX.md](STATUS_MATRIX.md): the status matrix says where a capability is today; this matrix defines the evidence needed to move it forward.

## Status meanings

| Status | Meaning |
| --- | --- |
| `implemented_tested_local` | Code exists and targeted local tests have passed. |
| `implemented_not_live_verified` | Integration exists but the relevant provider/deployed environment has not been fully exercised. |
| `contract_defined` | Behaviour is specified; full implementation/evidence may be absent. |
| `pending` | Required implementation or proof is missing. |
| `blocked` | Promotion is intentionally forbidden until an explicit gate is satisfied. |

A local success never proves field accuracy, provider availability or operational safety.

---

# 1. Documentation and governance

| Gate | Current state | Acceptance evidence |
| --- | --- | --- |
| Canonical project positioning | in refactor | README, architecture, status, roadmap and support docs use the same project definition |
| Core no longer described as Unity/Omniverse dependent | in refactor | no canonical core document makes either runtime mandatory |
| SDG remains separate | in refactor | Omniverse/Isaac/NuRec references are clearly scoped to optional synthetic-data R&D |
| Funding claims are honest | in refactor | no charitable/tax/institutional status is implied; support needs are tied to concrete outputs |
| Repository documentation remains clean | in refactor | one canonical cross-project source; component repos only keep local implementation docs |

---

# 2. Canonical map-builder acceptance

The measured map package is a core FireViewer artifact.

## 2.1 Request and planning

| Gate | Current state | Acceptance evidence |
| --- | --- | --- |
| WGS84 input accepted | `implemented_tested_local` | contract/schema tests and representative request |
| Lambert-93 production plan | `implemented_tested_local` | tile plan with documented axis order / CRS transformation |
| 500 m grid consistency | `implemented_tested_local` | deterministic plan for same request/revision |
| Fixed placements validated | `implemented_tested_local` | invalid placement rejected; valid placement obtains terrain altitude |

## 2.2 Geographic acquisition

| Gate | Current state | Acceptance evidence |
| --- | --- | --- |
| MNT acquisition | `implemented_not_live_verified` | live provider request, receipt, bounds/resolution and failure handling |
| MNS acquisition | `implemented_not_live_verified` | same |
| Orthophoto acquisition | `implemented_not_live_verified` | same |
| Missing/invalid raster cells | implemented path | archived receipt records repair count/method and bounded behaviour |
| Licence/attribution | source-dependent | provider/product policy recorded before public redistribution |

## 2.3 Tile build

| Gate | Current state | Acceptance evidence |
| --- | --- | --- |
| deterministic terrain package | `implemented_tested_local` | repeat run or deterministic fixture comparison |
| LOD outputs | `implemented_tested_local` | expected files and geometry checks |
| baked ground texture | `implemented_tested_local` | package references resolve independently |
| contextual placement | `implemented_tested_local` | algorithm revision and source receipts recorded |
| prototype bundle integrity | `implemented_tested_local` | hashes validated and unused assets excluded from final package where contract requires |

## 2.4 Zone package

Accepted package includes current contract-required files such as:

```text
zone.usda
zone.blend
zone.done.json
zone-plan.json
zone-context.json
packages/<tile>/
shared/prototypes/
provenance/<tile>/
```

| Gate | Current state | Acceptance evidence |
| --- | --- | --- |
| `fireviewer.simple-measured-map-package.v2` valid | `implemented_tested_local` | schema/manifest validation |
| all hashes valid | `implemented_tested_local` | byte-for-byte verification |
| raw rasters absent from final ZIP | `implemented_tested_local` | archive inventory |
| package independently reopenable | `pending` for reference incident | reopen on a second environment without rebuilding terrain |
| final ZIP recoverable from durable storage | `implemented_not_live_verified` | upload + authenticated download + hash verification |

**Important:** a gallery of 20 control PNGs is no longer a canonical acceptance requirement. Review renders may exist as derived artifacts, but the map contract is validated from the package itself.

---

# 3. Temporal fire-layer acceptance

| Gate | Current state | Acceptance evidence |
| --- | --- | --- |
| observed perimeter normalisation | `implemented_tested_local` | JSON/GeoJSON → canonical EPSG:2154 geometry |
| reference timeline artifacts | `implemented_tested_local` | USD, normalised JSON, timeline and manifest produced |
| exact map-build binding | `implemented_tested_local` at contract level | package refuses incompatible base build |
| unknown intervals preserved | contract/implementation semantics present | no canonical intermediate geometry is invented |
| derived GLB marked non-authoritative | implemented in spatial semantics | browser view can be regenerated without changing reference data |
| retrospective reconstruction kept separate | implemented as methodology | `reconstructed` cannot pass observed-perimeter contract |
| public semantics understandable | `pending` broader review | UI/text clearly separates observed, reconstructed, burned, simulated and unknown states |

---

# 4. Reference replay acceptance

A complete replay is a major FireViewer milestone and is **not yet considered proven** until one end-to-end reference case passes these gates.

## 4.1 Required bindings

A replay manifest should identify:

- stable incident/episode identity;
- exact map package/build and hash;
- exact temporal package/state revisions;
- evidence/source references;
- relevant licence/privacy constraints;
- producing tool/model revisions;
- stage parameters/profiles;
- localisation attempts and abstentions;
- human review decisions;
- public snapshot/retraction lineage.

## 4.2 Replay gates

| Gate | Current state | Acceptance evidence |
| --- | --- | --- |
| replay manifest contract | `pending` complete form | schema + fixture covering one full incident |
| immutable map reference | partial | accepted map package and hash |
| immutable timeline reference | partial | accepted temporal package and map binding |
| model/tool revision lock | partial | model manifests and producer revisions resolvable |
| human-decision references | partial | audit entries linked without pretending decisions are deterministic outputs |
| independent reopening | `pending` | second environment/reviewer can inspect artifacts |
| post-event study from replay | `pending` | new study artifact references replay without changing it |
| integrity after storage round-trip | `pending` full case | remote download hashes match archive manifest |

---

# 5. Event, evidence and publication acceptance

| Gate | Current state | Acceptance evidence |
| --- | --- | --- |
| viewpoint distinct from activity geometry | `implemented_tested_local` | API/worker negative tests |
| message-only candidate accepted | `implemented_tested_local` | candidate/job persists without invented geometry |
| multi-media candidate | `implemented_tested_local` | bounded upload/finalisation tests |
| MIME/size/hash validation | `implemented_tested_local` | valid + invalid cases |
| private evidence access control | `implemented_tested_local` | anti-IDOR / role tests; deployed store test still required |
| source trust is server-side | `implemented_tested_local` | unregistered source cannot self-declare institutional authority |
| immutable audit path | `implemented_tested_local` | mutation/rejection tests and hash checks |
| analyst/editor separation | `implemented_tested_local` | validation and publication are separate actions |
| public retraction | `implemented_tested_local` | retraction removes active public state while preserving audit lineage |
| replacement/rollback | `pending` | explicit actions and replay restoration evidence |

---

# 6. AI and localisation acceptance

## 6.1 General AI rules

| Gate | Current state | Acceptance evidence |
| --- | --- | --- |
| model output remains proposal | `implemented_tested_local` | no direct publication path |
| typed abstention | `implemented_tested_local` | reason codes persist through worker/backend |
| model/revision recorded | `implemented_tested_local` in contracts | archived run resolves exact model revision |
| evidence references valid | `implemented_tested_local` | output cannot cite absent parent evidence |

## 6.2 Localisation benchmark

Promotion requires a fixed, incident-aware evaluation corpus.

Minimum study should measure where appropriate:

- localisation error in metres;
- success rate on admissible cases;
- abstention rate;
- error conditional on acceptance;
- failure families by view/profile;
- calibration or uncertainty quality where a defensible target exists;
- source/incident leakage controls.

| Gate | Current state | Acceptance evidence |
| --- | --- | --- |
| fixed benchmark corpus | `pending` | versioned splits by incident/source |
| ground-truth/review protocol | `pending` | documented target quality and uncertainty |
| MolmoPoint reference evaluation | `pending` complete benchmark | archived report |
| DINOv3 challenger comparison | `benchmark_only` | same corpus/protocol |
| RoMa / spatial matcher comparison | `benchmark_only` / blocked | same corpus/protocol |
| PyCOLMAP integration | blocked for promotion | deterministic pose + replay + failure analysis |
| abstention calibration | `pending` | separate analysis from localisation accuracy |

No component is promoted on a single headline score.

---

# 7. External-source acceptance

| Gate | Current state | Acceptance evidence |
| --- | --- | --- |
| HTTPS / bounded domains | `implemented_tested_local` for current connector framework | SSRF/redirect behaviour tested in deployed broker where applicable |
| licence and attribution required | `implemented_tested_local` in registry | source-specific legal review before redistribution |
| same URL/new content → revision | `implemented_tested_local` | immutable revision fixture and live-provider example |
| same acquisition through two services recognised | contract/local logic | provider-specific identity mapping |
| correction/retraction lineage | `implemented_tested_local` locally | live provider correction exercise where available |
| CRS/footprint retained | `implemented_tested_local` at contract level | representative provider artifact |
| scheduler lease/backoff | `implemented_tested_local` | hosted concurrent execution still to validate |
| at least one live source family | `pending` complete acceptance | credential/quota/downtime/licence evidence |

---

# 8. Deployment, recovery and security acceptance

| Gate | Current state | Acceptance evidence |
| --- | --- | --- |
| backend deployed database migration | `implemented_not_live_verified` | migration on representative PostgreSQL/PostGIS environment |
| backup + restore | partial/local | restored copy passes integrity/audit checks |
| blob/object storage large artifact path | `implemented_not_live_verified` | large package upload/download/hash cycle |
| map-job cancellation | `implemented_not_live_verified` | deployed worker cancellation and terminal state |
| transient provider failure | `pending` representative drill | retry/abort does not create duplicate accepted artifact |
| secrets absent from browser/artifacts | `implemented_tested_local` | bundle/archive inspection |
| security incident/retraction path | partial/local | deployed exercise and documented response |

---

# 9. Funding / partnership readiness gates

These gates are not scientific capabilities; they determine whether FireViewer can approach external support programmes with a clear, defensible project package.

| Gate | Current state | Evidence |
| --- | --- | --- |
| concise public mission | current refactor | README + Project Overview |
| technical architecture | current refactor | Architecture + Map Builder + Timeline docs |
| concrete funding ask | current refactor | Funding Brief + Support and Partnerships |
| measurable funded outputs | defined | roadmap priorities tied to artifacts/benchmarks |
| honest maturity statement | defined | Status Matrix |
| safety boundaries | defined | Safety and Scope |
| reproducibility doctrine | defined | Provenance and Replay docs |
| measured infrastructure cost | `pending` | archived real run metrics |
| public reference case | `pending` | replayable incident + post-event study |
| stable support mechanism | `pending` | mechanism selected according to legal/program requirements |

---

# 10. Reference incident acceptance checklist

A FireViewer reference case should not be called fully replayable until all applicable items are satisfied:

- [ ] stable incident identity;
- [ ] exact source/evidence inventory;
- [ ] accepted measured map package v2;
- [ ] package independently reopened;
- [ ] temporal states classified and time-bounded;
- [ ] unknown intervals preserved;
- [ ] all canonical hashes verified after storage round-trip;
- [ ] AI/deterministic processing revisions locked;
- [ ] abstentions/failures preserved;
- [ ] human review decisions referenced;
- [ ] public/retracted snapshots versioned where applicable;
- [ ] replay manifest validates;
- [ ] one independent post-event study consumes the replay;
- [ ] study output does not mutate historical artifacts;
- [ ] privacy/licence restrictions are documented;
- [ ] limitations are understandable to an external reviewer.

## Promotion rule

The project uses the following progression as a default:

```text
contract
→ implementation
→ local validation
→ deployed validation
→ replay / benchmark evidence
→ private or shadow use
→ independent review
→ limited public promotion
```

Skipping a gate requires a documented reason; it does not silently upgrade the evidence level.
