# Repository hygiene and publication boundary

FireViewer public Git repositories contain source, documentation, licences, portable schemas and small reviewed fixtures needed to understand or test published contracts. Large generated artifacts and operational working material belong outside the public source repositories.

## Allowed in public Git

- source code, tests and build definitions intended for publication;
- portable configuration templates with example-only values;
- schemas and small synthetic contract fixtures;
- documentation, licences and provenance notices;
- selected public screenshots after visual and metadata review;
- bounded public presentation data with explicit source and rights records.

## Not part of the public source boundary

- populated local configuration;
- personal machine settings or filesystem paths;
- non-public evidence or contributor information;
- large datasets, training corpora and generated packages;
- model artifacts and engine caches;
- raw operational logs, browser captures and temporary build output.

A public URL does not itself grant redistribution rights. Third-party resources should be referenced by provider, applicable terms and immutable revision when copying is unnecessary or not authorised.

## Cleanup rule

Cleanup is reference-aware. A generated output, abandoned probe, duplicate or obsolete configuration can be removed only after imports, tests, build files, published paths and consumers have been checked.

Compatibility identifiers remain until a migration updates every consumer. Removing a file from the current branch does not remove it from Git history.

## Pre-publication review

Before every public update:

1. review the exact changed files and diff;
2. verify that examples contain placeholders only;
3. check changed text and configuration for credentials, private identifiers and machine-local paths;
4. inspect screenshots visually and remove unnecessary metadata;
5. run relevant unit, contract and documentation checks;
6. verify the pushed branch head and repository visibility;
7. confirm that no public branch retains superseded working material.

Passing these checks establishes only the source-publication boundary. It does not qualify a cloud deployment, model, incident workflow or scientific result.
