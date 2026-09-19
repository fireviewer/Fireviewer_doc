# fireviewer/fireviewer-geolocation

**Visibilité :** public
**Catégorie :** Cœur
**URL :** https://github.com/fireviewer/fireviewer-geolocation

## Rôle

Production d’hypothèses géographiques par retrieval, perspective, registration, Panoramax et autres références.

## État documenté au 19 septembre 2026

Actif — package v0.1.1.

## Entrées

Observations visuelles, position/caméra si disponible, terrain, orthophoto, références géographiques.

## Sorties

Candidats géographiques, transformations, confiance/incertitude et preuves associées.

## Dépendances / interfaces

contracts, sources cartographiques, modèles de retrieval/registration selon configuration.

## Vérification et reprise

Installation + tests; commande `fireviewer-geolocation` avec ressources explicitement préparées.

## Limites à conserver dans toute présentation

Toujours fournir un niveau de confiance ou s’abstenir. Ne pas inventer une précision absente des données. Position caméra et position du phénomène sont distinctes.

## Règle de maintenance documentaire

Toute évolution qui change la responsabilité, un contrat public, un format de sortie, une limite de sécurité ou un identifiant compatible doit être reflétée dans le dépôt lui-même **et** dans la documentation canonique `Fireviewer_doc`. Une refonte documentaire ne doit pas être présentée comme une nouvelle preuve fonctionnelle.

## Références et portée

[Source du composant](https://github.com/fireviewer/fireviewer-geolocation) · [Organisation](../ORGANISATION.md) · [Statuts](../STATUTS_ET_VOCABULAIRE.md) · [Limites de réception](../STATUS.md).

Synthèse du pack documentaire du 19 septembre 2026, confrontée au README et à la visibilité du dépôt à cette date. Les commandes ci-dessus sont des procédures de reprise, pas des tests réexécutés lors de cette revue. Les versions mentionnées restent celles des sources consultées.
