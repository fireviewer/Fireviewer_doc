# fireviewer/fireviewer-model-lab

**Visibilité :** privé
**Catégorie :** Recherche
**URL :** https://github.com/fireviewer/fireviewer-model-lab

## Rôle

Préparation des corpus, recettes d’entraînement, évaluations, benchmarks et registre des modèles.

## État documenté au 19 septembre 2026

Actif — package v0.1.1. Les anciens dépôts `models` et `fireviewer-sdg` restent archivés.

## Entrées

Corpus vérifiés, manifestes de droits, configurations et checkpoints.

## Sorties

Recettes, registres, rapports d’évaluation, artefacts explicitement synthétiques et métadonnées de modèles.

## Dépendances / interfaces

Hugging Face et environnements d’entraînement séparés; extras lourds selon tâche.

## Vérification et reprise

Tests du package; `fireviewer-model-qa --help` pour QA locale. Un fichier de recette ne prouve pas un entraînement cloud exécuté.

## Limites à conserver dans toute présentation

Ne pas comparer des métriques issues de protocoles différents. Conserver split, révision, corpus, environnement et limites de chaque score.

## Règle de maintenance documentaire

Toute évolution qui change la responsabilité, un contrat public, un format de sortie, une limite de sécurité ou un identifiant compatible doit être reflétée dans le dépôt lui-même **et** dans la documentation canonique `Fireviewer_doc`. Une refonte documentaire ne doit pas être présentée comme une nouvelle preuve fonctionnelle.

## Références et portée

[Source du composant](https://github.com/fireviewer/fireviewer-model-lab) · [Organisation](../ORGANISATION.md) · [Statuts](../STATUTS_ET_VOCABULAIRE.md) · [Limites de réception](../STATUS.md).

Synthèse du pack documentaire du 19 septembre 2026, confrontée au README et à la visibilité du dépôt à cette date. Les commandes ci-dessus sont des procédures de reprise, pas des tests réexécutés lors de cette revue. Les versions mentionnées restent celles des sources consultées.
