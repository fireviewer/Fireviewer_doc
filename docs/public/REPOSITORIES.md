# Repository and publication guide

## Authoritative locations

- `fireviewer/Fireviewer_doc` is the canonical public project description.
- The FireViewer Hugging Face organisation is authoritative for hosted model, dataset and measured-map artifacts and their immutable revisions.
- Each component repository is authoritative for its own source; shared contracts belong in `fireviewer-contracts`.
- The backend is authoritative for durable incident identity, review decisions, revisions and publication state.

A repository, image or model being present does not prove that a complete real-data path is enabled, accepted or scientifically qualified. Use [ORGANISATION.md](ORGANISATION.md) for canonical commit routing and [STATUS.md](STATUS.md) for dated acceptance boundaries.

## Active component map

The GitHub inventory verified on 19 September 2026 contains **18 FireViewer repositories**: the 16 core, institutional, infrastructure and transitional repositories below, plus two auxiliary Android repositories. The UWD Map Builder is a separate external dependency. Retired repositories are not active components. See the [individual repository descriptions](repositories/README.md).

| Repository | Responsibility | Stewardship / visibility |
| --- | --- | --- |
| `fireviewer/.github` | Organisation profile and shared contribution/security policies | FIRE-VIEWER · public |
| `fireviewer/Fireviewer_doc` | Canonical public architecture, status and governance documentation | FIRE-VIEWER · public |
| `fireviewer/fireviewer-backend` | Incidents, accounts, permissions, durable evidence, audit, review and publication | FIRE-VIEWER · private |
| `fireviewer/fireviewer-frontend` | Contribution, administration, catalogue, chronology and public exploration | FIRE-VIEWER · private |
| `fireviewer/fireviewer-association-site` | Institutional website of the association | FIRE-VIEWER · private |
| `fireviewer/fireviewer-contracts` | Shared evidence, geometry and result contracts | FIRE-VIEWER · private |
| `fireviewer/fireviewer-evidence-ingestion` | Source, media, transcription and satellite acquisition/normalisation | FIRE-VIEWER · private |
| `fireviewer/fireviewer-vision-runtime` | Detection, keyframes, segmentation, OCR and visual observations | FIRE-VIEWER · private |
| `fireviewer/fireviewer-geolocation` | Deterministic geographic hypotheses, retrieval and registration | FIRE-VIEWER · private |
| `fireviewer/fireviewer-evidence-supervisor` | Evidence assessment, contradictions and `accept`, `reject`, `abstain` | FIRE-VIEWER · private |
| `fireviewer/fireviewer-orchestrator` | Dispatch, retries, receipts and idempotency | FIRE-VIEWER · private |
| `fireviewer/fireviewer-fire-state` | Part.4 calculation, profiles, calibration and evaluation | FIRE-VIEWER · private |
| `fireviewer/fireviewer-model-lab` | Corpus preparation, training recipes, benchmarks and model registry | FIRE-VIEWER · private |
| `fireviewer/fireviewer-unreal` | Fire-specific visualisation and scenarios; simulation on hold outside current MVP work | FIRE-VIEWER · private |
| `fireviewer/fireviewer-docker` | Version locks, service composition, reconstruction procedures and private operational receipts | FIRE-VIEWER · private |
| `fireviewer/fireviewer-ai-worker` | Compatibility imports and commands for existing consumers; no new canonical algorithms | FIRE-VIEWER · private, transitional |
| `fireviewer/FIRE-VIEWER-gestion-android` | Android association management; outside the incident pipeline | FIRE-VIEWER · private, auxiliary |
| `fireviewer/pointing-atelier` | Manual Android annotation and HF corpus workflows; automatic preparation paused | FIRE-VIEWER · private, auxiliary |
| `unicornwhodev/map-builder` | Generic measured-map producer, CLI/API/UI and cartographic tooling | UWD · private |

Repository visibility is an access decision, not a maturity level. A publicly accessible website does not make its source repository public.

## Responsibility boundary

The UWD Map Builder produces versioned geographic packages. It does not own FireViewer incidents, evidence, users, model decisions or publication state.

FireViewer attaches requests to existing incidents, controls access and dispatch, pins the builder package or image revision, validates returned artifacts and retains review decisions and publication authority.

Terrain packages can be published automatically after technical acceptance. Sensitive AI/LLM results retain human validation. These distinct publication paths must not be collapsed into either “everything is automatic” or “every terrain package requires an AI review”.

The FireViewer Docker repository references approved UWD releases. It does not copy or reassign the generic builder source.

## Historical repositories — not active components

The following repositories were removed from GitHub on 9 September 2026. One verified compact archive is retained per repository, including Git history and available issue/PR/release metadata. See [current organisation](ORGANISATION.md).

| Retired repository | Replacement or destination | Retention |
| --- | --- | --- |
| `fireviewer/fireviewer-spatial` | UWD producer, FV contracts and readers of accepted packages | Verified offline archive. |
| `fireviewer/fireviewer-sdg` | Useful helpers in model-lab; former Blender/Omniverse chains removed from the active scope | Verified offline archive. |
| `fireviewer/models` | Canonical registry in `fireviewer-model-lab` | Verified offline archive. |

Archives serve provenance, compatibility and recovery. They must not receive new product logic. Their documented restoration checks are not a claim that they were restored again during this documentation review.

The compatibility `fireviewer-ai-worker` repository remains active for bounded forwarding imports and commands while consumers migrate. New business logic belongs in the dedicated component. Retiring a repository or changing a README is not permission to remove still-used imports or published artifact paths.

## Hosted artifacts

The [public Hugging Face catalogue](HUGGINGFACE.md) records five models and four public datasets, their immutable source revisions, protocol boundaries and resource status. Private research resources keep their documentation inside their restricted repositories.


Real measured-map packages, model weights and datasets remain outside Git in designated artifact repositories. Their paths and revisions can be compatibility-sensitive and must not be reorganised without a migration.

Historical names can remain in immutable artifact identifiers when renaming would break provenance. They do not create a second active project. Current availability and runtime promotion require their own evidence, not an assumption based on an old listing.

## Documentation standard

Each maintained component should state its responsibility and non-goals, its inputs/outputs and versioned contracts, what is implemented versus accepted, its security/provenance/licensing boundaries, its validation commands and its compatibility-sensitive identifiers.

Status claims must identify their assessment date and scope. Repository ownership records technical stewardship; signed rights assignments are a separate matter. Preserve historical receipts instead of changing their dates to imply a new acceptance.

Operational runbooks, provider configuration, credentials, private evidence, local paths, raw validation logs and internal recovery tracking do not belong in the public documentation. See the [publication policy](../REPOSITORY_DOCUMENTATION_POLICY.md).

## Governance and ownership

The association FIRE-VIEWER provides administrative and financial stewardship for association-controlled resources. Technical development is currently maintainer-led.

Repository allocation does not replace an asset inventory, licence or signed assignment. Pre-association assets and UWD components remain subject to their explicit arrangements. This documentation update changes no licence or legal attribution.

Shared policies:

- [Contributing](https://github.com/fireviewer/.github/blob/main/CONTRIBUTING.md).
- [Code of Conduct](https://github.com/fireviewer/.github/blob/main/CODE_OF_CONDUCT.md).
- [Security](https://github.com/fireviewer/.github/blob/main/SECURITY.md).
- [Support](https://github.com/fireviewer/.github/blob/main/SUPPORT.md).

## Update rule

When code changes a public contract or component boundary, update this guide and the relevant architecture document in the same release window. A restructure or documentation cleanup must not be presented as proof that an unfinished functional path is complete.
