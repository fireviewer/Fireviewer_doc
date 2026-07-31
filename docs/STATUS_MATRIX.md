# Matrice de statut FireViewer

Cette matrice distingue le code présent, l’intégration et la promotion. Elle ne remplace pas les rapports de benchmark.

## Statuts communs

| Statut | Définition |
| --- | --- |
| `implemented` | Code ou contrat présent et couvert par les validations déclarées. |
| `integrated_unbenchmarked` | Raccordé au flux, mais non promu sur la base d’un benchmark FireViewer complet. |
| `shadow` | Exécuté sans autorité de production afin de collecter des comparaisons. |
| `benchmark_only` | Disponible uniquement dans les campagnes d’évaluation. |
| `blocked` | Présent ou planifié, mais interdit de promotion tant qu’une gate n’est pas satisfaite. |
| `deprecated` | Conservé pour historique, non utilisé dans un nouveau flux. |
| `historical` | Référence d’une architecture ou expérience antérieure. |

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

## Règle de mise à jour

Une modification de statut doit référencer :

- la révision du code ;
- le contrat ;
- les artefacts de recette ;
- le rapport de benchmark ou la raison du blocage ;
- la décision de promotion ou de retrait.

Un README ne doit pas contredire cette matrice.
