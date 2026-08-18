# FireViewer — Storage and Retention

## Purpose

FireViewer produces artifacts that range from tiny JSON receipts to large map packages, datasets and model files. This policy defines what belongs in Git, what must live in artifact/data storage, what can be temporary and what must remain recoverable for replay.

The main rule is simple:

> **Git stores code, contracts, small fixtures and documentation. Heavy data and reproducible outputs live in purpose-built artifact/data storage.**

## Storage classes

| Class | Examples | Retention principle |
| --- | --- | --- |
| **CODE** | source code, schemas, small fixtures, documentation | versioned in Git |
| **SOURCE** | authorised evidence, geographic source material, external-source snapshots | retained according to rights, replay need and privacy rules |
| **MODEL** | base models, FireViewer model releases, checkpoints required for a replay/benchmark | immutable release copies; working checkpoints bounded |
| **WORK** | temporary downloads, caches, intermediate tiles, transient inference files | disposable after validated output and recovery checks |
| **ARTIFACT** | accepted map ZIPs, temporal packages, replay manifests, benchmark reports | immutable while referenced |
| **DATASET** | versioned training/evaluation exports | immutable per release; explicit licence/split metadata |
| **QUARANTINE** | rejected/superseded artifacts awaiting decision | no automatic deletion without a retention decision |
| **RECEIPT** | hashes, source receipts, run summaries, recovery evidence | small, durable and easy to audit |

## Git repositories

FireViewer repositories must not contain production-scale:

- datasets;
- geographic rasters;
- generated map packages;
- OpenUSD/Blender production scenes;
- model weights/checkpoints;
- caches;
- run outputs;
- local virtual environments;
- secrets/tokens;
- provider credentials;
- personal filesystem paths.

Small synthetic fixtures required for tests are allowed when their provenance and licence are clear.

## Canonical spatial artifacts

An accepted measured-map build is a durable artifact.

Typical package contents include:

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

The package and its integrity metadata must remain available while any incident, replay, dataset, benchmark or study references that exact build.

A consumer must not be forced to rebuild terrain from newer upstream data simply because the original package was deleted.

## Temporary geographic inputs

MNT, MNS, orthophoto and other geographic inputs used during map production can be temporary when all of the following are true:

- the source/product identity is preserved in a receipt;
- the accepted output package has been validated;
- the source licence does not require a different retention behaviour;
- future replay does not depend on retaining the raw bytes;
- a required recovery/reproduction path remains documented.

If the source is non-retrievable, mutable or legally permitted but difficult to reacquire, the retention policy may require keeping an authorised archival copy.

## Temporal packages

Observed/reconstructed timeline packages are durable artifacts when referenced by a public revision, replay or study.

Their retention should preserve:

- exact base map-build identity;
- normalised temporal geometry;
- timeline data;
- package manifest;
- integrity hashes;
- semantic class of each state.

Derived browser views can be regenerated if the canonical temporal package remains available and the regeneration method is documented.

## Replay artifacts

A replay is only useful if its referenced artifacts remain resolvable.

A replay archive may therefore require long-term retention of:

- map package;
- temporal package;
- evidence/source references;
- processing/model revision metadata;
- human decision references;
- replay manifest;
- any small receipts required to validate the chain.

Restricted/private evidence does not need to be copied into a public replay. The replay can reference a protected store when access rights require it.

## Model retention

For a model used in a published benchmark or replay, retain enough identity to retrieve the exact revision.

Where FireViewer controls the release, preserve:

- model/revision identifier;
- configuration;
- hash where applicable;
- model-card/licence references;
- inference profile used by the archived run.

Working checkpoints should be bounded. The project should not keep every intermediate checkpoint indefinitely unless a specific experiment requires it.

## Datasets

Each dataset release should be treated as immutable.

A new correction creates a new revision/release rather than silently changing the previous bytes when reproducibility would be affected.

Dataset storage should preserve:

- version/revision;
- source/provenance metadata;
- split definitions;
- licences/attribution;
- content hashes/manifests;
- known exclusions and leakage policy.

## Private evidence and removal

Retention is constrained by privacy, consent and source rights.

A removal request or legal/licence requirement may require deleting or restricting an evidence object and its derivatives.

When this affects a replay or study, FireViewer should record that the referenced evidence became unavailable rather than silently replacing it with different material.

## Recovery before deletion

An upload success message is not enough to prove that a durable artifact can be recovered.

Before deleting the last local/canonical copy of an important artifact, verify as appropriate:

- remote object exists;
- expected size matches;
- expected hash/manifests match;
- immutable revision or version is known;
- authorisation to retrieve it still works;
- a test download or independent reopen succeeds for critical artifacts.

## Backups

Critical project state should have a recovery path that does not depend on one workstation or one cloud provider account.

Priority backup targets include:

- backend database/audit state;
- accepted spatial packages;
- replay manifests;
- important dataset/model release manifests;
- source/provenance receipts;
- configuration required to identify immutable remote artifacts.

Backup and restore tests are more important than merely having a backup configuration file.

## Provider independence

FireViewer may use providers such as object stores, Hugging Face repositories or compute platforms, but canonical identifiers should not make the scientific meaning of an artifact depend on one vendor.

Whenever practical, preserve provider-neutral fields such as:

```text
artifact_id
contract_version
sha256
size_bytes
created_at
producer_revision
source_refs
```

Provider-specific URLs are delivery metadata, not the identity of the scientific artifact.

## Cost and sustainability

Storage is a real project cost. Retention rules should therefore distinguish **scientifically necessary artifacts** from replaceable caches.

External support/credits are especially useful for:

- immutable map/replay packages;
- replicated backups;
- public dataset/model releases;
- benchmark artifacts;
- bandwidth for reproducibility downloads.

The project should publish measured storage/cost information from real runs before using it in grant or sponsorship budgets.

## Deletion priorities

When reducing storage use, prefer deleting in this order after confirming no active consumer:

1. expired caches;
2. temporary downloads;
3. reproducible intermediate files;
4. superseded working checkpoints;
5. rejected/unreferenced artifacts after the applicable quarantine/review period.

Do **not** delete the only validated copy of an artifact referenced by a replay, publication, dataset or benchmark merely because it is large.

## Review gate

Before a storage policy change or cleanup affecting durable FireViewer artifacts:

- identify consumers;
- identify canonical copies;
- verify hashes/manifests;
- confirm recovery path;
- confirm privacy/licence constraints;
- record what was removed and why when the deletion affects reproducibility.

## Related documents

- [Provenance and Reproducibility](PROVENANCE_AND_REPRODUCIBILITY.md)
- [Map Builder](MAP_BUILDER.md)
- [Replay and Post-Event Studies](REPLAY_AND_POST_EVENT_STUDIES.md)
- [Safety and Scope](SAFETY_AND_SCOPE.md)
