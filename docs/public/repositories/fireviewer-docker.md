# fireviewer/fireviewer-docker

**Visibilité :** privé
**Catégorie :** Infrastructure
**URL :** https://github.com/fireviewer/fireviewer-docker

## Rôle

Verrous d’images/versions, composition de services, recettes de reconstruction et preuves opérationnelles privées.

## État documenté au 19 septembre 2026

Actif. Le README du 9 septembre documente backend, frontend Vercel et producteur UWD avec des versions reçues à cette date.

## Entrées

Images privées, locks, bundles de reconstruction et configuration locale/prod séparée.

## Sorties

Composition reproductible, digests, procédures locales, backups et receipts.

## Dépendances / interfaces

GHCR privé, Docker Compose, composants FireViewer et UWD.

## Vérification et reprise

Utiliser les procédures du dépôt et `VALIDATION.md`; vérifier digests/locks et health. Les preuves historiques ne sont pas des locks actuels.

## Limites à conserver dans toute présentation

Ne pas recopier endpoints, secrets, tokens ou reçus privés dans la documentation publique. Une composition locale n’est pas une migration prod.

## Règle de maintenance documentaire

Toute évolution qui change la responsabilité, un contrat public, un format de sortie, une limite de sécurité ou un identifiant compatible doit être reflétée dans le dépôt lui-même **et** dans la documentation canonique `Fireviewer_doc`. Une refonte documentaire ne doit pas être présentée comme une nouvelle preuve fonctionnelle.

## Références et portée

[Source du composant](https://github.com/fireviewer/fireviewer-docker) · [Organisation](../ORGANISATION.md) · [Statuts](../STATUTS_ET_VOCABULAIRE.md) · [Limites de réception](../STATUS.md).

Synthèse du pack documentaire du 19 septembre 2026, confrontée au README et à la visibilité du dépôt à cette date. Les commandes ci-dessus sont des procédures de reprise, pas des tests réexécutés lors de cette revue. Les versions mentionnées restent celles des sources consultées.
