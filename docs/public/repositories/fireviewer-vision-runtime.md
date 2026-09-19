# fireviewer/fireviewer-vision-runtime

**Visibilité :** privé
**Catégorie :** Cœur
**URL :** https://github.com/fireviewer/fireviewer-vision-runtime

## Rôle

Inférence spécialisée : détection, pointing, segmentation et extraction de keyframes.

## État documenté au 19 septembre 2026

Actif — package v0.1.1. Modèles externes/poids séparés de l’installation de base.

## Entrées

Images/vidéos référencées et checkpoints explicitement sélectionnés.

## Sorties

Observations en espace image : boxes, masques, points, keyframes et métadonnées.

## Dépendances / interfaces

contracts; modèles/configurations externes.

## Vérification et reprise

Installation du wheel et tests; `fireviewer-keyframes` pour la sélection vidéo CPU.

## Limites à conserver dans toute présentation

Une box ou un point image n’est pas une coordonnée terrain. Les tests CPU ne qualifient pas un modèle GPU ou sa performance terrain.

## Règle de maintenance documentaire

Toute évolution qui change la responsabilité, un contrat public, un format de sortie, une limite de sécurité ou un identifiant compatible doit être reflétée dans le dépôt lui-même **et** dans la documentation canonique `Fireviewer_doc`. Une refonte documentaire ne doit pas être présentée comme une nouvelle preuve fonctionnelle.

## Références et portée

[Source du composant](https://github.com/fireviewer/fireviewer-vision-runtime) · [Organisation](../ORGANISATION.md) · [Statuts](../STATUTS_ET_VOCABULAIRE.md) · [Limites de réception](../STATUS.md).

Synthèse du pack documentaire du 19 septembre 2026, confrontée au README et à la visibilité du dépôt à cette date. Les commandes ci-dessus sont des procédures de reprise, pas des tests réexécutés lors de cette revue. Les versions mentionnées restent celles des sources consultées.
