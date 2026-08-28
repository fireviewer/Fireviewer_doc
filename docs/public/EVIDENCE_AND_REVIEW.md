# Evidence, geographic candidates, and review

## Evidence model

FireViewer preserves the difference between a source, an extracted claim, a
visual observation, a geographic hypothesis, and a publication decision. The
main public contracts are conceptually:

| Contract | Purpose |
| --- | --- |
| `EventEvidence` | Versioned evidence graph for one event candidate, including media references, source claims, uncertainty, provenance, and derived observations. |
| `GeographicHypothesis` | One candidate geographic point or bounded region produced by deterministic camera, terrain, map, satellite, and history checks. |
| `PointEvidenceBundle` | Compact, immutable dossier containing one candidate point and only the evidence needed to assess it. |
| `PointAssessment` | Structured `accept`, `reject`, or `abstain` result with calibrated confidence, reason codes, evidence references, contradictions, and missing evidence. |

Exact machine-readable schemas live with the producer and are pinned by their
consumers using revision and digest locks.

## Source-backed extraction

A multimodal evidence provider may read a bounded public page and a small set
of associated images in memory. It extracts source-backed claims and evidence
references. It does not decide final coordinates, and raw page content is
discarded after the bounded processing step.

A source ticket should retain enough information to audit the extraction
without copying the original work:

- canonical URL and publisher;
- publication, observation, and retrieval times when available;
- content or response hash;
- claim text or structured value as a derived record;
- parser/provider revision and outcome;
- citations to the originating source;
- uncertainty, contradiction, and failure information.

## Geographic candidates

Candidate coordinates are generated before multimodal arbitration. A detector
can contribute a box, class, and score; it cannot turn image pixels into an
authoritative GPS point.

Every geographic candidate keeps:

- coordinates and an uncertainty radius or region;
- the upload location and its declared accuracy;
- camera metadata used by the calculation;
- deterministic distance, bearing, elevation, visibility, and time checks;
- satellite, map, and historical references;
- input revisions and hashes;
- explicit missing inputs and rejection reasons.

When more than one solution remains plausible, all bounded candidates may be
kept for review. The system must not collapse ambiguity into a false precision.

## Point evidence bundle

A point dossier may include:

- the candidate coordinates and uncertainty;
- the original upload location and declared accuracy;
- capture time, orientation, and field of view when available;
- a reduced image, a relevant crop, keyframes, and detector annotations;
- dated satellite or map references with footprint and resolution;
- deterministic geographic and temporal calculations;
- earlier reviewed event states and perimeters;
- relevant public claims and official observations;
- immutable evidence identifiers, revisions, and hashes.

The bundle is intentionally compact. Selection and retrieval are part of the
evidence pipeline; the final model is not a substitute for data management.

## Assessment and competing corrections

The supervisor judges the supplied candidate. It may not mutate the original
geometry. When a reviewer or model proposes a correction, it is represented as
a **competing JSON object** with its own rationale and evidence references. The
original candidate remains immutable and auditable.

A result records at least:

- verdict: `accept`, `reject`, or `abstain`;
- model confidence and separately calibrated confidence;
- visual, camera/geographic, satellite, historical, and textual subscores when
  available;
- supporting and contradicting evidence references;
- hard contradictions and missing evidence;
- model, provider, prompt, and calibrator revisions;
- whether human review is required;
- any competing point proposal.

## Publication policy

A point is eligible for automatic publication only when all of the following
are true:

1. the verdict is `accept`;
2. calibrated confidence is **strictly greater than 0.85**;
3. the supervisor is a managed multimodal provider, not a simulation;
4. no hard contradiction remains;
5. no required evidence is missing;
6. the backend publication feature is explicitly enabled.

Eligibility is not itself proof that a production publication occurred. The
backend still owns authentication, feature flags, persistence, audit, and the
publication transition.

All other results are held for human review. Reviewers may accept the original,
reject it, abstain, or submit a competing JSON correction. Review never erases
the source candidate or its earlier assessment.

## Daily-state review is a separate decision

Point assessment is not approval of a complete daily perimeter. Part.4 first
freezes a deterministic state, its inputs, profile identity and competing
geometry proposals. The geometry reviewer assesses that frozen result without
mutating its coordinates or promoting a competing proposal into a parent.

An operator correction appends a private revision and marks dependent states
stale; it does not erase history or silently trigger a bulk replay. Any
affected-component release additionally requires a qualified component
profile and the backend publication gates. The current baseline is
uncalibrated. Active geometry is not accepted by the affected-component sink.

See [Daily reconstruction](RECONSTRUCTION.md) for state and evaluation semantics.

## Failure and abstention

Provider timeouts, malformed responses, unsupported media, missing camera
metadata, unavailable terrain, insufficient satellite coverage, contradiction,
and low confidence are recorded as outcomes. They are not silently converted
into successful evidence. `Abstain` is a valid and expected result.
