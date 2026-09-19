# fireviewer/fireviewer-evidence-supervisor

**Visibilité :** privé
**Catégorie :** Cœur
**URL :** https://github.com/fireviewer/fireviewer-evidence-supervisor

## Rôle

Évaluation structurée des preuves, contradictions et décisions `accept`, `reject`, `abstain`; héberge Eve.

## État documenté au 19 septembre 2026

Actif — package v0.1.1.

## Entrées

Bundles de preuves et hypothèses référencées.

## Sorties

Assessment structuré, support/contradiction/abstention sans mutation silencieuse des sources.

## Dépendances / interfaces

contracts; composants amont; éventuellement modèle Eve selon configuration.

## Vérification et reprise

Tests Python; build Eve séparé dans `apps/eve` avec Node. Une compilation ne lance pas le modèle.

## Limites à conserver dans toute présentation

Le superviseur ne devient pas une autorité de publication et ne corrige pas des coordonnées par intuition. Les cas sensibles gardent validation humaine.

## Règle de maintenance documentaire

Toute évolution qui change la responsabilité, un contrat public, un format de sortie, une limite de sécurité ou un identifiant compatible doit être reflétée dans le dépôt lui-même **et** dans la documentation canonique `Fireviewer_doc`. Une refonte documentaire ne doit pas être présentée comme une nouvelle preuve fonctionnelle.

## Références et portée

[Source du composant](https://github.com/fireviewer/fireviewer-evidence-supervisor) · [Organisation](../ORGANISATION.md) · [Statuts](../STATUTS_ET_VOCABULAIRE.md) · [Limites de réception](../STATUS.md).

Synthèse du pack documentaire du 19 septembre 2026, confrontée au README et à la visibilité du dépôt à cette date. Les commandes ci-dessus sont des procédures de reprise, pas des tests réexécutés lors de cette revue. Les versions mentionnées restent celles des sources consultées.
