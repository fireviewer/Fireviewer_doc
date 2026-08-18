# FireViewer — Provenance and Reproducibility

## Principle

A FireViewer artifact is useful only if its origin and transformation history can be understood later.

The project therefore treats provenance as a first-class technical requirement rather than optional metadata added at publication time.

The central question is:

> **Can a later reviewer determine what this artifact came from, which transformation produced it, which version was used and whether the result can be checked independently?**

If not, the artifact is not suitable as a reproducible FireViewer reference.

## Provenance layers

### Source provenance

For an external or contributed source, preserve the information required to identify the exact input when possible:

- source or provider;
- collection/product;
- acquisition or observation time;
- retrieval time;
- stable identifier or revision;
- original CRS and footprint where relevant;
- licence and attribution constraints;
- content hash when the bytes are retained or legally hashable;
- correction, retraction or mirror relationships.

A URL alone is not provenance because the content behind a URL can change.

### Evidence provenance

Evidence records should preserve:

- stable evidence identifier;
- parent incident/event reference;
- media type and format;
- hash;
- consent or rights constraints when relevant;
- private/public status;
- derived-artifact relationships.

A derived frame, transcript or crop is not independent evidence simply because it is stored as a separate file.

### Geographic provenance

Spatial work should preserve:

- native CRS;
- axis order;
- transformation into the production CRS;
- vertical reference where relevant;
- source resolution;
- processing extent;
- repairs or substitutions applied to invalid raster cells;
- map-build and tile identifiers.

Coordinate transforms must be reproducible and reviewable. A CRS mismatch is a data-integrity problem, not a cosmetic display issue.

### Processing provenance

Every derived artifact should be able to reference:

- producing component;
- code/release revision;
- contract version;
- parameters or profile;
- parent artifacts;
- execution status;
- output hash.

For deterministic tools, the goal is to support exact reproduction when dependencies permit it.

For nondeterministic or hardware-dependent tools, the goal is to preserve enough information to explain the run and compare later reproduction attempts honestly.

### Model provenance

AI-assisted outputs should retain:

- model identifier;
- model revision/checkpoint;
- inference configuration;
- preprocessing contract;
- relevant thresholds;
- execution profile;
- output schema revision;
- abstention/failure status;
- evidence references.

A generic label such as `model=v2` is not sufficient for a scientific replay.

### Human-decision provenance

Human review is also part of the chain.

FireViewer should preserve, according to the relevant privacy and audit policy:

- object/revision reviewed;
- decision type;
- accepted/rejected revision;
- reason or validation basis where the contract requires one;
- publication/retraction relationship;
- timestamp and authorised actor identity or audit reference.

Human decisions are not deterministic transformations. A replay references them; it does not regenerate them.

## Parent/derived graph

Artifacts should form an explicit lineage graph.

```text
source image
   │
   ├── keyframe
   │     ├── detection
   │     └── visual anchor
   │
   └── metadata
          │
          ▼
localisation attempt
          │
          ▼
reviewed event state
```

The same applies spatially:

```text
MNT / MNS / orthophoto receipts
          │
          ▼
      tile package
          │
          ▼
      zone package
          │
          ▼
  temporal layer reference
          │
          ▼
        replay
```

## Independence of sources

Two artifacts are not independent corroboration simply because they have different URLs or file names.

FireViewer should preserve enough source identity to recognise cases such as:

- the same satellite acquisition exposed by two services;
- a social-media repost of the same photograph;
- multiple crops derived from one image;
- a report quoting another report;
- two downstream products generated from one upstream dataset.

This matters when evaluating confidence and when building benchmarks.

## Hashes

Hashes provide integrity, not truth.

A SHA-256 can prove that an artifact has not changed relative to a recorded digest. It cannot prove that the source was accurate, that a label is correct or that the geometry represents reality.

FireViewer uses hashes to support:

- package validation;
- immutability checks;
- replay binding;
- parent/derived references;
- restoration checks;
- detection of silent artifact replacement.

## Revisions instead of silent replacement

When a source, interpretation or public state changes materially, the preferred model is a new revision with lineage to the previous one.

```text
revision 1
   │
   ├── corrected by
   ▼
revision 2
   │
   └── later retracted
```

Silent overwrite destroys the ability to answer what was known or published at an earlier time.

## Reproducibility levels

Not all FireViewer outputs can achieve the same level of reproducibility. Documentation should state the level actually supported.

### Level A — Integrity reproducible

The archived artifact can be reopened and its hash verified.

### Level B — Transformation reproducible

The parent artifacts and producing tool revision are available so the transformation can be executed again.

### Level C — Environment reproducible

The required software/runtime profile and dependencies are sufficiently pinned to recreate the processing environment.

### Level D — Study reproducible

A complete study or benchmark can be rerun from fixed inputs with documented splits, metrics, exclusions and expected comparison rules.

FireViewer should not claim Level D when only Level A has been demonstrated.

## Data retention and legal constraints

Reproducibility does not imply that every byte must be public forever.

Some inputs may be:

- personal data;
- restricted by licence;
- provided under access controls;
- too large or costly to duplicate;
- subject to removal obligations.

In these cases FireViewer can preserve a reference, receipt, hash or derived artifact while keeping the protected source outside the public package, provided the limitation is documented.

The storage policy is detailed in [Storage and Retention](STORAGE_AND_RETENTION.md).

## Funding and external infrastructure

Infrastructure sponsorship can improve reproducibility when it enables:

- immutable artifact storage;
- replicated backups;
- long-running benchmark jobs;
- archived build logs and receipts;
- public release of reference replay packages.

However, an infrastructure provider does not become the authority for the scientific validity of the artifacts it hosts.

Where material support directly enabled a public artifact, attribution can be recorded separately from the technical provenance graph.

## Checklist for a publishable technical artifact

Before a FireViewer artifact is described as reproducible, verify that a reviewer can identify:

- [ ] what the artifact represents;
- [ ] whether it is observed, reconstructed, interpreted, simulated or predicted;
- [ ] the relevant time or interval;
- [ ] parent source/evidence references;
- [ ] applicable rights or licence constraints;
- [ ] spatial reference and transformations where applicable;
- [ ] producing code/model revision;
- [ ] processing profile or parameters;
- [ ] integrity hash;
- [ ] validation/review status;
- [ ] known limitations;
- [ ] how to reopen or consume the artifact independently.

## Related documents

- [Project Overview](PROJECT_OVERVIEW.md)
- [Map Builder](MAP_BUILDER.md)
- [Fire Evolution Timeline](FIRE_EVOLUTION_TIMELINE.md)
- [Replay and Post-Event Studies](REPLAY_AND_POST_EVENT_STUDIES.md)
- [Storage and Retention](STORAGE_AND_RETENTION.md)
