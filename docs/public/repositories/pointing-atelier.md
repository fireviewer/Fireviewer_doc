# fireviewer/pointing-atelier

**Visibilité :** privé
**Catégorie :** Auxiliaire dataset
**URL :** https://github.com/fireviewer/pointing-atelier

## Rôle

Atelier Android et pipeline de préparation du corpus pointing/detection avec stockage des données sur Hugging Face.

## État documenté au 19 septembre 2026

Préparation automatique en pause à la demande de l’utilisateur; parcours actif = annotation manuelle Android et synchronisation par lots.

## Entrées

Lots d’images contrôlées, modèles LiteRT/preannotation selon configuration, corrections humaines.

## Sorties

Annotations, lots validés, manifestes et commits Hugging Face vérifiés.

## Dépendances / interfaces

Hugging Face, app Android, stockage temporaire; modèles non embarqués durablement.

## Vérification et reprise

Commandes `doctor` / `status`; validation Android et publication HF doivent être contrôlées séparément.

## Limites à conserver dans toute présentation

Les anciennes instructions NVIDIA/API sont historiques et ne doivent pas être reprises comme architecture actuelle. Ne pas considérer l’objectif 250k comme déjà atteint.

## Règle de maintenance documentaire

Toute évolution qui change la responsabilité, un contrat public, un format de sortie, une limite de sécurité ou un identifiant compatible doit être reflétée dans le dépôt lui-même **et** dans la documentation canonique `Fireviewer_doc`. Une refonte documentaire ne doit pas être présentée comme une nouvelle preuve fonctionnelle.

## Références et portée

[Source du composant](https://github.com/fireviewer/pointing-atelier) · [Organisation](../ORGANISATION.md) · [Statuts](../STATUTS_ET_VOCABULAIRE.md) · [Limites de réception](../STATUS.md).

Synthèse du pack documentaire du 19 septembre 2026, confrontée au README et à la visibilité du dépôt à cette date. Les commandes ci-dessus sont des procédures de reprise, pas des tests réexécutés lors de cette revue. Les versions mentionnées restent celles des sources consultées.
