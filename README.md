# Documentation FireViewer

Ce dépôt centralise l’architecture, la roadmap, la gouvernance des modèles et les contrats documentaires communs aux dépôts FireViewer.

Il porte la source de vérité documentaire locale inter-dépôts. Son état de publication distante est vérifié séparément et n’est pas déduit de ce README.

> FireViewer est un projet de développement et de recherche. Ce n’est ni un service d’alerte, ni une source officielle, ni un outil de conduite des secours. Il ne remplace jamais les consignes des autorités et services d’urgence.

## Documents canoniques

- [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md)
- [`docs/adr/ADR-0001-EVENT-CENTRIC-INCIDENT-ANALYSIS.md`](docs/adr/ADR-0001-EVENT-CENTRIC-INCIDENT-ANALYSIS.md)
- [`docs/contracts/EVENT_API_V2.md`](docs/contracts/EVENT_API_V2.md)
- [`docs/contracts/EVENT_AND_PROVENANCE_V2.md`](docs/contracts/EVENT_AND_PROVENANCE_V2.md)
- [`docs/EXTERNAL_SOURCE_CONNECTORS.md`](docs/EXTERNAL_SOURCE_CONNECTORS.md)
- [`docs/MIGRATION_AND_FEATURE_FLAGS.md`](docs/MIGRATION_AND_FEATURE_FLAGS.md)
- [`docs/SECURITY_PRIVACY_EVENT_PIPELINE.md`](docs/SECURITY_PRIVACY_EVENT_PIPELINE.md)
- [`docs/ACCEPTANCE_AND_REPLAY_MATRIX.md`](docs/ACCEPTANCE_AND_REPLAY_MATRIX.md)
- [`docs/ROADMAP.md`](docs/ROADMAP.md)
- [`docs/STATUS_MATRIX.md`](docs/STATUS_MATRIX.md)
- [`docs/SAFETY_AND_SCOPE.md`](docs/SAFETY_AND_SCOPE.md)
- [`docs/TERMINOLOGY.md`](docs/TERMINOLOGY.md)
- [`docs/CONTRACT_MAP.md`](docs/CONTRACT_MAP.md)
- [`docs/REPOSITORY_DOCUMENTATION_POLICY.md`](docs/REPOSITORY_DOCUMENTATION_POLICY.md)
- [`docs/STORAGE_AND_RETENTION.md`](docs/STORAGE_AND_RETENTION.md)

## Documentation par dépôt

- [`repositories/fireviewer-ai-worker/`](repositories/fireviewer-ai-worker/)
- [`repositories/fireviewer-backend/`](repositories/fireviewer-backend/)
- [`repositories/fireviewer-spatial/`](repositories/fireviewer-spatial/)
- [`repositories/fireviewer-sdg/`](repositories/fireviewer-sdg/)
- [`repositories/fireviewer-frontend/`](repositories/fireviewer-frontend/)

## Principes retenus

- organiser le produit autour d’événements documentés au sein d’un incident ;
- distinguer le point de prise de vue de la géométrie d’activité ;
- accepter un message sans média et jusqu’à vingt images ou vidéos comme preuves facultatives ;
- déclencher une analyse privée directement après admission, sans publication automatique ;
- compléter les événements par des sources officielles et d’observation de la Terre dont la filiation reste visible ;
- séparer observation, interprétation, déclaration officielle, prévision et simulation ;
- conserver les composants FireViewer déjà entraînés et intégrés ;
- remplacer Qwen par Ministral 3 8B dans les contrats et le runtime ;
- utiliser un graphe déclaratif de stages tout en maintenant une exécution GPU lourde strictement séquentielle ;
- conserver MolmoPoint comme pointage primaire pendant le développement du challenger DINOv3 multi-tâches ;
- attribuer des rôles distincts à D-FINE et RT-DETRv2 ;
- introduire PyCOLMAP et une banque de rendus limitée à chaque zone ;
- séparer l’incertitude visuelle de l’échec géométrique ;
- ne publier aucune mesure ou promesse sans artefact de benchmark ;
- maintenir une revue humaine avant toute publication.

Le recadrage événementiel possède un socle local testé : API et persistance v2, job persistant, worker `event-2.0`, formulaire, revue, registre externe, rétention et projection publique v2 en 3D avec secours 2D. Les flags restent désactivés par défaut. Supabase, Blob, ClamAV, RunPod, PostGIS et les fournisseurs externes n’ont pas été validés live ; les enveloppes, la progression, la recette publique déployée et le replay complet restent à livrer. Le détail est suivi dans [`docs/STATUS_MATRIX.md`](docs/STATUS_MATRIX.md).

## Dépôts actifs

- `fireviewer/Fireviewer_doc`
- `fireviewer/fireviewer-frontend`
- `fireviewer/fireviewer-backend`
- `fireviewer/fireviewer-ai-worker`
- `fireviewer/fireviewer-spatial`
- `fireviewer/fireviewer-sdg`

L’ancien monorepo `charli-dev420/fireviewer` conserve l’historique du développement initial et ne porte plus la roadmap active.
