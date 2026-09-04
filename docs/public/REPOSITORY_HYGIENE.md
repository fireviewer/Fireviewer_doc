# Repository hygiene and publication boundary

FireViewer Git repositories are source repositories. They may contain code,
portable contracts and configuration schemas, documentation, and small
synthetic fixtures needed to test those contracts. Artifact stores remain the
authoritative place for datasets, weights and produced geographic packages.

## Allowed in Git

- source code, tests and build definitions;
- portable configuration templates with empty or example-only values;
- schemas and small machine-readable contract fixtures;
- documentation, licences and provenance notices;
- tiny source-authored geometry fixtures when a test cannot express the same
  contract as ordinary code;
- one bounded, source-backed Die / Justin demonstration in the private
  frontend/backend repositories, limited to authored JSON/GeoJSON,
  presentation data and public citations needed to exercise the incident
  interface; it contains no source media, private evidence, training material,
  model output or produced scene;
- one clearly labelled synthetic incident configuration example in the local,
  unpublished `fireviewer-unreal` working tree, including JSON and GeoJSON
  inputs but no captured media, generated result or real incident data.

Synthetic examples use invented identifiers, non-personal metadata and generic
coordinates. The retained source-backed demonstration is explicitly labelled
as a historical demonstration and does not establish live operational status.

## Forbidden in Git

- credentials, tokens, private keys, populated environment files or provider
  secrets;
- personal information, private incident evidence, unapproved real-incident
  corpora or non-public infrastructure identifiers;
- datasets, source imagery, annotations, training corpora or cached downloads;
- model weights, checkpoints, optimiser state or training outputs;
- imported or converted 3D asset libraries, licensed binary content or engine
  packages;
- measured-map productions, reproduction packs, render outputs, captures,
  generated catalogues or validation results;
- build products, caches, scratch directories and machine-specific settings.

A public URL does not by itself grant redistribution rights. Third-party inputs
should be referenced by provider, licence and immutable revision rather than
copied into Git when redistribution is unnecessary or unclear.

## Cleanup policy

Repository cleanup is reference-aware. A file may be removed when it is a
generated output, cache, duplicate, abandoned probe or unreferenced obsolete
configuration and its removal does not break a consumer. Search references,
imports, build files, tests and published compatibility paths before deleting
it.

Names containing `legacy` or `firewarning` are not automatically obsolete.
Compatibility adapters, migration baselines and immutable published paths stay
in place until every consumer has an explicit migration. Ambiguous items are
recorded as cleanup candidates rather than deleted speculatively.

Git cleanup is not permission to delete the authoritative local or hosted copy
of an artifact. Artifact retention and deletion require their own inventory,
recovery and rights checks.

## Current cleanup decisions

The 4 September 2026 publication review removed or excluded Unreal editor/user
settings, hard-coded local engine paths, local real-incident helper scripts,
one-off reviewed catalogue admission code, old real-incident request examples,
the ai-worker multi-incident media corpus and five additional packaged backend
retrospectives. The ignored local artifact trees were not deleted. Die / Justin
is the only retained source-backed incident demonstration; its source media and
reproduction artifacts remain outside Git.

Referenced `firewarning-*` identifiers, explicit legacy adapters and
`fireviewer-spatial/reference/map-builder-reference-v1` remain because they
still have compatibility or validation consumers. The frontend's unreferenced
legacy 3D generator, loaders and fallback viewers were removed with the old
generated payload. Retained compatibility paths are not evidence of active
models or production maps; future cleanup must migrate their consumers first.

## Pre-publication gates

Before every publication lot:

1. review the exact staged file list and diff;
2. enumerate ignored-but-tracked files, payload extensions and large blobs;
3. scan staged content for credentials, private identifiers, personal paths and
   unapproved real-incident material;
4. verify that configuration examples contain placeholders only;
5. run the relevant unit, contract and documentation checks;
6. perform a security review of changed source code;
7. compare every pushed branch head with its remote head.

Passing these gates establishes the source-publication boundary only. It does
not qualify a cloud deployment, GPU path, real incident workflow, model or
scientific result.
