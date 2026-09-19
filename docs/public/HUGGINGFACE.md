# Modèles et datasets publics FireViewer

**Inventaire public vérifié le 19 septembre 2026 : 5 modèles et 4 datasets.** Les corpus privés conservent leur documentation et leurs droits dans leurs dépôts à accès restreint.

FireViewer reste un MVP de recherche. Publication, qualification, droits de redistribution et promotion dans un runtime sont des états distincts. Une revue documentaire ne constitue pas une nouvelle évaluation.

## Modèles

| Modèle | Statut | Mesure et protocole |
| --- | --- | --- |
| [fire-smoke-dfine-m-strict-v1](https://huggingface.co/fireviewer/fire-smoke-dfine-m-strict-v1) | Candidat de recherche principal, non qualifié production | mAP50–95 indépendant 0,3924 ; F1 holdout calibré 0,6475 |
| [rtdetr-v2-r50-fire-smoke](https://huggingface.co/fireviewer/rtdetr-v2-r50-fire-smoke) | Référence historique/conservatrice | mAP50–95 indépendant 0,3502 |
| [fire-smoke-yolo11m-strict-v1](https://huggingface.co/fireviewer/fire-smoke-yolo11m-strict-v1) | Baseline, pas détecteur principal | mAP50–95 indépendant 0,1491 ; AP flamme 0,0193 |
| [fire-smoke-rfdetr-medium-v110-strict-v1](https://huggingface.co/fireviewer/fire-smoke-rfdetr-medium-v110-strict-v1) | Candidat de validation ; benchmark indépendant encore manquant | mAP50–95 validation entraînement 0,468331, EMA époque 18 |
| [dinov3-pointing-pilot-v1](https://huggingface.co/fireviewer/dinov3-pointing-pilot-v1) | Pilote public observé ; politique de publication à clarifier | PCK@10 0,55556 sur 9 points positifs de validation seulement |

Les scores indépendants D-FINE, RT-DETR et YOLO utilisent 512 images de `Hajorda/flameye-wildfire-detection@test`, révision `361a3dea8b877482af9f4ed80eff77ffd39926ef`. La calibration et le holdout (129/383 images dans le protocole documenté) restent distincts. **Ne pas classer RF-DETR ou DINOv3 dans le même tableau de performances** : leurs tâches/splits/protocoles diffèrent. Les seuils calibrés ne sont pas des seuils opérationnels.

DINOv3 est visible publiquement, alors que ses reçus historiques conservent une politique privée et une absence d’approbation de publication. La card doit refléter la visibilité constatée sans inventer une autorisation de redistribution ou de promotion. La décision de droits reste à établir.

## Datasets

| Dataset | Statut | Contenu établi |
| --- | --- | --- |
| [fire-smoke-detection-corpus-v1](https://huggingface.co/datasets/fireviewer/fire-smoke-detection-corpus-v1) | Corpus de référence détection strict-clean | 102 257 lignes ; train 60 981 / validation 19 209 / test 22 067 ; droits par source |
| [firewarning-train-bundles-v1](https://huggingface.co/datasets/fireviewer/firewarning-train-bundles-v1) | Archive de reproductibilité | 15 ZIP64, maturités distinctes ; catalogue documentaire, pas un corpus homogène |
| [simple-measured-scenes-v1](https://huggingface.co/datasets/fireviewer/simple-measured-scenes-v1) | Ressource géographique active/de référence | Packages mesurés Die/Justin, producteur UWD séparé, chemins publiés conservés |
| [fire-and-smoke-corpus-point-and-detect](https://huggingface.co/datasets/fireviewer/fire-and-smoke-corpus-point-and-detect) | Publication incomplète | Avant ajout de la card : seulement `.gitattributes`, aucun corpus utilisable |

## Révisions examinées

Ces révisions précèdent la présente mise à jour documentaire. Elles figent les sources des affirmations sans faire passer la date de revue pour une nouvelle date de test.

| Ressource | Révision source |
| --- | --- |
| `fire-smoke-dfine-m-strict-v1` | [`1d8e0d5eba6a83ea85c0b4318a3c95eca88a3e34`](https://huggingface.co/fireviewer/fire-smoke-dfine-m-strict-v1/tree/1d8e0d5eba6a83ea85c0b4318a3c95eca88a3e34) |
| `rtdetr-v2-r50-fire-smoke` | [`51ff9b36f258dee8d54d80eebdb3c023f61bd4d5`](https://huggingface.co/fireviewer/rtdetr-v2-r50-fire-smoke/tree/51ff9b36f258dee8d54d80eebdb3c023f61bd4d5) |
| `fire-smoke-yolo11m-strict-v1` | [`cd483986db09dbb8541087605628bcc23ba5b48f`](https://huggingface.co/fireviewer/fire-smoke-yolo11m-strict-v1/tree/cd483986db09dbb8541087605628bcc23ba5b48f) |
| `fire-smoke-rfdetr-medium-v110-strict-v1` | [`443ea24a73004558b288eb3b7d78d7b04cdd5cd4`](https://huggingface.co/fireviewer/fire-smoke-rfdetr-medium-v110-strict-v1/tree/443ea24a73004558b288eb3b7d78d7b04cdd5cd4) |
| `dinov3-pointing-pilot-v1` | [`ea193c71e8034c2477596d3648d727ceb9e78a03`](https://huggingface.co/fireviewer/dinov3-pointing-pilot-v1/tree/ea193c71e8034c2477596d3648d727ceb9e78a03) |
| `fire-smoke-detection-corpus-v1` | [`f48d2bce8acb371be501993c9cabb5df563de40c`](https://huggingface.co/datasets/fireviewer/fire-smoke-detection-corpus-v1/tree/f48d2bce8acb371be501993c9cabb5df563de40c) |
| `firewarning-train-bundles-v1` | [`cd7bc171f0ff618fae6f484ee538b2ca78cc4814`](https://huggingface.co/datasets/fireviewer/firewarning-train-bundles-v1/tree/cd7bc171f0ff618fae6f484ee538b2ca78cc4814) |
| `simple-measured-scenes-v1` | [`67f8f698ffd011ded66b4a3caacf7e43e5fcc238`](https://huggingface.co/datasets/fireviewer/simple-measured-scenes-v1/tree/67f8f698ffd011ded66b4a3caacf7e43e5fcc238) |
| `fire-and-smoke-corpus-point-and-detect` | [`75a9b31b12aff8e5098c0e6c50995cd465195548`](https://huggingface.co/datasets/fireviewer/fire-and-smoke-corpus-point-and-detect/tree/75a9b31b12aff8e5098c0e6c50995cd465195548) |

## Méthode et droits

Préserver schémas, sources, licences par famille, hashes, transformations, groupes de split, exclusions et distinction entre annotations humaines, automatiques ou faibles. Les contrôles de structure et de déduplication exacte ne prouvent pas la précision sémantique ou l’absence de tous les quasi-doublons. Les observations incendie restent distinctes des cartes mesurées.

[Standard de card](maintenance/STANDARD_MODEL_DATASET_CARD.md) · [Maintenance](maintenance/PLAN_DE_MAINTENANCE.md) · [Gouvernance](presentations/GOUVERNANCE_ET_DROITS.md) · [Statut du projet](STATUS.md).

Site institutionnel : [fire-viewer.fr](https://fire-viewer.fr). Contact : **contact@fire-viewer.fr**.
