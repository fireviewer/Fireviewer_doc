# FireViewer

**Cartographie 3D, chronologique et incidente-centrique pour mieux comprendre les incendies.**

FireViewer est un projet open source qui rassemble des données ouvertes, des observations documentées, des contributions citoyennes et des analyses automatisées supervisées afin de produire une représentation visuelle, datée et sourcée d’un incendie.

> FireViewer est un projet de développement et de recherche. Ce n’est ni un service d’alerte, ni une source officielle, ni un outil de conduite des secours. Il ne remplace jamais les consignes des autorités et services d’urgence.

## Architecture événementielle

Le cœur métier cible est un événement documenté au sein d’un incident. Une contribution crée un `EventCandidate` privé avec un point de prise de vue, un instant ou un intervalle, un message et, facultativement, des images ou vidéos. Le point de prise de vue représente l’observateur ou la caméra, jamais automatiquement le feu.

L’analyse produit des propositions privées, des tentatives de localisation ou des abstentions explicites. Une sortie automatisée ne devient jamais publique par elle-même : la validation humaine et la publication éditoriale restent deux décisions séparées. La route publique canonique d’un incident est `/incident/{fire_id}`.

## Documentation canonique

Le dépôt [`Fireviewer_doc`](https://github.com/fireviewer/Fireviewer_doc) maintient la source de vérité documentaire inter-dépôts :

- [architecture canonique](https://github.com/fireviewer/Fireviewer_doc/blob/main/docs/ARCHITECTURE.md) ;
- [roadmap](https://github.com/fireviewer/Fireviewer_doc/blob/main/docs/ROADMAP.md) ;
- [matrice de statut](https://github.com/fireviewer/Fireviewer_doc/blob/main/docs/STATUS_MATRIX.md) ;
- [sécurité et périmètre](https://github.com/fireviewer/Fireviewer_doc/blob/main/docs/SAFETY_AND_SCOPE.md) ;
- [terminologie](https://github.com/fireviewer/Fireviewer_doc/blob/main/docs/TERMINOLOGY.md) ;
- [carte des contrats](https://github.com/fireviewer/Fireviewer_doc/blob/main/docs/CONTRACT_MAP.md).

Les documents spécialisés de chaque dépôt complètent cette source de vérité sans la remplacer.

## Dépôts actifs

| Dépôt | Rôle |
| --- | --- |
| [`Fireviewer_doc`](https://github.com/fireviewer/Fireviewer_doc) | Architecture, contrats communs, roadmap, statuts, sécurité et terminologie. |
| [`fireviewer-frontend`](https://github.com/fireviewer/fireviewer-frontend) | Contribution événementielle, interface publique, administration, revue et projection 3D/2D. |
| [`fireviewer-backend`](https://github.com/fireviewer/fireviewer-backend) | Registre incident-centrique, preuves, orchestration, audit, validation et publication. |
| [`fireviewer-ai-worker`](https://github.com/fireviewer/fireviewer-ai-worker) | Analyse privée des preuves, stages, modèles, localisation et abstentions. |
| [`fireviewer-spatial`](https://github.com/fireviewer/fireviewer-spatial) | Référentiels, packages, rendus, contrats de caméra et géométrie. |
| [`fireviewer-sdg`](https://github.com/fireviewer/fireviewer-sdg) | Données synthétiques, annotations, provenance et validation réel/synthétique. |

## État vérifié et limites

Le socle event-v2 est **implémenté et testé localement derrière des feature flags désactivés par défaut** : API et persistance, job d’analyse persistant, worker `event-2.0`, formulaire, revue humaine, registre externe, rétention et projection publique des événements en 3D avec secours 2D.

Ce statut local ne prouve ni un déploiement ni un service opérationnel. Supabase, Blob, ClamAV, RunPod, PostGIS et les fournisseurs externes n’ont pas été validés en conditions live. Les enveloppes d’activité, la progression, la recette publique déployée et le replay complet restent à livrer. Les statuts détaillés et leurs preuves sont maintenus dans la [matrice de statut](https://github.com/fireviewer/Fireviewer_doc/blob/main/docs/STATUS_MATRIX.md).

## Principes

- chaque information conserve sa date, sa provenance et son niveau d’incertitude ;
- observation, interprétation, déclaration officielle, prévision et simulation restent distinctes ;
- les faits, preuves, géométries, rapports et publications sont validés séparément ;
- aucun modèle génératif ne produit une coordonnée géographique ;
- l’absence de preuve ou l’impossibilité de conclure reste explicite ;
- FireViewer ne prédit pas la propagation dans son pipeline public courant.

## Modèles et datasets

Les artefacts publics sont publiés progressivement sur [Hugging Face](https://huggingface.co/fireviewer). La publication d’un modèle ou d’un dataset ne signifie pas qu’il est promu dans le runtime ; son statut réel reste documenté dans la matrice de statut et dans le dépôt producteur.

## Ancien monorepo

`charli-dev420/fireviewer` désigne l’historique du développement initial lorsqu’il est accessible. La roadmap et l’architecture actives sont maintenues dans l’organisation `fireviewer`.
