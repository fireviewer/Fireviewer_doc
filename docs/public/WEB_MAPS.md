# Web atlas: visual progress and published coverage



**Verified on 8 September 2026 · [Open the incident site](https://fireviewer.vercel.app/incendies).**



Latest natural rendering: **cumulative total footprints across all eleven cases**,
with source provenance, unchanged Altitude rendering and production desktop/mobile
checks. See the [release evidence and captures](#cumulative-natural-footprints-for-all-eleven-cases--8-september-2026).

The incident atlas connects eleven French territories to their dossiers. Each

territory has a published terrain package, verified in the 6 September browser

review below. All eleven now include incident geometry and a checked chronology archive.



## Continuous 2D coverage: 8 September update



![Before and after: Gros Bessillon no longer exceeds its 2D basemap](images/web-maps-2026-09-08/plan-progress.png)



The previous plan view reused the bounded 3D ground artwork, leaving the outer

perimeter on an empty background. The 2D view now requests a continuous

[IGN Plan image](https://data.geopf.fr/wms-r?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities)

for the visible extent, reprojected to Lambert-93. Pan, zoom and the full-extent

control retain geographic context beyond the 3D package. The dated incident

geometry is unchanged. The Natural 3D background is sky blue; Altitude is unchanged.



All eleven public 2D maps passed desktop, mobile, pan, zoom and full-extent

checks in Chrome. IGN imagery is an online dependency; a failed request exposes

a compact retry control, also tested locally. A continuous basemap does not

establish continuous observations of the fire.



![One production 2D screenshot for each of the eleven incidents](images/web-maps-2026-09-08/plans-overview.png)



Full-size 2D captures:



- [die-justin](images/web-maps-2026-09-08/die-justin-desktop.png)

- [bousses](images/web-maps-2026-09-08/bousses-desktop.png)

- [benonces](images/web-maps-2026-09-08/benonces-desktop.png)

- [trevillach](images/web-maps-2026-09-08/trevillach-desktop.png)

- [fontainebleau](images/web-maps-2026-09-08/fontainebleau-desktop.png)

- [biscarrosse](images/web-maps-2026-09-08/biscarrosse-desktop.png)

- [claps](images/web-maps-2026-09-08/claps-desktop.png)

- [luglon](images/web-maps-2026-09-08/luglon-desktop.png)

- [saumos](images/web-maps-2026-09-08/saumos-desktop.png)

- [gros-bessillon](images/web-maps-2026-09-08/gros-bessillon-desktop.png)

- [cagnano](images/web-maps-2026-09-08/cagnano-desktop.png)



Mobile: [Gros Bessillon](images/web-maps-2026-09-08/gros-bessillon-mobile.png)

and [Saumos](images/web-maps-2026-09-08/saumos-mobile.png).



## Dossier enrichment



The owner-authorised, append-only publication adds **22 facts, 46 chronology

events and 37 official links** across the eleven dossiers. Their combined public

contents now include **104 facts and 154 sourced chronology events**. Sources

include prefectures, ONF, departmental authorities and published air-quality

bulletins. Existing incident dates, statuses, reference coordinates and human

review records are preserved. This publication is not an independent human review.



Saumos, Gros Bessillon and Cagnano now have EFFIS period assessments. These are

period summaries, not measured daily perimeters. Saumos CEMS export work is

not included in this verified release; no unvalidated large geometry is served.



## Viewer progress: 6 September archive



![Earlier interface, current natural relief, altitude, plan view and mobile interface](images/web-maps-2026-09-06/viewer-progress.png)



The first panel is an archived development capture. The remaining panels are

captures of the public site from 6 September. Selected observation dates are shown in the

image: this is an interface comparison, not a reconstruction of fire spread.



- A compact header and daily time control give the terrain more space. The

  former reading panel and redundant calendar controls have been removed.

- Natural relief uses a light background and a distinct treatment of mapped

  affected ground. Altitude retains its own visual code.

- Plan and relief share dated incident references. Their extent can differ: a

  3D terrain unit is not a claim to cover the entire incident.

- Camera markers open ground photographs with their original date, credit and

  source. Approximate positions identify the photographed sector; photographs

  without a supported location remain in the dossier gallery.

- The chronology can fall back to its checked, published archive when the

  incident API is unavailable.



## Natural 3D gallery: 6 September archive



![Eleven FireViewer territories with one real natural-view screenshot per map](images/web-maps-2026-09-06/territories-overview.png)



The archived captures below use natural 3D at **1376 × 860**. Dates identify the selected

source product, not the screenshot date or a current emergency state. EFFIS

period assessments are not independent daily observations.



| Territory | Incident layers | Selected product | Capture | Live atlas |

| --- | --- | --- | --- | --- |

| Die · massif de Justin, Drôme | 67 references: 59 daily reconstructions + 8 source products | CEMS · 7 July | [PNG](images/web-maps-2026-09-06/die-justin-natural.png) | [Open](https://fireviewer.vercel.app/atlas/die-justin?jour=2026-07-07&vue=3d&lecture=situation&carte=emsr890-2632-v2) |

| Boussès, Lot-et-Garonne | 1 reference | EFFIS period assessment · 23 June | [PNG](images/web-maps-2026-09-06/bousses-natural.png) | [Open](https://fireviewer.vercel.app/atlas/bousses) |

| Bénonces · Serrières-de-Briord, Ain | 1 reference | EFFIS period assessment · 23 June | [PNG](images/web-maps-2026-09-06/benonces-natural.png) | [Open](https://fireviewer.vercel.app/atlas/benonces) |

| Trévillach, Pyrénées-Orientales | 3 references | CEMS · 8 July | [PNG](images/web-maps-2026-09-06/trevillach-natural.png) | [Open](https://fireviewer.vercel.app/atlas/trevillach) |

| Massif de Fontainebleau, Seine-et-Marne | 6 references | CEMS · 19 July | [PNG](images/web-maps-2026-09-06/fontainebleau-natural.png) | [Open](https://fireviewer.vercel.app/atlas/fontainebleau) |

| Biscarrosse, Landes | 4 references | EFFIS period assessment · 29 July | [PNG](images/web-maps-2026-09-06/biscarrosse-natural.png) | [Open](https://fireviewer.vercel.app/atlas/biscarrosse) |

| Massif du Claps · Bellegarde-en-Diois, Drôme | 1 reference | EFFIS period assessment · 9 August | [PNG](images/web-maps-2026-09-06/claps-natural.png) | [Open](https://fireviewer.vercel.app/atlas/claps) |

| Luglon, Landes | 1 reference | EFFIS period assessment · 17 August | [PNG](images/web-maps-2026-09-06/luglon-natural.png) | [Open](https://fireviewer.vercel.app/atlas/luglon) |

| Saumos, Gironde | 1 EFFIS reference now published | Archived terrain-only capture | [PNG](images/web-maps-2026-09-06/saumos-natural.png) | [Open](https://fireviewer.vercel.app/atlas/saumos) |

| Gros Bessillon · Pontevès, Var | 1 EFFIS reference now published | Archived terrain-only capture | [PNG](images/web-maps-2026-09-06/gros-bessillon-natural.png) | [Open](https://fireviewer.vercel.app/atlas/gros-bessillon) |

| Cagnano · Cap Corse, Haute-Corse | 1 EFFIS reference now published | Archived terrain-only capture | [PNG](images/web-maps-2026-09-06/cagnano-natural.png) | [Open](https://fireviewer.vercel.app/atlas/cagnano) |



## What the daily sequence establishes



Die / Justin has **59 dated documentary reconstructions, from 24 June to

21 August 2026**, and 37 sourced chronology entries. Its eight original CEMS,

EFFIS and Humida source products remain separate. The cross-source work includes

NASA FIRMS detections and Sentinel-2 acquisitions, with source dates and

retrospective constraints retained.



A complete calendar does **not** establish a complete measured outer perimeter

every day. The initial trace covers only part of the reported initial fire;

later gaps and period assessments retain their limitations. Active observations

are not carried forward as current activity. Reconstructed records remain

documentary, retrospectively constrained and without independent human validation.



This owner-authorised publication is separate from the uncalibrated

[Part.4 pipeline](RECONSTRUCTION.md). It does not qualify unattended publication

or establish daily completeness for the other ten incidents.



## Capture provenance and rights



The 6 September screenshots were taken directly from `fireviewer.vercel.app` in Chrome.

The new 2D screenshots were captured from the same production site on 8 September

at 1376 × 860 (desktop) and 390 × 844 (mobile). The before image is the user-supplied

Gros Bessillon capture. All boards arrange real screenshots without altering map content. All eleven terrain views reached their ready state without

JavaScript exceptions. Die also passed the altitude/plan switches and a

390 × 844 mobile capture without horizontal overflow. This establishes the

captured browser state, not all devices or scientific accuracy.



The earlier panel comes from the retained `first-desktop` development capture.

Screenshots are fitted into the boards without redrawing map content. Additional

originals: [earlier interface](images/web-maps-2026-09-06/die-justin-earlier.png),

[altitude](images/web-maps-2026-09-06/die-justin-altitude.png),

[plan](images/web-maps-2026-09-06/die-justin-plan.png),

[mobile](images/web-maps-2026-09-06/die-justin-mobile.png).



Map attribution remains visible. IGN data retain their Licence Ouverte 2.0

terms; Copernicus and other incident sources retain their stated attribution and

licence. Screenshot publication does not relicense third-party content. Ground

photographs remain referenced at their publishers and are not redistributed here.



## Mobile 3D loading and recovery — 8 September 2026

Frontend `b3a0765` reduces the mobile canopy display to 20 triangles per crown,
retaining source tree positions, instance matrices and incident geometry. In the
same Gros Bessillon zoom sequence, rendered triangles fell from 24.85 million to
2.75 million. Desktop retains the detailed canopy. Mobile antialiasing is disabled.

Opening 2D no longer downloads the 3D units. Switching back to 2D disposes the
3D scene. Context loss exposes Retry and Open in 2D; restoration rebuilds the
scene. A failed IGN image request clears its warning after a subsequent success.

Public incident reads allow 30 seconds and retry transient transport errors and
HTTP 408/429/502/503/504 up to twice. Authentication and missing-resource errors
are not retried. An unsuccessful refresh retains already loaded details for the
same incident only. Mutation requests are unchanged.

Validation: 38 focused unit tests, TypeScript and production build passed.
Local Chrome tests exercised a 9-second manifest response, one injected 503,
and an actual WebGL context loss followed by Retry. All recovered. Desktop
Gros Bessillon also passed 2D/3D switches without JavaScript errors.

Production deployment `dpl_EmvUdxjwqB95YUwFbm6u6sRWZaiw` is READY at
fireviewer.vercel.app. Die, Gros Bessillon and Saumos passed touch pinch,
repeated zoom, altitude/natural switches and release of the 3D scene on returning
to 2D. Camera and terrain audits passed without JavaScript exceptions.
The delayed manifest, injected 503 and WebGL loss/retry tests also passed
against the published frontend.

These are Chrome touch/DPR emulation tests, not physical iPhone/Safari GPU tests.
They establish the tested recovery paths, not compatibility with every handset.

| Die / Justin | Gros Bessillon | Saumos |
| --- | --- | --- |
| ![Die mobile zoom](images/web-maps-2026-09-08/die-justin-mobile-zoom.png) | ![Bessillon mobile zoom](images/web-maps-2026-09-08/gros-bessillon-mobile-zoom.png) | ![Saumos mobile zoom](images/web-maps-2026-09-08/saumos-mobile-zoom.png) |


## Natural burned-ground and flame rendering — 8 September 2026

Frontend `00e82b4` replaces the beige affected-area wash with matte charcoal and
ash grain in both 2D and 3D. The existing natural-mode canopy cutaway exposes
burned ground inside the original affected polygons, preserving holes and relief.
Altitude retains its established palette and satellite point annotations.

Flame animation is a symbolic indication of sourced activity: original flame
points, samples along documented fronts and anchors inside active polygons.
Thermal detections alone do not create flames. No polygon is buffered or moved.
The last available extent remains visible on days without a new map, with the
original source date; activity is not automatically carried into a later day.

The animation uses a separate transparent canvas, not continuous 3D rendering.
It is capped at 24 fps and 36 anchors on mobile (96 on desktop), pauses in hidden
tabs and stays still with reduced motion. Ground elevation and intervening
terrain are checked for 3D placement. Photo buttons remain independent.

Local validation on Die / Justin, 8 July: desktop 1376 x 860 and iPhone 13 Chrome
touch/DPR emulation passed visible animation, zoom, Altitude/Natural, 2D/3D,
reduced motion and the 11 July no-activity state. Nine focused unit tests and
the TypeScript/production build passed. Physical mobile hardware remains untested.


Production `dpl_CvhkMEiPPxTJg9qjg5ArKn9zPn3P` reached READY for the incident
site only. The same desktop/mobile checks passed against fireviewer.vercel.app,
including completed IGN background loading in 2D and no JavaScript exceptions.

| Natural 3D | Natural 2D | Mobile 3D |
| --- | --- | --- |
| ![Charcoal ground and flame symbols](images/web-maps-2026-09-08/natural-fire-desktop.png) | ![Plan with sourced activity](images/web-maps-2026-09-08/natural-fire-plan.png) | ![Mobile natural view](images/web-maps-2026-09-08/natural-fire-mobile.png) |

Flames move in the live map; these captures show individual animation frames.


## Daily perimeter selection and photo visibility — 8 September 2026

Old public bookmarks pointing at an isolated CEMS product now resolve to the
consolidated daily reconstruction for the selected day, when available. The
original product remains explicitly selectable with `produit=source` and from
the dated-products selector. Days without new geometry retain the last daily
reconstruction or observed extent; retained activity is removed.

Natural mode materialises the entire cumulative perimeter as charcoal ground
without canopy, including interior islands as a display convention. Detailed
affected fragments remain separate in Altitude. Perimeter strokes are drawn
above the terrain in 3D, in a separate non-animated canvas. These are existing exterior rings, simplified by 12 metres
for display, not a newly computed hull. Separate geographic components remain
separate. No connecting burned strip or new source perimeter has been invented.
The 2D source rings use a stronger stroke. Altitude styling is unchanged.

Located photo markers now show a thumbnail and an explicit photo count. The
same-sector group opens both dated ground photos with next/previous navigation.
Read-only checks of the active production database found no agent media or
incident spatial markers; the public Die response has an empty gallery and no
evidence projections. The static atlas collection still contains four photos,
only two of which have a documented approximate photographed sector. No extra
photo coordinates were invented, and no private media were published. Locating
additional processed photos still requires identifying their actual storage.

Thirteen focused tests and the production build passed. Local Chrome desktop
and iPhone 13 touch/DPR emulation passed the total 21 July footprint (one outer
ring), its separate no-activity state, consolidated-bookmark selection,
visible boundaries, photo opening and navigation, zoom, Natural/Altitude,
2D/3D, reduced motion and the no-activity state. Physical phones are untested.


The total-footprint correction is frontend `82be2ee`, deployment
`dpl_47uoS5PEGuQLw7jew9GwxLkv7fEi` (production, incident site only). The 21 July
view uses the existing 17 July total perimeter: one outer polygon, rather than
932 interior affected fragments. The ground/canopy rendering now follows that
total polygon. Source geometry, footprint dates and area calculations are unchanged.


The total-perimeter and photo interaction checks also passed against production
in desktop Chrome and mobile touch/DPR emulation, with the complete IGN 2D
background loaded and no JavaScript exceptions.

| Total perimeter, 21 July — 3D | Total perimeter — 2D | Mobile 3D |
| --- | --- | --- |
| ![Total perimeter in natural relief](images/web-maps-2026-09-08/total-perimeter-desktop.png) | ![Total perimeter in plan](images/web-maps-2026-09-08/total-perimeter-plan.png) | ![Total perimeter on mobile](images/web-maps-2026-09-08/total-perimeter-mobile.png) |


## Cumulative natural footprints for all eleven cases — 8 September 2026

Frontend `dbedee9` and generator `e1793d3` extend the natural total-footprint
rendering to every published case. Production deployment
`dpl_84kgmk1pmeKqJ5CghKqqLtpcXMs7` is READY on fireviewer.vercel.app.
The association site is outside this release.

A later CEMS damage product previously replaced the visible footprint with
many separate damage fragments. Twenty independent `naturalFootprints` assets
now combine the exterior rings of the available historical burned polygons up
to each product date. Interior islands are filled for this display convention;
there is no convex hull, spatial buffer, expansion from activity points or use
of future observations. Separate geographic sectors remain separate. Tiny
components keep their fill; their boundary stroke appears when large enough
at the current zoom. The detailed Altitude rendering is unchanged.

Die keeps its existing published daily reconstruction and total-perimeter
products. Original source files, hashes, product references and reported areas
remain unchanged in every case. `produit=source` explicitly restores the
isolated source product. The natural footprint has its own integrity-checked
download with product IDs, source dates and provenance in the Sources panel.

For Trevillach, EFFIS records 558914, 558913, 558911 and 558923 complete the
previously attached Montalba sector with Rodes, Vinca and Ille-sur-Tet sectors.
The association uses the prefecture's 6 July bulletin and overlap with the
existing CEMS damage coverage. This scope document and the EFFIS archive are
hash-pinned in the footprint provenance. The supplemental records are not
shown before 6 July or before their provider period has ended. They do not
change the original EFFIS single-sector assessment or claim a new measured
area. See the [prefecture bulletin](https://www.pyrenees-orientales.gouv.fr/index.php/Actualites/Communique-de-presse/Annee-2026/Juillet-2026/Incendie-de-Trevillach-Point-de-situation-n-8-le-06.07.26.-a-13h00).

The documentary exporter and compactor now both finalize the natural footprints
as a mandatory production step, including resumed exports. Supplemental public
geometry and its source hashes are versioned in the backend catalogue
`tools/data/natural-footprint-supplements.json`; Trevillach no longer depends on
manually supplied local receipt paths. To rebuild only the derived layers, run
`python tools/build_natural_footprints.py <frontend/public/cartography>`.
Deploy the indexes and all referenced assets together.

The profile `natural-total-burned-ground-v1` supplies the existing renderer with
cumulative exterior geometry: burned ground, canopy cutaway and exterior boundary.
Flames remain a separate observed-activity layer and are not carried forward.
Altitude rendering is unchanged. Native daily reconstruction/base geometry graphs
are preserved byte for byte. The producer does not create a new observation on a
day without one and does not join geographically separate sectors.

`npm run build` now runs the mandatory `validate:perimeters` publication gate.
It rejects missing total footprints, stale source hashes, altered files and future
supplemental observations. The backend also writes
`natural-footprint-build-receipt.json` with the output profile and index hashes.
The producer must run in an intermediate export; a failed export is not publishable.
Do not replace enriched daily chronologies with a raw documentary export.

Pipeline verification on 8 September: 11 cases, 87 maps, 60 native footprints and
27 supplementary layers. All 20 previously published derived assets regenerate
byte for byte; the 7 additional layers cover Die source products. All existing
source snapshots remain unchanged. A full isolated recompaction/finalization
passed the frontend publication gate. Seventeen focused Python tests, three
publication-gate tests, eleven frontend contract tests and one integration test
through the actual atlas parser/frame adapter passed, as did the production build.
These are pipeline/data checks; the browser captures below remain the visual
reference from the preceding release, whose renderer is unchanged.

Seventeen focused frontend tests, two focused generator tests and the
TypeScript/production build passed. The generator tests cover cumulative
union, retained source holes, separate sectors and exclusion of future data.
All twenty published footprint hashes and the eleven live indexes were checked.
All 22 production browser runs passed (11 cases, desktop and mobile): complete
IGN 2D loading, total-footprint canopy cutaway, zoom, Natural/Altitude and
2D/3D switches, terrain/camera audits, and zero JavaScript exceptions. Die photo
opening and next-photo navigation also passed on both formats.

The mobile checks use Chrome with touch/DPR emulation, not a physical phone.
The captures show selected dossier dates; a later calendar day can retain an
older perimeter, whose source date is displayed on the map.

![All eleven cumulative natural maps](images/web-maps-2026-09-08/all-cases/natural-overview.jpg)

![Fontainebleau before and after the cumulative footprint correction](images/web-maps-2026-09-08/all-cases/natural-progress.jpg)

| Case | Natural 3D | Complete 2D | Mobile 3D |
| --- | --- | --- | --- |
| Die / Justin | ![Die / Justin 3D](images/web-maps-2026-09-08/all-cases/die-justin-desktop-3d.jpg) | ![Die / Justin 2D](images/web-maps-2026-09-08/all-cases/die-justin-desktop-2d.jpg) | ![Die / Justin mobile](images/web-maps-2026-09-08/all-cases/die-justin-mobile-3d.jpg) |
| Fontainebleau | ![Fontainebleau 3D](images/web-maps-2026-09-08/all-cases/fontainebleau-desktop-3d.jpg) | ![Fontainebleau 2D](images/web-maps-2026-09-08/all-cases/fontainebleau-desktop-2d.jpg) | ![Fontainebleau mobile](images/web-maps-2026-09-08/all-cases/fontainebleau-mobile-3d.jpg) |
| Trevillach | ![Trevillach 3D](images/web-maps-2026-09-08/all-cases/trevillach-desktop-3d.jpg) | ![Trevillach 2D](images/web-maps-2026-09-08/all-cases/trevillach-desktop-2d.jpg) | ![Trevillach mobile](images/web-maps-2026-09-08/all-cases/trevillach-mobile-3d.jpg) |
| Gros Bessillon | ![Gros Bessillon 3D](images/web-maps-2026-09-08/all-cases/gros-bessillon-desktop-3d.jpg) | ![Gros Bessillon 2D](images/web-maps-2026-09-08/all-cases/gros-bessillon-desktop-2d.jpg) | ![Gros Bessillon mobile](images/web-maps-2026-09-08/all-cases/gros-bessillon-mobile-3d.jpg) |
| Biscarrosse | ![Biscarrosse 3D](images/web-maps-2026-09-08/all-cases/biscarrosse-desktop-3d.jpg) | ![Biscarrosse 2D](images/web-maps-2026-09-08/all-cases/biscarrosse-desktop-2d.jpg) | ![Biscarrosse mobile](images/web-maps-2026-09-08/all-cases/biscarrosse-mobile-3d.jpg) |
| Bousses | ![Bousses 3D](images/web-maps-2026-09-08/all-cases/bousses-desktop-3d.jpg) | ![Bousses 2D](images/web-maps-2026-09-08/all-cases/bousses-desktop-2d.jpg) | ![Bousses mobile](images/web-maps-2026-09-08/all-cases/bousses-mobile-3d.jpg) |
| Benonces | ![Benonces 3D](images/web-maps-2026-09-08/all-cases/benonces-desktop-3d.jpg) | ![Benonces 2D](images/web-maps-2026-09-08/all-cases/benonces-desktop-2d.jpg) | ![Benonces mobile](images/web-maps-2026-09-08/all-cases/benonces-mobile-3d.jpg) |
| Claps | ![Claps 3D](images/web-maps-2026-09-08/all-cases/claps-desktop-3d.jpg) | ![Claps 2D](images/web-maps-2026-09-08/all-cases/claps-desktop-2d.jpg) | ![Claps mobile](images/web-maps-2026-09-08/all-cases/claps-mobile-3d.jpg) |
| Luglon | ![Luglon 3D](images/web-maps-2026-09-08/all-cases/luglon-desktop-3d.jpg) | ![Luglon 2D](images/web-maps-2026-09-08/all-cases/luglon-desktop-2d.jpg) | ![Luglon mobile](images/web-maps-2026-09-08/all-cases/luglon-mobile-3d.jpg) |
| Saumos | ![Saumos 3D](images/web-maps-2026-09-08/all-cases/saumos-desktop-3d.jpg) | ![Saumos 2D](images/web-maps-2026-09-08/all-cases/saumos-desktop-2d.jpg) | ![Saumos mobile](images/web-maps-2026-09-08/all-cases/saumos-mobile-3d.jpg) |
| Cagnano | ![Cagnano 3D](images/web-maps-2026-09-08/all-cases/cagnano-desktop-3d.jpg) | ![Cagnano 2D](images/web-maps-2026-09-08/all-cases/cagnano-desktop-2d.jpg) | ![Cagnano mobile](images/web-maps-2026-09-08/all-cases/cagnano-mobile-3d.jpg) |
