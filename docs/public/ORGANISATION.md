# Organisation des dépôts FireViewer et UWD

**État documentaire et inventaire GitHub vérifiés : 19 septembre 2026.**

L’organisation active comprend **18 dépôts FIRE-VIEWER : 16 composants cœur, institutionnels, infrastructure et transition, plus 2 dépôts auxiliaires Android**. Le dépôt UWD `unicornwhodev/map-builder` reste une dépendance externe séparée ; il ne fait pas partie de ces 18 dépôts. Huit composants de domaine rejoignent les deux dépôts documentaires publics dans le [premier lot d’ouverture](OPEN_SOURCE.md). Les sites, le backend, les applications Android, l’infrastructure, le worker transitoire et Unreal restent privés. La visibilité d’un dépôt ne constitue ni une preuve de maturité ni une cession de droits.

| Dépôt | Responsabilité | Accès |
| --- | --- | --- |
| `fireviewer/.github` | Profil GitHub et règles de contribution publiques | public |
| `fireviewer/Fireviewer_doc` | Documentation publique de référence | public |
| `fireviewer/fireviewer-ai-worker` | Compatibilité d’anciens imports et commandes | privé, transition |
| `fireviewer/fireviewer-association-site` | Site institutionnel de l’association | privé |
| `fireviewer/fireviewer-backend` | Incidents, comptes, droits, décisions, audit et publication | privé |
| `fireviewer/fireviewer-contracts` | Contrats métier et géométrie partagée | public |
| `fireviewer/fireviewer-docker` | Composition, verrous de versions et procédures d’exploitation | privé |
| `fireviewer/fireviewer-evidence-ingestion` | Sources, médias, transcription et acquisition/normalisation satellite | public |
| `fireviewer/fireviewer-evidence-supervisor` | Évaluation des preuves, contradictions, acceptation, rejet et abstention | public |
| `fireviewer/fireviewer-fire-state` | Calcul Part.4, profils, calibration et évaluation | public |
| `fireviewer/fireviewer-frontend` | Viewer, administration, catalogue, contribution et chronologie | privé |
| `fireviewer/fireviewer-geolocation` | Hypothèses géographiques, Panoramax, retrieval et registration | public |
| `fireviewer/fireviewer-model-lab` | Corpus, entraînement, benchmarks et registre des modèles | public |
| `fireviewer/fireviewer-orchestrator` | Exécution, dispatch, reprises et idempotence | public |
| `fireviewer/fireviewer-unreal` | Visualisation et scénarios incendie Unreal | privé |
| `fireviewer/fireviewer-vision-runtime` | Détection, pointage, segmentation et keyframes | public |
| `fireviewer/FIRE-VIEWER-gestion-android` | Gestion associative Android ; hors pipeline incendie | privé, auxiliaire |
| `fireviewer/pointing-atelier` | Annotation manuelle Android et corpus HF ; préparation automatique en pause | privé, auxiliaire |
| `unicornwhodev/map-builder` | Producteur cartographique générique, CLI/API/UI et outils cartographiques Unreal | privé · UWD |

Les [fiches des 18 dépôts](repositories/README.md) décrivent leurs entrées, sorties et limites. Ces deux dépôts auxiliaires n’ajoutent pas deux microservices au pipeline. Unreal reste conservé pour un chantier de simulation en attente, hors travaux MVP actuels.

## Routage des changements

- Terrain, acquisition géographique, packaging et outils cartographiques Unreal génériques : UWD `map-builder`.
- Incidents, permissions, persistance, décisions, audits et publication : backend FIRE-VIEWER.
- Interfaces incidents et atlas : frontend FIRE-VIEWER ; site associatif : dépôt dédié.
- Contrats partagés : `fireviewer-contracts` ; algorithmes : composant métier concerné ; entraînement et registre : `fireviewer-model-lab`.
- Compatibilité d’anciens imports : `fireviewer-ai-worker`, sans nouveau développement canonique.
- Composition et versions d’exécution : `fireviewer-docker`.
- Gestion associative mobile : `FIRE-VIEWER-gestion-android` ; annotation mobile et préparation des corpus : `pointing-atelier`, dans le respect de la pause documentée.

Les chemins et conventions de rangement propres à un poste de travail ne définissent aucune source canonique et restent hors de cette documentation publique.

## Dépôts historiques — non actifs

Les dépôts suivants ont été retirés de GitHub le 9 septembre 2026 après archivage vérifié. Ils sont conservés uniquement pour provenance, compatibilité ou récupération et ne reçoivent plus de développement produit.

| Ancien dépôt | Remplacement actuel | Conservation |
| --- | --- | --- |
| `fireviewer/fireviewer-spatial` | UWD `map-builder`, contrats FV et lecteurs de packages acceptés | archive hors GitHub |
| `fireviewer/fireviewer-sdg` | helpers utiles dans `fireviewer-model-lab` ; anciennes chaînes retirées | archive hors GitHub |
| `fireviewer/models` | registre canonique dans `fireviewer-model-lab` | archive hors GitHub |

Les références à ces noms dans des snapshots ou reçus datés sont historiques. Elles ne doivent pas être interprétées comme des liens vers des dépôts actifs.

## Périmètre de réception

Les packages de terrain liés à un incident peuvent suivre leur réception technique propre. Les résultats IA sensibles conservent une validation humaine. Terrain, produits incendie datés, calculs FireViewer et résultats IA restent des catégories distinctes.

La généralisation agentique des périmètres et photos, la qualification de modèles ou fournisseurs, les chemins GPU et Unreal natif restent des chantiers séparés avec leurs propres critères de réception.

Voir aussi [Repository guide](REPOSITORIES.md), [Current status](STATUS.md) et [Repository hygiene](REPOSITORY_HYGIENE.md).
