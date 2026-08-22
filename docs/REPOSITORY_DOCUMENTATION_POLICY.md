# FireViewer — Repository Documentation Policy

## Purpose

This policy keeps FireViewer repositories **clean, coherent and maintainable**.

The project should not copy the full architecture, funding narrative or cross-project roadmap into every repository. Each repository documents its own implementation and links back to the canonical project documentation in `fireviewer/Fireviewer_doc`.

The goal is to avoid documentation drift, stale branches and duplicated claims.

## Three documentation scopes

| Scope | Versioned / public? | Allowed content |
| --- | --- | --- |
| Public project documentation | Yes | Project positioning, architecture, stable contracts, safety boundaries, status, roadmap, contribution entry points and support material. |
| Component source documentation | Yes | Portable installation, source-level APIs/contracts, tests and contributor guidance needed to work with the open repository. |
| Working documentation | No | Exploratory plans, raw logs, local/provider runbooks, machine paths, incident research, unpublished results, draft decisions and operational receipts. |

Working documentation belongs in the local workspace at
`fireviewer-work/documentation/`, or in an ignored repository-local
`docs/local/`, `docs/work/`, `docs/private/` or `.local/` directory. It must
not be linked from GitHub, copied into a public README or committed under a
different name.

## Canonical source of truth

`fireviewer/Fireviewer_doc` owns the cross-project narrative and policy:

- project positioning;
- canonical architecture;
- map-builder role;
- fire-evolution semantics;
- replay and post-event study model;
- provenance/reproducibility doctrine;
- safety boundaries;
- cross-repository contract meaning;
- status and roadmap;
- support/funding/partnership material.

Repository-local documentation must not redefine these subjects independently.

## Versioned component documentation

| Repository | Local documentation should focus on |
| --- | --- |
| `fireviewer-frontend` | setup, routes, UI contracts, auth integration, local tests, deployment details |
| `fireviewer-backend` | API, persistence, migrations, orchestration, auth/security, runbooks |
| `fireviewer-ai-worker` | worker setup, stages, model registry, inference contracts, benchmark tooling |
| `fireviewer-spatial` | map-builder implementation, spatial schemas, packaging, CRS, deployment/runbooks |
| `fireviewer-sdg` | synthetic-data research, runtime setup, provenance, split/leakage rules, campaign-specific gates |
| `Fireviewer_doc` | everything that must remain consistent across repositories |

A repository README should answer:

1. what this component does;
2. where it sits in the canonical architecture;
3. how to install/run/test it;
4. what contracts it produces or consumes;
5. what its current limitations are;
6. where to find the canonical project documentation.

It should not duplicate a 20-page project overview or contain working material
that only makes sense on one machine or in one private environment.

## Public doctrine

All repositories should remain compatible with this concise project description:

> FireViewer is open infrastructure for wildfire observation, spatial reconstruction, temporal tracking and reproducible post-event analysis.

Key boundaries:

- FireViewer is not an emergency alert, command or certified propagation-prediction system;
- the canonical map builder is headless and independent from Unity/Omniverse;
- Omniverse can exist inside optional SDG research without becoming a core dependency;
- observation, reconstruction, simulation and prediction remain separate;
- AI output is a proposal until the applicable human review;
- abstention is a valid result;
- a tested local code path is not automatically a deployed or scientifically qualified capability;
- the viewer is a consumer of canonical spatial/temporal artifacts, not the source of truth.

## Documentation authority order

When two documents disagree, use this order:

1. versioned contracts/ADRs in `Fireviewer_doc`;
2. `STATUS_MATRIX.md`, `TERMINOLOGY.md` and `CONTRACT_MAP.md`;
3. canonical architecture and domain documents in `Fireviewer_doc`;
4. producer-repository schemas/contracts;
5. repository README/runbooks;
6. organisation profile, repository descriptions and promotional text.

A lower-level document may explain implementation details but must not silently promote a capability beyond the canonical status.

## Keep repositories clean

### One working branch for a cross-project documentation refactor

When a documentation change is primarily cross-project, prefer one working branch in `Fireviewer_doc` rather than creating equivalent branches in every repository.

Producer repositories should only receive targeted documentation changes when the canonical wording is stable.

### No branch proliferation

Do not create branches in every repository simply to keep README wording temporarily in sync.

For small, low-risk README alignment changes after canonical review, use the repository's normal clean integration workflow rather than leaving stale documentation branches.

### No generated artifacts in Git

Do not commit:

- datasets;
- model weights/checkpoints;
- generated maps/scenes;
- production ZIPs;
- caches;
- large logs;
- credentials/tokens;
- personal local paths;
- runtime volumes.
- working notes, raw experiment output, local deployment receipts or private
  incident material.

Git contains code, schemas, small fixtures and documentation. Heavy reproducible artifacts live in their designated artifact/data stores.

The ignored local-documentation paths are part of this boundary. Moving a
working note into a public Markdown file to bypass the ignore rule is not
allowed.

## Linking policy

Inside `Fireviewer_doc`, use relative links for canonical documents.

From another repository, use stable links to the canonical FireViewer documentation rather than copying entire documents unless a local contract genuinely must be vendored for runtime independence.

Vendored contract copies must identify their canonical source/version and be updated intentionally.

`Fireviewer_doc/repositories/` must not be used as a mirror of component
developer documentation. Setup notes, implementation details, audits, tests and
runbooks remain beside their code in the owning repository and are linked from
the [developer documentation index](development/README.md). This prevents stale
public snapshots from being mistaken for current operational instructions.

Only portable contributor-facing material may remain beside public source code.
Machine-specific runbooks, raw audits, unreviewed experiment reports and local
paths are working documentation and stay outside Git.

## Status claims

Repository documentation should use the meanings in [STATUS_MATRIX.md](STATUS_MATRIX.md).

At minimum distinguish:

- implemented in code;
- tested locally;
- integrated against a deployed provider/environment;
- scientifically benchmarked/qualified;
- promoted for public use.

Historical test numbers should not be used as current marketing claims without the exact revision and evidence artifact.

## Funding/support material

Funding and sponsorship messaging belongs centrally in:

- [Project Overview](PROJECT_OVERVIEW.md);
- [Funding Brief](FUNDING_BRIEF.md);
- [Support and Partnerships](SUPPORT_AND_PARTNERSHIPS.md).

Component repositories may include one short sentence linking to these pages. They should not each contain different funding asks or different statements about legal/tax status.

## Licences and legal claims

A repository must accurately describe its own code/documentation licence.

Do not infer from public visibility that data or third-party assets are reusable.

Do not claim:

- charitable status;
- tax-deductible donations;
- institutional endorsement;
- grant eligibility;
- partner status;

unless the relevant status has actually been established.

## Synchronisation gate

Before merging a cross-project documentation change:

1. verify canonical links;
2. search for stale Unity/Omniverse-as-core wording;
3. search for outdated map-package versions or capture-gallery requirements;
4. verify terminology against `TERMINOLOGY.md`;
5. verify claims against `STATUS_MATRIX.md`;
6. scan for credentials, personal paths and generated artifacts;
7. compare the branch against `main` and review every changed file;
8. only then apply targeted README alignment to producer repositories if needed.
