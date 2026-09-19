# fireviewer/fireviewer-frontend

**Visibilité :** privé
**Catégorie :** Cœur
**URL :** https://github.com/fireviewer/fireviewer-frontend

## Rôle

Application navigateur pour atlas public, contribution, revue, administration, chronologie et exploration 2D/3D.

## État documenté au 19 septembre 2026

Actif. Le viewer publié et les cartes existantes sont à préserver; certains parcours Part.4 avancés restent non acceptés de bout en bout.

## Entrées

APIs backend, manifests incidents, packages cartographiques versionnés.

## Sorties

Interfaces publiques et internes, vues 2D/3D, contributions et review.

## Dépendances / interfaces

backend, packages géographiques HF; bibliothèques React/TS/Vite/OpenLayers/Three.js/Giro3D.

## Vérification et reprise

`npm ci`, `npm run check`, `npm test`, `npm run build`, puis `npm run test:e2e` avec services/tests requis.

## Limites à conserver dans toute présentation

Le navigateur n’infère pas une coordonnée autoritative depuis une image. Un build réussi ne prouve ni auth, stockage cloud, API réelle ni publication de bout en bout.

## Règle de maintenance documentaire

Toute évolution qui change la responsabilité, un contrat public, un format de sortie, une limite de sécurité ou un identifiant compatible doit être reflétée dans le dépôt lui-même **et** dans la documentation canonique `Fireviewer_doc`. Une refonte documentaire ne doit pas être présentée comme une nouvelle preuve fonctionnelle.

## Références et portée

[Source du composant](https://github.com/fireviewer/fireviewer-frontend) · [Organisation](../ORGANISATION.md) · [Statuts](../STATUTS_ET_VOCABULAIRE.md) · [Limites de réception](../STATUS.md).

Synthèse du pack documentaire du 19 septembre 2026, confrontée au README et à la visibilité du dépôt à cette date. Les commandes ci-dessus sont des procédures de reprise, pas des tests réexécutés lors de cette revue. Les versions mentionnées restent celles des sources consultées.
