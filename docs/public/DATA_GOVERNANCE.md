# Data governance and privacy

## Principle

FireViewer stores the smallest durable record needed to explain and reproduce a
decision. Public discovery is not a licence to republish content, and analysis
is not an excuse to build a duplicate archive of news pages, videos, or
transcripts.

## Retained records

Subject to the applicable rights and project policy, FireViewer may retain:

- source and evidence tickets containing URLs, publishers, timestamps, hashes,
  extracted claims, provenance, and processing outcomes;
- versioned `EventEvidence`, geographic hypotheses, point dossiers,
  assessments, review decisions, and audit events;
- failure-journal entries needed to identify incomplete, false, partial, or
  unavailable provider responses;
- official satellite products or derived bands when their terms permit it;
- reviewed perimeter tiles and reproducible spatial-package manifests;
- media uploaded by users who explicitly authorise the required storage and
  republication rights;
- compact derived artifacts such as authorised crops or keyframes when they are
  necessary, lawful, and tied to a retention rule.

## Content not retained by the acquisition pipeline

The source-acquisition pipeline is not intended to durably retain:

- scraped HTML pages or complete news articles;
- copied public images or video binaries without a separate right to retain
  them;
- full press-conference or media transcripts;
- arbitrary third-party page assets;
- model conversation history containing raw third-party content.

Such content may be processed in memory for bounded extraction. The durable
ticket keeps source references and derived claims, then the raw content is
discarded.

## User media

An upload must record the contributor's authorisation, capture location or map
placement, declared accuracy, capture time when known, and optional camera
orientation and field of view. The system should preserve the distinction
between:

- permission to analyse privately;
- permission to retain;
- permission to show during review;
- permission to republish publicly.

These permissions are not interchangeable. Malware scanning, size and media
validation, authenticated access, and removal workflows form separate gates.

## Provenance and integrity

Durable evidence records should identify:

- source and canonical URL;
- observation, publication, acquisition, and processing times;
- content, object, or response digest;
- rights and attribution information;
- processing provider and immutable revision where available;
- transformations applied to the source;
- geographic reference system and uncertainty for spatial data;
- links to superseded and successor revisions.

An older record is not silently overwritten. Corrections and new observations
create new revisions with an audit trail.

## Public presentation

Incident pages should display the provenance of factual claims and clearly
label official observations, user contributions, reconstructions, simulations,
and model-derived assessments. A source citation does not imply that the source
endorses FireViewer's interpretation.

## Third-party rights

Every article, model, dataset, map, satellite product, and asset retains its own
licence and terms. FireViewer documentation and code licences do not relicense
upstream material. Where reuse rights are incomplete or uncertain, the system
must keep only the minimal reference record or exclude the artifact.

## Security, privacy, and removal

Do not publish secrets, provider identifiers, private evidence, personal
machine paths, precise sensitive locations, or contributor information that is
not necessary for the documented public purpose.

For a security report, rights concern, provenance correction, or data-removal
request, contact **unicornwhodev@gmail.com**. Do not include sensitive evidence
in a public GitHub issue.
