# FireViewer public documentation policy

FireViewer's tracked public documentation explains stable project purpose,
architecture, evidence and review rules, data policy, safety boundaries,
repository roles, licensing and verified maturity.

Completeness does not require publishing operationally sensitive or unstable
working material.

## Public material may include

- stable interfaces and contracts;
- architecture and responsibility boundaries;
- documented validation commands;
- dated capability and limitation statements;
- licences, attribution and provenance rules;
- selected public screenshots whose content and metadata have been reviewed.

## Material kept outside public Git

- credentials, tokens, private keys and populated environment files;
- personal machine paths and machine-specific settings;
- private evidence, contributor information and sensitive locations;
- provider identifiers, internal endpoints, signed URLs and operational
  runbooks;
- raw logs, browser or network captures and vulnerability details;
- internal plans, unfinished research notes and project-management tracking;
- datasets, model weights, generated map packages, asset libraries, caches and
  build outputs.

Public status statements must distinguish source code being present from an
integration being configured, enabled, accepted end to end or scientifically
qualified.

Local working material must not be copied into a public repository under a new
name. Compatibility identifiers and published artifact paths remain until a
versioned migration updates every consumer.

Security issues must follow the project security policy. Other private matters
can be sent to:

**contact@fire-viewer.fr**
