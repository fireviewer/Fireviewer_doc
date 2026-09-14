# FireViewer resource status

This page defines the status vocabulary used for FireViewer resources. It is **not a live catalog**.

The current public inventory, cards and immutable revisions are maintained on the FireViewer Hugging Face organisation:

**https://huggingface.co/fireviewer**

The internal `fireviewer-model-lab` registry remains the project lifecycle reference. A resource does not become active merely because it exists on a public host.

## Status vocabulary

| Status | Meaning |
| --- | --- |
| **public reference** | Public and useful as a reference; not automatically deployed or scientifically qualified. |
| **public research** | Public material intended for research or evaluation rather than production authority. |
| **measured map** | Real measured geographic production retained under a versioned map contract. |
| **synthetic** | Generated material kept explicitly separate from real-event evidence. |
| **restricted research** | Material whose access or redistribution is limited. |
| **legacy** | Superseded or incomplete material retained for provenance, comparison or recovery. |
| **upstream** | Third-party material referenced under its own terms. |

## Live public inventory

Do not infer the current list of models or datasets from this page. For any public resource claim, use the current Hub inventory and the specific resource card, and record the exact repository and revision used.

Public visibility, runtime promotion and scientific qualification are separate states. A resource card can describe current research, an experiment, a compatibility artifact or a historical item.

## Models

This documentation intentionally avoids a static list of current FireViewer models because that list becomes stale as experiments are added, renamed, superseded or withdrawn.

Any runtime use must pin the exact model identity and preprocessing and must rely on an evaluation appropriate to the intended task. Public availability alone does not establish that status.

## Datasets and hosted artifacts

The same rule applies to datasets and other hosted artifacts. Their current card and immutable revision are authoritative for public state, scope and limitations.

Historical names can remain in citations and manifests when changing them would damage provenance. They do not create a second active architecture.

## Measured maps

`fireviewer/simple-measured-scenes-v1` remains the compatibility-sensitive hosted location for retained real measured-map packages used by FireViewer consumers.

Published directories, filenames and package paths can be consumed directly by the viewer. They must not be moved, renamed or flattened as part of documentation cleanup. A structural change requires a versioned migration and coordinated consumer updates.

A measured map describes geographic context. It does not assert wildfire activity and remains separate from dated incident layers and Fire State calculations.

## Synthetic and historical material

Synthetic data can support training, testing and evaluation but cannot become evidence of a real wildfire event.

Superseded resources may be retained when provenance, comparison or recovery requires them. Retention does not make them active production components.

Historical identifiers such as `firewarning-*` can remain in immutable artifacts, citations or compatibility records. They are historical names only.

## Resource status versus pipeline status

- a public model can remain unqualified for production;
- a public dataset can remain research-only;
- a legacy artifact can remain reproducible without being active;
- a measured map can be valid geography without asserting a fire state;
- a synthetic dataset can be useful without becoming real-world evidence.

## Update procedure

When an artifact changes:

1. verify its current visibility on the authoritative host;
2. record its immutable revision;
3. classify it using this vocabulary;
4. review its applicable terms and limitations;
5. update the resource card without overstating deployment or qualification;
6. preserve compatibility-sensitive measured-map paths;
7. remove obsolete public promotion while retaining provenance when justified.
