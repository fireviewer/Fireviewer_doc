# FireViewer — Replay and Post-Event Studies

## Purpose

FireViewer is designed so that an incident can remain technically useful **after the fire itself has ended**.

The goal of replay is not to recreate a dramatic animation. It is to preserve enough immutable technical context that a later researcher can reopen the incident, understand what was known at different moments and reproduce the transformations that led to the archived representation.

## What a replay is

A FireViewer replay is a versioned binding between:

- an exact spatial map build;
- temporal fire states;
- source and evidence references;
- derived artifacts;
- processing and model revisions;
- spatial transformations;
- human review decisions;
- publication revisions.

A replay should not depend on whatever the current FireViewer website, terrain service or AI model happens to look like when the study is repeated.

## Why screenshots are not enough

A screenshot captures appearance but loses most of the information required for analysis:

- exact geometry;
- coordinate reference system;
- source lineage;
- uncertainty;
- processing revision;
- model revision;
- unknown intervals;
- human decisions;
- artifact integrity.

FireViewer therefore treats rendered views as derived products rather than archival truth.

## Replay model

```text
immutable map build
        │
        ├──────────────┐
        │              │
        ▼              ▼
 temporal states     evidence registry
        │              │
        └──────┬───────┘
               ▼
      processing revisions
               │
               ▼
       human review history
               │
               ▼
          replay manifest
               │
               ├── public visualisation
               ├── research notebook
               ├── benchmark
               └── dataset / case study
```

## Minimum replay information

A mature replay manifest should be able to reference at least:

### Incident identity

- stable `fire_id`;
- incident or episode revision;
- temporal scope of the replay.

### Spatial reference

- exact map-build identifier;
- package contract version;
- map-package hash;
- source receipts;
- CRS and vertical-reference metadata;
- asset-bundle revision.

### Temporal information

- timeline contract revision;
- every included temporal state;
- semantic class of each state;
- observation or reconstruction time range;
- unknown intervals.

### Evidence

- stable evidence identifiers;
- hashes;
- source revisions;
- relevant licence and attribution metadata;
- parent/derived relationships.

### AI and deterministic processing

- model identifier and revision;
- inference profile;
- deterministic tool revision;
- stage status;
- parameters needed for reproduction;
- abstention or failure reason codes.

### Human decisions

- which output was reviewed;
- which revision was accepted or rejected;
- reason or basis where required by contract;
- publication/retraction lineage.

A replay should reference human decisions; it should not pretend to reproduce them automatically as if they were deterministic model outputs.

## Post-event study model

A post-event study can select a replay and ask a bounded technical question without changing the archived incident.

Examples include:

- compare two localisation methods on the same historical evidence;
- quantify how much a source reduced spatial uncertainty;
- compare the documented state at time `T` with a later retrospective reconstruction;
- evaluate whether a new model would have abstained on historical difficult cases;
- build a benchmark from verified windows without contaminating the original timeline;
- measure disagreement between sources of the same time period;
- study which areas of an incident remain poorly documented.

The output of a study is a **new derived artifact**. It does not rewrite the original replay.

## Hindsight must remain visible

A common retrospective error is to use information learned after an incident and silently treat it as if it had been available earlier.

FireViewer avoids this by separating:

```text
historical knowledge at T
        ≠
final retrospective knowledge
```

A study may compare them, but the distinction must remain explicit.

This is especially important when evaluating AI systems. A model tested after the fact must not receive future evidence that the original system did not have at the target time unless the study explicitly defines that condition.

## Benchmark use

Replay packages are a natural source for reproducible benchmarks because they can preserve:

- fixed evidence inputs;
- fixed spatial references;
- stable ground-truth or reviewed targets where available;
- source-group boundaries;
- model-independent hashes;
- difficult and abstention cases;
- temporal splits.

A benchmark derived from replay should still define its own split policy and leakage rules. FireViewer does not assume that every archived artifact is automatically suitable for training.

## Dataset use

A replay can generate a dataset only through an explicit export step.

That export should document:

- included artifact families;
- excluded restricted material;
- source licences;
- split strategy;
- relationship to the original incident;
- whether labels are observed, reconstructed, reviewed or synthetic;
- any additional transformations.

The exported dataset becomes a separate versioned product rather than a mutable view into the incident archive.

## Reopening independently

One of the important replay gates is the ability to inspect a package outside the original production process.

For the spatial layer this means that the accepted OpenUSD/Blender package and its dependencies can be checked without asking the map builder to regenerate the scene.

For the temporal layer this means that normalised geometry and timeline files can be read without re-fetching or reinterpreting their original sources.

## Security and privacy

Not every source artifact should necessarily be included in a public replay.

A replay may contain references to private evidence while exposing only derived or redacted artifacts publicly. Reproducibility does not require publishing personal data, secret URLs or restricted source material.

The replay contract should distinguish:

- public artifacts;
- restricted artifacts;
- externally licensed artifacts;
- references that require separate access.

## Reference incident milestone

A major FireViewer milestone is to produce at least one **fully replayable reference incident** that demonstrates the complete chain:

```text
source acquisition
→ evidence registry
→ spatial map build
→ temporal observations
→ AI/deterministic processing
→ human review
→ publication snapshot
→ archived replay
→ independent post-event study
```

This reference case is more valuable for project credibility than a large number of unverified demo scenes because it demonstrates that the architecture works as a reproducible system.

## What funding can unlock here

Replay is storage- and engineering-intensive. External support can directly fund:

- durable storage for immutable artifacts;
- repeated re-validation of archived packages;
- independent review of replay methodology;
- compute for benchmark comparisons;
- publication of well-documented reference cases;
- long-term retention and backup testing.

See [Support and Partnerships](SUPPORT_AND_PARTNERSHIPS.md).

## Related documents

- [Project Overview](PROJECT_OVERVIEW.md)
- [Map Builder](MAP_BUILDER.md)
- [Fire Evolution Timeline](FIRE_EVOLUTION_TIMELINE.md)
- [Provenance and Reproducibility](PROVENANCE_AND_REPRODUCIBILITY.md)
- [Acceptance and Replay Matrix](ACCEPTANCE_AND_REPLAY_MATRIX.md)
