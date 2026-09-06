# Web atlas: visual progress and published coverage

**Verified on 6 September 2026 · [Open the incident site](https://fireviewer.vercel.app/incendies).**

The incident atlas connects eleven French territories to their dossiers. Each
territory has a published terrain package that loaded in the browser during this
review. Eight also have incident geometry; three provide geographic context only.

## Viewer progress

![Earlier interface, current natural relief, altitude, plan view and mobile interface](images/web-maps-2026-09-06/viewer-progress.png)

The first panel is an archived development capture. The remaining panels are
fresh captures of the public site. Selected observation dates are shown in the
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

## A capture of every published territory

![Eleven FireViewer territories with one real natural-view screenshot per map](images/web-maps-2026-09-06/territories-overview.png)

All captures below use natural 3D at **1376 × 860**. Dates identify the selected
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
| Saumos, Gironde | No incident geometry published | Terrain only | [PNG](images/web-maps-2026-09-06/saumos-natural.png) | [Open](https://fireviewer.vercel.app/atlas/saumos) |
| Gros Bessillon · Pontevès, Var | No incident geometry published | Terrain only | [PNG](images/web-maps-2026-09-06/gros-bessillon-natural.png) | [Open](https://fireviewer.vercel.app/atlas/gros-bessillon) |
| Cagnano · Cap Corse, Haute-Corse | No incident geometry published | Terrain only | [PNG](images/web-maps-2026-09-06/cagnano-natural.png) | [Open](https://fireviewer.vercel.app/atlas/cagnano) |

## What the daily sequence establishes

Die / Justin has **59 dated documentary reconstructions, from 24 June to
21 August 2026**, and 35 sourced chronology entries. Its eight original CEMS,
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

Current screenshots were taken directly from `fireviewer.vercel.app` in Chrome
on 6 September 2026. All eleven terrain views reached their ready state without
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
