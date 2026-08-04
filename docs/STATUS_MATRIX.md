# Matrice de statut FireViewer

Cette matrice distingue le code présent, l’intégration et la promotion. Elle ne remplace pas les rapports de benchmark.

## Statuts communs

| Statut | Définition |
| --- | --- |
| `contract_defined` | Contrat documentaire présent et contrôlé, sans implication sur le runtime. |
| `specified_not_implemented` | Contrat cible présent, sans preuve d’implémentation runtime. |
| `implementation_in_progress` | Code partiel observé, mais raccordement, migration ou recette encore incomplet. |
| `implemented_unverified` | Code présent, sans validation ciblée réussie ni preuve d’intégration déclarée. |
| `implemented_tested` | Code présent et validation ciblée réussie ; ne prouve ni déploiement ni qualité terrain. |
| `implemented` | Code ou contrat présent et couvert par les validations déclarées. |
| `integrated_unbenchmarked` | Raccordé au flux, mais non promu sur la base d’un benchmark FireViewer complet. |
| `shadow` | Exécuté sans autorité de production afin de collecter des comparaisons. |
| `benchmark_only` | Disponible uniquement dans les campagnes d’évaluation. |
| `blocked` | Présent ou planifié, mais interdit de promotion tant qu’une gate n’est pas satisfaite. |
| `deprecated` | Conservé pour historique, non utilisé dans un nouveau flux. |
| `historical` | Référence d’une architecture ou expérience antérieure. |
| `IMPLEMENTED_TESTED_LOCAL` | Code présent et tests ciblés locaux réussis ; aucune preuve de service live ou de déploiement. |
| `IMPLEMENTED_NOT_LIVE_VERIFIED` | Code présent, mais dépendance externe, migration réelle ou parcours déployé non exercé. |
| `PENDING` | Contrat défini, implémentation runtime complète absente. |

## Dépôts

| Élément | Statut | Remarque |
| --- | --- | --- |
| `fireviewer-frontend` | `implemented` | Interface publique et Admin en développement actif. |
| `fireviewer-backend` | `implemented` | Registre incident-centrique, audit, jobs et revues présents. |
| `fireviewer-ai-worker` | `implemented` | Runtime et stages présents ; qualification GPU suivie séparément. |
| `fireviewer-spatial` | `implemented` | Outils et contrats présents ; packages de production séparés. |
| `fireviewer-sdg` | `implemented` | Générateur et gates présents ; corpus livrés séparément. |
| `charli-dev420/fireviewer` | `historical` | Ancien monorepo, plus source de vérité active. |

## Modèles et fonctions

| Fonction | Composant | Statut cible actuel |
| --- | --- | --- |
| ASR local | Whisper Large V3 Turbo | `integrated_unbenchmarked` |
| Détection principale | D-FINE XLarge FireViewer | `integrated_unbenchmarked` |
| Second détecteur / triage | RT-DETRv2-R50 FireViewer | `integrated_unbenchmarked` |
| Pointage primaire | MolmoPoint-8B FireViewer | `integrated_unbenchmarked` |
| Analyse structurée actuelle | Qwen | `historical` pendant migration |
| Analyse structurée cible | Ministral 3 8B Instruct | `blocked` jusqu’à intégration et recette |
| OCR | PP-OCRv6 Small | `blocked` jusqu’au raccordement |
| Segmentation-pointage | DINOv3 multi-tâches | `benchmark_only` |
| Baseline segmentation | SegFormer | `benchmark_only` |
| Annotation | SAM | `benchmark_only` |
| Surface brûlée | Prithvi officiel | `integrated_unbenchmarked` |
| Matching spatial actuel | AerialExtreMatch-RoMa | `blocked` pour promotion |
| Matcher challenger | RoMa v2 | `benchmark_only` |
| Raffinement UAV | AdHoP/OrthoLoC | `benchmark_only` |
| Pose déterministe | PyCOLMAP | `blocked` jusqu’à intégration |
| Profondeur auxiliaire | MoGe | `benchmark_only` |
| Prior multivue | VGGT-Ω | `benchmark_only` |
| Challenger détection | RF-DETR | `benchmark_only` |

## Recadrage événementiel

| Fonction | Statut | Validation | Activation ou limite actuelle |
| --- | --- | --- | --- |
| Contrats événement, API et provenance v2 | `IMPLEMENTED_TESTED_LOCAL` | Schémas stricts, routes raccordées et tests ciblés backend | Les contrats ne sont pas encore déployés. |
| Migration additive et colonnes PostGIS | `IMPLEMENTED_NOT_LIVE_VERIFIED` | Migration présente, DDL PostgreSQL compilé, test de dérive réussi | Aucune migration ou restauration réelle sur Neon/PostGIS. |
| Supabase Auth frontend | `IMPLEMENTED_TESTED_LOCAL` | Client publishable-only, compte, vérification et récupération couverts localement | Aucun projet Supabase réel vérifié. |
| Vérification JWT/JWKS et rôles backend | `IMPLEMENTED_TESTED_LOCAL` | Tests de claims standards, `app_metadata`, session active et rôle retiré | Appels `/auth/v1/user` simulés ; révocation globale de sessions encore absente. |
| Formulaire viewpoint + temps + message/preuves | `IMPLEMENTED_TESTED_LOCAL` | Suite frontend : 236 tests réussis, 4 ignorés ; check et build réussis | Derrière `VITE_FV_EVENT_V2_ENABLED` et `VITE_FV_SUPABASE_AUTH_ENABLED` ; aucune recette déployée. |
| Upload et finalisation des preuves | `IMPLEMENTED_TESTED_LOCAL` | MIME, extension, taille, hash, scan test et contrôle d’accès couverts ; matérialisation et vérification par flux sur fichier temporaire, sans lecture intégrale en mémoire | Blob et ClamAV réels non vérifiés ; requêtes HTTP Range vidéo en attente. |
| Dispatcher persistant | `IMPLEMENTED_TESTED_LOCAL` | Job unique, lease, polling, abstention, résultat et échec ambigu testés ; un ancrage inféré doit viser un média du bundle et toute preuve spatiale localisée doit avoir été préenregistrée, puis rester identique | Aucun transport RunPod live. |
| Worker `event-2.0` | `IMPLEMENTED_TESTED_LOCAL` | Suite worker événementielle et contrats associés : 59 tests réussis le 2026-08-03 | `FV_AGENT_EVENT_PIPELINE_ENABLED=false` par défaut ; aucune recette GPU ni métrique terrain. |
| `LocalizationAttempt` et `FireActivityEvent` | `IMPLEMENTED_TESTED_LOCAL` | Persistance de localisation/abstention, ancrages et preuves spatiales retournés ; état `SHADOW` distinct et non matérialisable pour le cross-view | Correction spatiale avancée et benchmark métrique en attente. |
| Revue analyste/éditeur | `IMPLEMENTED_TESTED_LOCAL` | API interne et page `/admin/revue-evenements` ; suite frontend complète réussie ; validation, rejet après validation, publication et rétractation couvertes localement | Remplacement, correction géométrique et recette navigateur Supabase live en attente. |
| Confidentialité du viewpoint | `IMPLEMENTED_TESTED_LOCAL` | Réponses contributeur sans coordonnées, anti-IDOR et snapshot sans viewpoint testés | Audit déployé et tests d’intrusion restent requis. |
| Registre externe immuable | `IMPLEMENTED_TESTED_LOCAL` | Révisions, miroirs, corrections, rétractations, CRS, licence et filiation testés | Verrous et triggers PostgreSQL non vérifiés sur une instance réelle. |
| `IncidentSourcePlan` et scheduler | `IMPLEMENTED_TESTED_LOCAL` | Watermark, lease, worker périmé et backoff borné testés ; cron privé, CLI et bootstrap idempotent raccordés | Déclenchement hébergé, concurrence réelle, secrets et fournisseurs live non vérifiés. |
| `ExternalClaim` | `IMPLEMENTED_TESTED_LOCAL` | Immutabilité, idempotence, sémantique, secret, précision, candidat privé officiel et injection au bundle agent testés | Pas d’endpoint public ni d’extraction fournisseur automatique. |
| Adaptateurs HTTP CDSE STAC, IGN WFS et Météo-France SYNOP | `IMPLEMENTED_NOT_LIVE_VERIFIED` | Suite combinée adaptateurs/registre/scheduler : 20 tests réussis ; Ruff et mypy ciblés réussis ; scheduler branché au cron privé et à la CLI | Aucun test réseau ; IGN reste un template de couche explicite ; aucune cadence hébergée ni credential fournisseur vérifié. |
| Autres adaptateurs officiels | `PENDING` | Voir `EXTERNAL_SOURCE_CONNECTORS.md` | Aucun statut live sans code, requête fournisseur et preuve de licence. |
| `ActivityEnvelopeRevision` et supports | `PENDING` | Tables et relations présentes, aucun moteur calibré | Une observation seule et la fumée seule ne peuvent jamais fermer une enveloppe. |
| Progression observée | `PENDING` | Table `ProgressionDelta` présente, aucun calcul/replay complet | Aucune interpolation ni prévision dans la couche observée. |
| Timeline publique v2 | `IMPLEMENTED_TESTED_LOCAL` | Endpoint sur snapshots non rétractés, hash revérifié et géométries canoniques ; lorsqu’elle est activée et disponible, la projection v2 est autoritaire et aucune géométrie ou timeline v1 n’y est fusionnée | Replay complet, comparaison shadow v1/v2 et recette déployée en attente. |
| Rétractation publique v2 | `IMPLEMENTED_TESTED_LOCAL` | Route éditeur, audit, retrait du snapshot actif et disparition de la timeline couverts localement | Recette Supabase/PostgreSQL déployée et propagation aux caches à valider. |
| Remplacement et rollback éditorial v2 | `PENDING` | Aucun contrat d’action complet ni replay de restauration | Implémentation, propagation, restauration et décision produit. |
| Projection des événements publiés en 3D et secours 2D | `IMPLEMENTED_TESTED_LOCAL` | Points, segments et incertitudes v2 suivent le même instant dans le panneau texte, la scène 3D et le SVG 2D ; fallback sans WebGL testé | Recette navigateur réelle, accessibilité complète, LOD avancé et performance terrain à valider. |
| Nettoyage des uploads temporaires | `IMPLEMENTED_TESTED_LOCAL` | Purge ciblée et rapport audité testés | Aucun nettoyage Blob de production exécuté. |
| Benchmark événementiel | `PENDING` | Aucun corpus avec splits par incident et métriques terrain accepté | Les nouveaux entraînements longs restent suspendus. |

## Règle de mise à jour

Une modification de statut doit référencer :

- la révision du code ;
- le contrat ;
- les artefacts de recette ;
- le rapport de benchmark ou la raison du blocage ;
- la décision de promotion ou de retrait.

Un README ne doit pas contredire cette matrice.
