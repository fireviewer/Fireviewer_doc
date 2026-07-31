# Documentation FireViewer

Ce dépôt centralise l’architecture, la roadmap, la gouvernance des modèles et les contrats documentaires communs aux dépôts FireViewer.

Il est préparé pour devenir la source de vérité inter-dépôts après son transfert vers l’organisation `fireviewer`.

> FireViewer est un projet de développement et de recherche. Ce n’est ni un service d’alerte, ni une source officielle, ni un outil de conduite des secours. Il ne remplace jamais les consignes des autorités et services d’urgence.

## Documents canoniques

- [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md)
- [`docs/ROADMAP.md`](docs/ROADMAP.md)
- [`docs/STATUS_MATRIX.md`](docs/STATUS_MATRIX.md)
- [`docs/SAFETY_AND_SCOPE.md`](docs/SAFETY_AND_SCOPE.md)
- [`docs/TERMINOLOGY.md`](docs/TERMINOLOGY.md)
- [`docs/CONTRACT_MAP.md`](docs/CONTRACT_MAP.md)

## Documentation par dépôt

- [`repositories/fireviewer-ai-worker/`](repositories/fireviewer-ai-worker/)
- [`repositories/fireviewer-backend/`](repositories/fireviewer-backend/)
- [`repositories/fireviewer-spatial/`](repositories/fireviewer-spatial/)
- [`repositories/fireviewer-sdg/`](repositories/fireviewer-sdg/)
- [`repositories/fireviewer-frontend/`](repositories/fireviewer-frontend/)

## Principes retenus

- conserver les composants FireViewer déjà entraînés et intégrés ;
- remplacer Qwen par Ministral 3 8B dans les contrats et le runtime ;
- utiliser un graphe déclaratif de stages tout en maintenant une exécution GPU lourde strictement séquentielle ;
- conserver MolmoPoint comme pointage primaire pendant le développement du challenger DINOv3 multi-tâches ;
- attribuer des rôles distincts à D-FINE et RT-DETRv2 ;
- introduire PyCOLMAP et une banque de rendus limitée à chaque zone ;
- séparer l’incertitude visuelle de l’échec géométrique ;
- ne publier aucune mesure ou promesse sans artefact de benchmark ;
- maintenir une revue humaine avant toute publication.

## Dépôts actifs

- `fireviewer/fireviewer-frontend`
- `fireviewer/fireviewer-backend`
- `fireviewer/fireviewer-ai-worker`
- `fireviewer/fireviewer-spatial`
- `fireviewer/fireviewer-sdg`

L’ancien monorepo `charli-dev420/fireviewer` conserve l’historique du développement initial et ne porte plus la roadmap active.
