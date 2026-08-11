# Cartes 3D, périmètres observés et entrées de simulation

**État :** `IMPLEMENTED_TESTED_LOCAL_NOT_DEPLOYED`

## Décision

FireViewer possède désormais un seul pipeline actif de production de cartes
3D. Il remplace les anciennes scènes Unity, le terrain adaptatif/PBR et les
registres de packs de simulation historiques.

La production et la simulation restent deux responsabilités séparées :

- l'espace de production crée une carte ou un package supplémentaire de
  périmètres observés ;
- un moteur de simulation, un pipeline dataset ou un replay consomme ensuite
  ces artefacts immuables ;
- aucun consommateur ne reconstruit le terrain, les assets ou les périmètres.

Carte et périmètres sont volontairement deux jobs distincts, avec une seule
production active à la fois. Une nouvelle timeline peut donc être ajoutée quand
la progression observée évolue sans recréer la carte.

## Carte autonome

L'utilisateur fournit le centre GPS du carré et la longueur d'un côté. Le
moteur aligne l'emprise sur des tuiles Lambert-93 de 500 m et, pour chaque
tuile, traite temporairement MNT, MNS et orthophoto.

Le résultat scellé contient :

- `zone.usda` et `zone.blend`, scènes unifiées autonomes ;
- les packages terrain FVTG de chaque tuile ;
- la texture de sol orthophoto bakée ;
- les instances d'assets mesurées et les placements GPS explicites ;
- uniquement les USD et textures effectivement utilisés ;
- les petits reçus de provenance et tous les hashes ;
- exactement 20 captures de contrôle : quatre vues générales puis seize
  détails.

Les rasters MNT/MNS/orthophoto bruts sont supprimés après validation de leur
tuile et ne sont pas livrés. Le package reste ouvrable indépendamment après
extraction.

## Périmètres observés

Le second job accepte un JSON FireViewer ou un GeoJSON. Il produit :

- `geographic-perimeters.usda` ;
- `fire-progression-timeline.json` ;
- `perimeters.normalized.json` ;
- le manifeste hashé ;
- une vue GLB dérivée par état pour le contrôle web.

Affected et active restent des catégories distinctes. Chaque état correspond à
un instant observé ou à une plage explicitement fournie. Entre deux
observations, la progression est `undefined` ; aucune interpolation, vitesse ou
prévision n'est inventée.

Les GLB servent uniquement à afficher la timeline dans le navigateur. Le JSON
normalisé, la timeline et l'USD restent les données de référence.

## Import et contrôle dans le site

Le site ne transforme pas les livrables. Après extraction du ZIP, il vérifie
chaque fichier, SHA-256, contrat et identité spatiale avant l'import.

- OpenUSD est contrôlé dans l'Admin par les 20 captures liées au package ;
- la timeline est contrôlée par les GLB dérivés déjà contenus dans son package ;
- le téléchargement direct de `zone.usda`, de la timeline et du calque USD
  reste disponible ;
- aucune publication publique n'est automatique.

Le site ne traite plus OpenUSD comme un ancien catalogue de tuiles. L'ancien
registre global vide de packs est retiré ; les téléchargements sont désormais
rattachés à la fiche de l'incident et au build exact de sa carte.

## Téléchargements de la fiche incident

Lorsqu'une carte est publiée, son ZIP complet de production doit être proposé
sur la fiche incident. Ce ZIP est le livrable autonome original, pas une scène
reconstruite par le site.

Les packs de simulation restent prévus comme livrables supplémentaires. Quand
un pack est produit et publié, il apparaît à côté de la carte et conserve au
minimum l'identité du build de carte, la timeline utilisée, son SHA-256, sa
taille et son point d'entrée. Plusieurs packs peuvent viser la même carte sans
la modifier.

La disponibilité publique d'un ZIP carte ou simulation est une décision de
publication explicite. L'import technique d'une carte ne rend aucun fichier
public automatiquement.

## Contrat des consommateurs

Une simulation, un dataset ou un replay utilise
`fireviewer.scene-consumer-input.v1`. Ce contrat verrouille :

- package ID, révision, zone, build ID, contrat et archive de la carte ;
- `zone.usda`, `EPSG:2154` et `NGF-IGN69` ;
- éventuellement le package de périmètres, sa timeline et le build exact de sa
  carte de base ;
- l'interdiction de reconstruire terrain et périmètres ;
- l'absence d'interpolation entre observations ;
- le fait que l'exécution de simulation est une responsabilité externe.

Une carte `technical_unpublished` peut être utilisée pour une simulation ou un
dataset interne. Sa publication publique est une décision indépendante.

## Gates

| Gate | Preuve requise |
| --- | --- |
| Carte produite | packages revalidés, assets autonomes, rasters bruts absents, 20 captures hashées |
| Carte importée | inventaire byte-for-byte, contrat actif, identité de zone/build et contrôles disponibles |
| Timeline produite | source normalisée, états explicites, USD, timeline et GLB dérivés hashés |
| Timeline attachée | même package/révision/zone/build/contrat que la carte active |
| Consommation simulation/dataset | `scene-consumer-input.v1` valide et aucune reconstruction |
| Téléchargement carte | ZIP original, SHA-256 et build de carte publiés sur la fiche incident |
| Téléchargement simulation | pack supplémentaire lié au même build et à la timeline consommée |
| Publication | décision humaine séparée et auditée |

Les tests locaux ne prouvent pas une acquisition fournisseur live, un pod, un
rendu GPU ni une publication réelle. Ces validations restent rapportées
séparément.
