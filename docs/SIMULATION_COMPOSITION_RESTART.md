# Reprise terrain-first des productions Omniverse

**État :** `GROUND_LIBRARY_IN_PROGRESS_PRODUCTION_BLOCKED`

## Décision

Les scènes Unity, les simulations précédentes et la production Die actuelle
sont dépréciées. Elles ne fournissent plus ni terrain, ni texture de sol, ni
asset, ni placement à la nouvelle production. Seules les règles encore valides
de nombres et de structure de composition de Die pourront être réinterprétées
après la reconstruction des couches géographiques.

Le dataset issu de la première simulation et son pack autonome complet de
reproduction restent conservés pour audit et replay. Ils ne sont ni publiés
comme nouveaux packs, ni utilisés comme sources des six terrains.

## Contrat terrain et sol 2D

La première livraison couvre les six incendies déjà référencés sur le site :

| Incident | Côté du carré | Tuiles de 500 m |
| --- | ---: | ---: |
| FR-30-00001 — Lédenon–Bezouce–Cabrières | 14,5 km | 841 |
| FR-34-00001 — Oupia–Pouzols-Minervois | 16 km | 1 024 |
| FR-83-00001 — Taradeau–Les Arcs | 22,5 km | 2 025 |
| FR-26-00001 — Die, massif de Justin | 20 km | 1 600 |
| FR-66-00001 — Trévillach | 27,5 km | 3 025 |
| FR-77-00001 — Forêt de Fontainebleau | 23 km | 2 116 |

Chaque emprise est un carré EPSG:2154 aligné sur la grille de 500 m. Elle
contient l’enveloppe de toutes les géométries publiques de l’incident, une
marge de sécurité de 5 km sur chaque côté, puis l’extension nécessaire pour
obtenir un carré. Le terrain ne dépend donc pas d’un périmètre d’incendie
supposé exact et couvre une zone où l’incendie ne peut raisonnablement pas
s’étendre au-delà des limites retenues.

Pour chaque tuile :

- le MNT IGN natif à 0,5 m produit le relief 3D ;
- le MNS IGN colocalisé à 0,5 m doit avoir la même grille et une couverture
  finie complète ;
- une palette surfacique RGBA de 256 × 256 pixels encode jusqu’à quatre sols
  naturels ou brûlés par tuile ;
- des masques structurés séparés composent les champs orientés, routes,
  chemins, berges et plateformes ferroviaires à partir de parcelles, réseaux
  de transport et hydrographie approuvés ;
- le MNT fournit pente et rugosité ; le couple MNT/MNS réserve les futurs
  objets sans inventer leur classe ni leur position ;
- les 21 sources ImageGen rapprochées servent uniquement de micro-détail hors
  ligne et ne sont jamais importées directement dans les scènes ;
- quatre textures atlas PBR runtime empaquettent ces sources ;
- 72 profils procéduraux couvrent 22 sols naturels/brûlés, 8 champs, 12 routes,
  6 chemins, 10 cours d’eau, 6 plateformes ferroviaires et 8 parois rocheuses ;
- la variation visuelle s’étage à 1,5–6 m, 16–64 m et 128–512 m sans demander
  de nouvelles images par tuile ;
- les réseaux linéaires changent de profil tous les 250 m, conservent leur UV
  entre tuiles et ne répètent pas les deux variantes précédentes ;
- les rails métalliques sont exclus des textures et seront authorés comme
  géométrie 3D après acceptation des terrains ;
- aucune orthophoto, image aérienne ou texture cartographique lourde n’est
  téléchargée, embarquée ou requise ;
- les géométries de bâtiments, routes, rails, petits assets spécifiques,
  végétation et simulation sont explicitement différées ;
- chaque résultat est lié aux SHA-256 des sources et de ses sorties par un reçu
  reproductible.

## Séquence de production

### P0 — Plans des six terrains

**État :** `IMPLEMENTED_TESTED_LOCAL`

Les six AOI carrées et leurs manifests sont générés. Ils totalisent 10 631
tuiles de sortie et 2 782 tuiles sources MNT/MNS.

**Gate :** six identifiants uniques, carrés complets, marge minimale de 5 km,
grille EPSG:2154/500 m, zéro requête orthophoto.

### P1 — Relief 3D et sol 2D

**État :** `BLOCKED_PENDING_GROUND_LIBRARY_AND_CONTEXT_MAPPING_ACCEPTANCE`

Avant la production générale, accepter les quatre atlases PBR et les 72 profils,
puis lier les couches classifiées de parcelles, transport,
hydrographie, occupation et géologie. Télécharger, valider et mettre en cache
les MNT/MNS seulement après passage de ce gate.

Une première tuile réelle de 500 × 500 m de FR-30-00001 a été reconstruite
intégralement depuis ses deux sources MNT et ses deux sources MNS : hashes
identiques, grille Lambert-93 colocalisée à 0,50 m, 251 001 sommets, 250 000
faces et carte de contexte MNT/MNS identique pixel par pixel. Les GeoTIFF IGN
WMS-R portent les paramètres Lambert-93 de la requête EPSG:2154, mais leur WKT
omet le nom du datum RGF93 et n'est donc pas résolu en code EPSG par GDAL ; ce
cas est enregistré explicitement au lieu d'être présenté comme un CRS canonique.
Cette preuve ne constitue ni une acceptation du nouveau contrat de sol
contextuel, ni une validation des cinq autres terrains.

**Gate :** 4/4 atlas et 72/72 profils contrôlés à plusieurs échelles, contrats
de contexte acceptés, puis 10 631/10 631 reçus valides, aucune lacune MNT/MNS,
jointures de terrain conformes et contrôle visuel d’un échantillon de chaque
incident. Aucun placement de route ou de bâtiment ne commence avant ce gate.

### P2 — Bâtiments

Authorer les bâtis contre les terrains acceptés, sans reprendre les positions
des scènes dépréciées.

**Gate :** emprise, altitude, échelle, provenance et collisions validées.

### P3 — Routes et petits assets spécifiques

Construire les réseaux routiers, puis les objets particuliers propres à chaque
cas. Les 295 USD refaits sont une entrée de cette phase et des compositions
ultérieures ; ils ne bloquent pas P0 ou P1.

**Gate :** topologie, ancrage terrain, contexte et cohérence locale validés.

### P4 — Végétation

Composer une végétation variée et cohérente après acceptation des couches
précédentes. Le MNS sert d’indice spatial, sans restaurer les placements Die.

**Gate :** variété, densité, exclusion des bâtis/routes, ancrage et continuité
entre tuiles validés.

### P5 — Composition, simulation et packs

Réinterpréter les nombres et structures de composition encore valides, authorer
les scènes OpenUSD reproductibles, ajouter la simulation, puis construire les
packs autonomes. La richesse visuelle doit progresser ; aucun fallback vers
des scènes simplifiées n’est accepté.

**Gate :** dépendances relatives complètes, replay déterministe, ouverture Kit,
QA visuelle/runtime, archive isolée rouverte, backend fail-closed et frontend
sans ancien pack avant publication explicite.
