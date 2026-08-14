# Documentation FireViewer

FireViewer est un projet distinct de recherche et développement, maintenu par **Unicorn Who Dev**. Les espaces `fireviewer` sur GitHub et Hugging Face constituent ses espaces de publication canoniques.

> FireViewer n’est ni un service d’alerte, ni une source officielle, ni un outil de conduite des secours. Ses cartes, reconstructions, analyses et simulations ne doivent pas être utilisées pour la sécurité des personnes, le commandement opérationnel, une expertise d’assurance ou une preuve juridique. En situation réelle, suivez les consignes des autorités et contactez les services d’urgence compétents.

## Rôle de ce dépôt

`Fireviewer_doc` est la source de vérité documentaire inter-dépôts de FireViewer. Il maintient l’architecture, les contrats communs, la terminologie, les statuts vérifiés, les limites de sécurité et les règles de publication.

Une affirmation présente dans un README ne vaut pas preuve de déploiement ou de qualité terrain. Les statuts et leurs preuves sont consignés dans la [matrice de statut](docs/STATUS_MATRIX.md).

## Publication et accès

FireViewer adopte une publication sélective. Pendant la restructuration, les dépôts GitHub sont conservés à accès privé. L’application web, l’API/backend, les configurations de production, les secrets, les preuves utilisateur, les données non publiées et les poids privés restent à accès privé.

Les modèles et datasets effectivement publiés sont disponibles dans l’[organisation Hugging Face FireViewer](https://huggingface.co/fireviewer). La visibilité d’un dépôt ou d’un artefact ne remplace jamais la licence et les conditions propres à ses sources.

## Documents canoniques

- [Architecture](docs/ARCHITECTURE.md)
- [Décision d’architecture événementielle](docs/adr/ADR-0001-EVENT-CENTRIC-INCIDENT-ANALYSIS.md)
- [Contrat API événement v2](docs/contracts/EVENT_API_V2.md)
- [Événements et provenance v2](docs/contracts/EVENT_AND_PROVENANCE_V2.md)
- [Connecteurs de sources externes](docs/EXTERNAL_SOURCE_CONNECTORS.md)
- [Migration et feature flags](docs/MIGRATION_AND_FEATURE_FLAGS.md)
- [Sécurité et confidentialité](docs/SECURITY_PRIVACY_EVENT_PIPELINE.md)
- [Acceptation et replay](docs/ACCEPTANCE_AND_REPLAY_MATRIX.md)
- [Roadmap](docs/ROADMAP.md)
- [Matrice de statut](docs/STATUS_MATRIX.md)
- [Sécurité et périmètre](docs/SAFETY_AND_SCOPE.md)
- [Terminologie](docs/TERMINOLOGY.md)
- [Carte des contrats](docs/CONTRACT_MAP.md)
- [Politique documentaire](docs/REPOSITORY_DOCUMENTATION_POLICY.md)
- [Stockage et rétention](docs/STORAGE_AND_RETENTION.md)

## Composants

| Composant | Rôle | Accès pendant la restructuration |
| --- | --- | --- |
| Documentation | Contrats, architecture, statut et règles communes. | Privé |
| Frontend | Contribution, consultation, revue et visualisation 3D/2D. | Privé |
| Backend | Incidents, événements, preuves, audit, validation et publication. | Privé |
| AI worker | Analyse des preuves, propositions, localisation et abstention. | Privé |
| Spatial | Référentiels, packages, cartes et validation géométrique. | Privé |
| SDG | Données synthétiques, provenance et validation réel/synthétique. | Privé |

Les détails propres à chaque composant restent dans son README et ses documents locaux. Les copies spécialisées conservées sous `repositories/` ne remplacent pas les contrats communs.

## Publications de données

### Datasets Hugging Face

Chaque dataset FireViewer possède sa propre carte. Elle décrit son contenu réel, ses splits, sa provenance, ses droits, ses limites et le statut du Dataset Viewer. Un artefact publié n’est pas automatiquement admis à l’entraînement ou promu dans le runtime.

### Packs d’évolution des incendies de juillet 2026

Le pack `fireviewer_july_2026_packs_v0.1.0` décrit cinq reconstructions rétrospectives découpées en fenêtres de douze heures : Diois, Fontainebleau, Trévillach, Gros Bessillon et Saumos/Gironde.

Les contours, zones actives et fronts marqués `reconstructed` sont des géométries dérivées de bilans de surface, de secteurs nommés, de produits cartographiques et d’observations thermiques. Ils ne constituent pas des délimitations officielles. Une interpolation rétrospective n’est ni une observation directe ni une prévision.

Le champ `qa_pass` atteste uniquement les contrôles décrits dans la méthodologie : format, validité géométrique, inclusion, croissance monotone et tolérance de surface. Chaque fenêtre doit être lue avec `activity_state`, `confidence` et `source_refs`.

Le pack fourni ne comporte pas de licence FireViewer racine et les cinq ZIP déclarés dans `individual_archives.json` ne sont pas présents dans le dossier. Il ne doit donc pas être présenté comme une release réutilisable complète tant que ces points ne sont pas régularisés.

## Principes communs

- séparer observation, reconstruction, interprétation, déclaration officielle, prévision et simulation ;
- conserver la date, la provenance, la licence et l’incertitude de chaque information ;
- maintenir les sorties automatisées privées jusqu’à une décision humaine explicite ;
- permettre l’abstention lorsque les preuves ou la géométrie sont insuffisantes ;
- ne jamais transformer une validation locale en promesse de service live ;
- ne jamais publier automatiquement une coordonnée, un périmètre ou un rapport opérationnel.

## Contact et droits

Contact public, provenance, droits, sécurité et demandes de retrait : [unicornwhodev@gmail.com](mailto:unicornwhodev@gmail.com).

Ce dépôt ne possède pas de licence racine. Aucun droit de réutilisation de sa documentation ne doit être déduit de sa seule visibilité. Les dépôts techniques et les datasets conservent leurs licences et notices propres.
