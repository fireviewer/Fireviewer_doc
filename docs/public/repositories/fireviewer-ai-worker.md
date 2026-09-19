# fireviewer/fireviewer-ai-worker

**Visibilité :** privé
**Catégorie :** Transition
**URL :** https://github.com/fireviewer/fireviewer-ai-worker

## Rôle

Couche de compatibilité pour l’ancien namespace `firewarning_worker` et commandes historiques encore consommées.

## État documenté au 19 septembre 2026

Actif mais transitoire. Aucun nouvel algorithme canonique ne doit y être ajouté.

## Entrées

Anciennes interfaces et consommateurs.

## Sorties

Imports/CLI compatibles qui délèguent aux packages canoniques.

## Dépendances / interfaces

contracts, ingestion, vision, geolocation, supervisor, orchestrator, fire-state, model-lab.

## Vérification et reprise

`python tools/ci.py verify` avec dépendances privées versionnées.

## Limites à conserver dans toute présentation

Retirer uniquement après inventaire/migration des consommateurs, remplacement versionné et préservation de la provenance. Ne pas réactiver l’architecture monolithique.

## Règle de maintenance documentaire

Toute évolution qui change la responsabilité, un contrat public, un format de sortie, une limite de sécurité ou un identifiant compatible doit être reflétée dans le dépôt lui-même **et** dans la documentation canonique `Fireviewer_doc`. Une refonte documentaire ne doit pas être présentée comme une nouvelle preuve fonctionnelle.

## Références et portée

[Source du composant](https://github.com/fireviewer/fireviewer-ai-worker) · [Organisation](../ORGANISATION.md) · [Statuts](../STATUTS_ET_VOCABULAIRE.md) · [Limites de réception](../STATUS.md).

Synthèse du pack documentaire du 19 septembre 2026, confrontée au README et à la visibilité du dépôt à cette date. Les commandes ci-dessus sont des procédures de reprise, pas des tests réexécutés lors de cette revue. Les versions mentionnées restent celles des sources consultées.
