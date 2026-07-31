# FireViewer

**Cartographie 3D, chronologique et incidente-centrique pour mieux comprendre les incendies.**

FireViewer est un projet open source qui rassemble des données ouvertes, des observations documentées, des contributions citoyennes et des analyses automatisées supervisées afin de produire une représentation visuelle, datée et sourcée d’un incendie.

> FireViewer est un projet de développement et de recherche. Ce n’est ni un service d’alerte, ni une source officielle, ni un outil de conduite des secours. Il ne remplace jamais les consignes des autorités et services d’urgence.

## Documentation canonique

La documentation inter-dépôts est maintenue dans le dépôt documentaire FireViewer :

- architecture ;
- roadmap ;
- matrice de statut ;
- sécurité et périmètre ;
- terminologie ;
- carte des contrats.

Les documents spécialisés de chaque dépôt complètent cette source de vérité sans la remplacer.

## Dépôts actifs

| Dépôt | Rôle |
| --- | --- |
| [`fireviewer-frontend`](https://github.com/fireviewer/fireviewer-frontend) | Interface publique, administration, revue et viewer 3D. |
| [`fireviewer-backend`](https://github.com/fireviewer/fireviewer-backend) | API, preuves, orchestration, audit, validation et publication. |
| [`fireviewer-ai-worker`](https://github.com/fireviewer/fireviewer-ai-worker) | Analyse privée des médias, stages, modèles et abstentions. |
| [`fireviewer-spatial`](https://github.com/fireviewer/fireviewer-spatial) | Packages spatiaux, LiDAR, orthophotos, rendus et contrats géométriques. |
| [`fireviewer-sdg`](https://github.com/fireviewer/fireviewer-sdg) | Génération de corpus synthétiques, provenance et validation réel/synthétique. |

## Principes

- une page canonique par incident : `/incident/{fire_id}` ;
- chaque information conserve sa date, sa provenance et son niveau d’incertitude ;
- les sorties automatisées restent privées jusqu’à une décision humaine ;
- les faits, médias, géométries, rapports et publications sont validés séparément ;
- aucun modèle génératif ne produit une coordonnée géographique ;
- FireViewer ne prédit pas la propagation dans son pipeline public courant ;
- l’absence de preuve ou l’impossibilité de conclure reste explicite.

## Modèles et datasets

Les artefacts publics sont publiés progressivement sur :

**https://huggingface.co/fireviewer**

La publication d’un modèle ou d’un dataset ne signifie pas qu’il est promu dans le runtime. Son statut réel est documenté dans la matrice de statut et dans le dépôt producteur.

## Ancien monorepo

`charli-dev420/fireviewer` conserve l’historique du développement initial. La roadmap et l’architecture actives sont désormais maintenues dans l’organisation `fireviewer`.
