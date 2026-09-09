# Repository and publication guide

## Authoritative locations

- [FireViewer documentation](https://github.com/fireviewer/Fireviewer_doc) is the canonical public project description.
- [FireViewer on Hugging Face](https://huggingface.co/fireviewer) is authoritative for hosted model/dataset cards, weights, measured-map packages, immutable revisions and artifact visibility.
- Component repositories are authoritative for their code and machine-readable contracts.
- Incident evidence tickets and reviewed backend records are authoritative for the provenance of an incident-page claim.

No README proves that a service is deployed, enabled, funded, scientifically qualified or accepted on real data.

## Component map

| Component | Responsibility | Source access, September 2026 |
| --- | --- | --- |
| `.github` | Organisation profile and shared contribution policies. | Public |
| `Fireviewer_doc` | Canonical architecture, qualification boundaries and repository guide. | Public |
| `fireviewer-backend` | Incidents, accounts, authorization, persistence, human decisions, audit and publication. Existing daily perimeter CLI remains here. | Private |
| `fireviewer-frontend` | Public viewer, administration, catalogue and chronological incident layers. | Private |
| `fireviewer-association-site` | Association website; separate source and deployment from the viewer. | Private |
| `fireviewer-contracts` | Versioned business contracts, shared geometry, Python models, TypeScript types and fixtures. | Private |
| `fireviewer-evidence-ingestion` | Sources, media, transcription and satellite acquisition/normalization. | Private |
| `fireviewer-vision-runtime` | Detection, pointing, segmentation and keyframes. | Private |
| `fireviewer-geolocation` | Geographic hypotheses, Panoramax, retrieval and registration. | Private |
| `fireviewer-evidence-supervisor` | Eve, acceptance, rejection, abstention and contradictions. | Private |
| `fireviewer-orchestrator` | Execution, dispatch, retries and idempotency; durable business authority remains in the backend. | Private |
| `fireviewer-fire-state` | Part.4 calculation, profiles, calibration and evaluation; transactions and revisions remain in the backend. | Private |
| `fireviewer-model-lab` | Corpus preparation, training, benchmarks and canonical registry; no weights or datasets in Git. Independent useful synthetic helpers remain here. | Private |
| `fireviewer-unreal` | Fire visualization and scenarios; generic cartographic tools are consumed from UWD. Source availability does not establish native runtime acceptance. | Private |
| `fireviewer-docker` | Immutable image/input locks, bounded retention and isolated execution composition. | Private |
| `fireviewer-ai-worker` | Compatibility imports and commands for consumers migrating to the dedicated components. | Private; compatibility |
| `fireviewer-spatial` | Historical spatial source and reference baseline; active generic producer is UWD. | Private; archived |
| `fireviewer-sdg` | Historical Blender/Omniverse simulation chains. | Private; archived |
| `models` | Historical registry source; canonical index moved into fireviewer-model-lab. | Private; archived |
| `unicornwhodev/map-builder` | UWD generic web builder, acquisition, treatment, packaging, CLI/API, producer UI/contracts and generic Unreal cartography plugin. | Private; UWD |

Repository visibility is an access decision, not a maturity level.

## Hugging Face resource boundary

The anonymous public organisation inventory inspected on 4 September 2026 exposes:

- **2 public model checkpoints**: `fireviewer/rtdetr-v2-r50-fire-smoke` and `fireviewer/dfine-large-fire-smoke-v7`;
- **7 public dataset repositories**.

This is a public-visibility snapshot, not a statement about every private research artifact or historical checkpoint.

Private/restricted resources are used when rights do not support public redistribution, when material is research-only, or when artifacts are retained only for provenance. Deprecated, superseded, incomplete and low-quality model checkpoints are consolidated in a private legacy archive when retained and are not part of the active public model list.

See [Resources](RESOURCES.md) for the classification rules.

## Measured maps

The canonical hosted repository for real measured map builds is:

[`fireviewer/simple-measured-scenes-v1`](https://huggingface.co/datasets/fireviewer/simple-measured-scenes-v1)

Published map paths are treated as compatibility-sensitive interfaces because the viewer and other consumers may resolve them directly. Documentation cleanup must **not** rename, move or reorganise existing map packages.

`fireviewer-spatial/reference/map-builder-reference-v1` is a validation/migration baseline, not a production map. It remains in place because moving it is unnecessary for documentation cleanup and could break references; documentation should simply classify it correctly.

Synthetic Omniverse datasets and historical reproduction packs are separate resources and must not be listed as measured maps.

## Historical names

Some code namespaces, Hub slugs, archive names and manifests still contain `firewarning`. These names are retained for compatibility and provenance. The active project identity is **FireViewer**.

Renaming a compatibility identifier is not a documentation cleanup task unless all consumers and immutable references have a migration path.

## Repository documentation standard

Every component README should state:

1. the component's role and non-goals;
2. its place in the evidence or spatial flow;
3. capabilities visible in the source;
4. the difference between implemented, guarded and accepted behaviour;
5. safe local validation commands where applicable;
6. security, privacy, provenance and licensing boundaries;
7. the canonical documentation and contact links;
8. whether any names/paths are compatibility-sensitive or legacy.

Operational runbooks, provider secrets, private evidence, machine-specific paths, internal roadmaps and raw validation logs do not belong in the public documentation set.

Git repositories are source-only publication surfaces. Datasets, weights,
checkpoints, imported 3D assets, measured-map packages and reproduction outputs
remain outside Git. The private frontend/backend retain one bounded,
source-backed Die / Justin demonstration made from authored JSON/GeoJSON and
public citations, without source media or reproduction outputs. No other
packaged retrospective or multi-incident corpus is retained. A separate fully
synthetic incident configuration fixture remains in the private
`fireviewer-unreal` repository to document the JSON/GeoJSON contract. See
[Repository hygiene](REPOSITORY_HYGIENE.md).

## Community and governance

FireViewer is currently small, so project-wide community policies are kept in one place rather than copied and slowly diverging across every repository.

Shared policies:

- [Contributing](https://github.com/fireviewer/.github/blob/main/CONTRIBUTING.md)
- [Code of Conduct](https://github.com/fireviewer/.github/blob/main/CODE_OF_CONDUCT.md)
- [Security](https://github.com/fireviewer/.github/blob/main/SECURITY.md)
- [Support](https://github.com/fireviewer/.github/blob/main/SUPPORT.md)

Technical governance is documented in [`GOVERNANCE.md`](../../GOVERNANCE.md).

FireViewer currently uses maintainer-led technical governance.

A French non-profit association is being created to provide administrative and financial stewardship. It does not replace the technical governance model unless a later public decision explicitly changes that structure.

Repositories with a component-specific security note may retain a local `SECURITY.md`, but it should point back to the project-wide policy rather than define a separate incompatible process.

## Update rule

When code changes a public architectural contract, update the canonical documentation in the same release window. As of 4 September 2026, the current Part.4 line is **3.3**, adding dated administrative initialization and restorable state chains to the earlier provenance/calibration implementation. See [Daily reconstruction](RECONSTRUCTION.md) for its qualification boundary.

## Restructuring boundary

UWD supplies geography independently of FireViewer incident accounts and decisions. FV attaches every new map request to an existing incident before dispatch. Terrain packages publish automatically after technical integrity checks; this does not publish AI/LLM claims or bypass their human decisions. Natural and altitude views share measured terrain. Dated wildfire perimeters, activity/flames and located-photo references remain separate incident layers.

The existing measured-map catalogue and published paths remain compatible. Existing daily perimeter production and its viewer are preserved. Generalizing the agentic perimeter/photo workflow, qualifying native Unreal or GPU paths and scientific calibration remain distinct functional work; repository extraction does not declare them complete.

Unity and Blender/Lightning production are retired. Necessary readers of already accepted historical packages remain for compatibility. The former house Hunyuan3D/Asset4Sim pack (references 001–294, historically called the 209-assets pack), including its derivatives, is excluded from active production. The six admitted Quaternius CC0 trees are a separate resource.

Repository allocation records technical stewardship. Original licenses and attribution notices remain applicable; unsigned transfer or usage agreements are not presented as executed legal acts. Neither website requires a public source repository to serve its public pages.
