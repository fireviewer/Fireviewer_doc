# Repository hygiene and publication boundary

FireViewer Git repositories are source repositories. They may contain code,
portable contracts and configuration schemas, documentation, licences and small
reviewed fixtures needed to test those contracts. Datasets, weights, generated
maps and other substantial artifacts belong in designated artifact storage.

## Allowed in public Git

- source code, tests and build definitions intended for publication;
- portable configuration templates with empty or example-only values;
- schemas and small synthetic contract fixtures;
- documentation, licences and provenance notices;
- selected public screenshots after visual and metadata review;
- bounded public presentation data with explicit source and rights records.

## Forbidden in public Git

- credentials, tokens, private keys or populated environment files;
- personal information, private evidence or non-public infrastructure
  identifiers;
- personal filesystem paths, machine settings or editor state;
- datasets, source media archives, annotations or training corpora;
- model weights, checkpoints, optimiser state or training outputs;
- imported 3D libraries, licensed binary packs or engine caches;
- produced measured-map packages, reproduction outputs or raw capture archives;
- build products, caches, scratch directories, database files and raw logs;
- signed URLs, browser HAR files or network captures.

A public URL does not itself grant redistribution rights. Third-party resources
should be referenced by provider, licence and immutable revision when copying is
unnecessary or not authorised.

## Cleanup rule

Cleanup is reference-aware. A generated output, abandoned probe, duplicate or
obsolete configuration can be removed only after imports, tests, build files,
published paths and consumers have been checked.

Compatibility identifiers remain until a migration updates every consumer.
Removing a file from the current branch does not remove it from Git history.
A confirmed credential, private-data or personal-path leak requires revocation
where applicable and a coordinated history rewrite or repository recreation.

## Pre-publication gates

Before every public update:

1. review the exact staged files and diff;
2. list ignored-but-tracked files and large blobs;
3. scan all changed text and configuration for secrets, personal paths and
   private identifiers;
4. verify that examples contain placeholders only;
5. inspect screenshots visually and remove unnecessary metadata;
6. run relevant unit, contract and documentation checks;
7. verify the pushed branch head and repository visibility;
8. confirm that no public branch retains superseded working material.

Passing these gates establishes only the source-publication boundary. It does
not qualify a cloud deployment, GPU path, model, incident workflow or
scientific result.
