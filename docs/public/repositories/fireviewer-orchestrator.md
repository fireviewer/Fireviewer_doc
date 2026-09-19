# fireviewer/fireviewer-orchestrator

**Visibilité :** privé
**Catégorie :** Cœur
**URL :** https://github.com/fireviewer/fireviewer-orchestrator

## Rôle

Coordination stateless de l’exécution des stades sur un état durable possédé par le backend.

## État documenté au 19 septembre 2026

Actif — package v0.1.1.

## Entrées

Jobs et contexte backend, disponibilité des providers/composants.

## Sorties

Dispatch, retries, receipts et appels aux composants.

## Dépendances / interfaces

backend, contracts et composants de domaine.

## Vérification et reprise

Installation + tests. `fireviewer-orchestrator` exige un provider runtime configuré et ne doit pas être lancé juste pour vérifier l’installation.

## Limites à conserver dans toute présentation

Ne pas créer une deuxième base de vérité, ni dupliquer Part.4, ni ajouter un agent permanent sans besoin démontré.

## Règle de maintenance documentaire

Toute évolution qui change la responsabilité, un contrat public, un format de sortie, une limite de sécurité ou un identifiant compatible doit être reflétée dans le dépôt lui-même **et** dans la documentation canonique `Fireviewer_doc`. Une refonte documentaire ne doit pas être présentée comme une nouvelle preuve fonctionnelle.

## Références et portée

[Source du composant](https://github.com/fireviewer/fireviewer-orchestrator) · [Organisation](../ORGANISATION.md) · [Statuts](../STATUTS_ET_VOCABULAIRE.md) · [Limites de réception](../STATUS.md).

Synthèse du pack documentaire du 19 septembre 2026, confrontée au README et à la visibilité du dépôt à cette date. Les commandes ci-dessus sont des procédures de reprise, pas des tests réexécutés lors de cette revue. Les versions mentionnées restent celles des sources consultées.
