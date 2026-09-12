# Organisation des dépôts FireViewer et UWD

Les dépôts actifs ci-dessous sont les points de commit canoniques. Les applications et composants sont privés ; seuls le profil et la documentation FV sont publics. Un site consultable publiquement ne rend pas son code public. Les licences et notices existantes restent inchangées.

| Dépôt | Responsabilité | Accès |
| --- | --- | --- |
| [fireviewer/.github](https://github.com/fireviewer/.github) | Profil GitHub et règles de contribution publiques. | public |
| [fireviewer/Fireviewer_doc](https://github.com/fireviewer/Fireviewer_doc) | Documentation de référence et organisation du projet. | public |
| [fireviewer/fireviewer-ai-worker](https://github.com/fireviewer/fireviewer-ai-worker) | Adaptateurs de compatibilité pour les anciens imports et commandes. | private |
| [fireviewer/fireviewer-association-site](https://github.com/fireviewer/fireviewer-association-site) | Site associatif FireViewer, distinct du viewer et de son administration. | private |
| [fireviewer/fireviewer-backend](https://github.com/fireviewer/fireviewer-backend) | Autorité durable des incidents, preuves, comptes, droits, décisions, audit et publication. | private |
| [fireviewer/fireviewer-contracts](https://github.com/fireviewer/fireviewer-contracts) | Contrats métier et géométrie partagée, modèles Python, types TypeScript et fixtures. | private |
| [fireviewer/fireviewer-docker](https://github.com/fireviewer/fireviewer-docker) | Infrastructure, verrous des images, recettes de reconstruction et procédures privées. | private |
| [fireviewer/fireviewer-evidence-ingestion](https://github.com/fireviewer/fireviewer-evidence-ingestion) | Sources, médias, transcription et acquisition/normalisation satellite. | private |
| [fireviewer/fireviewer-evidence-supervisor](https://github.com/fireviewer/fireviewer-evidence-supervisor) | Eve, acceptation, rejet, abstention et contradictions. | private |
| [fireviewer/fireviewer-fire-state](https://github.com/fireviewer/fireviewer-fire-state) | Calcul Part.4, profils, calibration et évaluation. | private |
| [fireviewer/fireviewer-frontend](https://github.com/fireviewer/fireviewer-frontend) | Viewer public, administration, catalogue, contribution et chronologie. | private |
| [fireviewer/fireviewer-geolocation](https://github.com/fireviewer/fireviewer-geolocation) | Hypothèses géographiques, Panoramax, retrieval et registration. | private |
| [fireviewer/fireviewer-model-lab](https://github.com/fireviewer/fireviewer-model-lab) | Préparation des corpus, entraînement, benchmarks et registre des modèles. | private |
| [fireviewer/fireviewer-orchestrator](https://github.com/fireviewer/fireviewer-orchestrator) | Exécution, dispatch, reprises et idempotence des agents. | private |
| [fireviewer/fireviewer-unreal](https://github.com/fireviewer/fireviewer-unreal) | Visualisation et scénarios incendie Unreal. | private |
| [fireviewer/fireviewer-vision-runtime](https://github.com/fireviewer/fireviewer-vision-runtime) | Détection, pointage, segmentation et extraction de keyframes. | private |
| [unicornwhodev/map-builder](https://github.com/unicornwhodev/map-builder) | Producteur cartographique générique web/CLI/API et outils cartographiques Unreal. | private |

## Circulation des changements

- Terrain, acquisition, packaging et outils cartographiques Unreal génériques : UWD `map-builder`.
- Incidents, permissions, persistance, décisions, audits et publication : backend FV.
- Interfaces web incidents/Atlas : frontend FV ; pages associatives : dépôt associatif distinct.
- Schémas partagés : contracts ; algorithmes : package métier concerné ; entraînement/registre : model-lab.
- Compatibilité des anciens imports : ai-worker, sans y dupliquer les développements canoniques.
- Déploiement, images et organisation technique privée : fireviewer-docker.

## Travail local

Arborescence de référence : `actifs/<propriétaire>/<dépôt>`, `travaux/<chantier>/<composant>` pour les worktrees parallèles, `archives/` pour les sources et travaux historiques. La racine multi-dépôts n’est pas un dépôt Git. Chaque commit appartient à un seul composant ; vérifier son remote et son diff avant l’ajout des fichiers. Les archives ne sont pas des emplacements de commit.

Les machines peuvent conserver des chemins de compatibilité pour les consommateurs historiques ; ils ne définissent pas de nouvelle source canonique. Les poids, corpus, acquisitions et sorties restent externes à Git.

## Historique remplacé

Les trois dépôts ci-dessous ont été retirés de GitHub le 9 septembre 2026 après vérification de leur archive restaurable. Une seule archive compacte est conservée par dépôt ; les copies temporaires de restauration sont supprimées. Les anciens checkouts et builds redondants sont éliminés après préservation des seuls travaux uniques.

| Ancien dépôt | Remplacement | Conservation |
| --- | --- | --- |
| `fireviewer-spatial` | Producteur UWD, contrats FV et lecteurs de packages acceptés | Archive Git complète, branches/tags/PR et métadonnées ; restauration vérifiée |
| `fireviewer-sdg` | Helpers utiles dans model-lab ; anciennes chaînes Blender/Omniverse retirées | Archive Git et métadonnées vérifiées |
| `models` | Registre canonique dans fireviewer-model-lab | Archive Git et métadonnées vérifiées |

Le worker de compatibilité et Unreal incendie restent actifs. Les packages cartographiques déjà publiés conservent leurs adresses et contrats. La carte complète de Die reste la référence du viewer.

## Périmètre de réception

Les cartes de terrain liées à un incendie existant se publient automatiquement après réception technique. Les publications IA/LLM conservent la décision humaine. Terrain et produits incendie datés restent distincts. La généralisation agentique des périmètres/photos et les recettes modèles/GPU/Unreal auparavant inachevées restent des chantiers séparés. Les attributions juridiques non signées ne sont pas déclarées effectives.

Le README et ORGANISATION.md de chaque composant indiquent son rôle, ses commandes et ses limites. Les reçus opérationnels détaillés et l’inventaire des archives restent privés.
