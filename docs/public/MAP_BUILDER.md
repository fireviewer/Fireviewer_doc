# FireViewer Map Builder

The FireViewer Map Builder turns one immutable geographic request into a
versioned spatial package. Its core engine is provider-neutral: it receives a
request, a scratch directory, and an output directory. Cloud-specific launch,
object storage, credentials, and publication remain outside the builder.

## Production contract

One request fixes the zone identity, centre, side length, profile, builder
revision, and output identity. The engine writes all temporary work under the
provided scratch root and emits authoritative scientific artifacts, runtime
viewer artifacts, manifests, provenance, metrics, and a terminal completion
receipt.

The completion receipt is written last. Artifacts without that receipt form an
incomplete build and must not be presented as a valid map.

## Tiled viewer

The production viewer is a tiled package, not one monolithic GLB. It contains:

- a lightweight far view for continuous geographic context;
- shared prototype namespaces for reusable 3D assets;
- per-tile terrain payloads;
- per-tile placement payloads;
- a catalogue used by the browser for progressive loading.

The browser may load and evict detailed tiles according to camera visibility
and a bounded resident-tile budget. Scientific artifacts and viewer
derivatives remain distinct; a viewer optimization must not rewrite the
authoritative geographic result.

## Resumable workers

Large requests can be partitioned into disjoint tile shards. Each shard owns a
deterministic tile set and publishes resumable checkpoints. A single dependent
assembler restores the complete checkpoint set and creates the final package.
Source metatiles remain assigned to one shard so that shared downloads are not
duplicated across workers.

The same engine also supports an asset-free profile. That profile preserves an
explicitly empty prototype namespace, including across resumed builds, instead
of inventing placeholder assets or requiring asset-specific context.

## Validation boundary

Validation checks request identity, tile coverage, package structure,
geographic bounds, provenance, and required receipts. Binary identity is not
required for formats that contain variable metadata; semantic equivalence is
the relevant comparison.

A successful synthetic test, container run, or cloud job does not prove every
map size, source condition, browser, or publication route. Runtime resource
measurements, visual review, public loading, and atomic publication are separate
acceptance gates.

## Data and security

Source rasters, generated maps, checkpoints, media, model files, credentials,
provider identifiers, and operator runbooks do not belong in Git. Public source
repositories contain code, portable contracts, small validation fixtures, and
concise English documentation only. Detailed operational notes remain local
and untracked.
