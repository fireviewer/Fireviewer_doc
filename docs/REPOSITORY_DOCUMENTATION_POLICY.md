# FireViewer public documentation policy

FireViewer's tracked public documentation is written in **English**. It should
be complete enough to explain the product, architecture, evidence and review
model, data policy, safety boundaries, repository roles, licensing, and current
verified maturity.

Completeness does not require publishing operationally sensitive or unstable
working material. Detailed development notes may remain local and may be
written in French. Local-only material includes provider runbooks, cloud
identifiers, credentials, machine paths, private evidence, raw logs, internal
plans, unfinished research notes, and project-management tracking.

Code-adjacent public documentation may describe stable interfaces, contracts,
validation commands, and safety invariants needed to understand or contribute
to a repository. It must not imply deployment, operational qualification, or
scientific validation without independently publishable evidence.

Public status statements must distinguish:

- source code or a contract being present;
- an integration being configured or deployed behind a guard;
- a feature being enabled;
- a real end-to-end path being accepted;
- a scientific or operational claim being independently validated.

Local working material must not be copied into a public repository under a new
name. Public documents must not contain secrets, private evidence, personal
machine paths, provider identifiers, or unsupported performance claims.

Git repositories are source publications. They may retain small synthetic
contract/configuration fixtures and one reviewed source-backed incident
demonstration in the private frontend/backend repositories. The demonstration
is limited to authored JSON/GeoJSON, presentation data and public citations;
source media and reproduction artifacts remain outside Git. A separate
synthetic incident fixture is kept only in the unpublished Unreal working tree.
Repositories must not contain datasets, model weights or checkpoints, source
imagery, imported 3D asset libraries, measured-map packages, reproduction
outputs, renders, caches or build products. See
[`docs/public/REPOSITORY_HYGIENE.md`](public/REPOSITORY_HYGIENE.md) for the
complete boundary and pre-publication gates.

Cleanup must be reference-aware. Generated, duplicated and unreferenced
obsolete files may be removed after consumer checks. Compatibility identifiers,
legacy adapters and published paths are retained until an explicit migration
updates every consumer; a deprecated-looking name is not sufficient evidence
for deletion.

The public documentation contact is **unicornwhodev@gmail.com**.
