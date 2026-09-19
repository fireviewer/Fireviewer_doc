# fireviewer/fireviewer-evidence-ingestion

**Visibilité :** privé
**Catégorie :** Cœur
**URL :** https://github.com/fireviewer/fireviewer-evidence-ingestion

## Rôle

Acquisition et normalisation bornées des sources, médias, transcription et observations satellite.

## État documenté au 19 septembre 2026

Actif — package v0.1.1.

## Entrées

Sources autorisées/officielles/publiques et credentials fournisseurs configurés explicitement.

## Sorties

Évidences normalisées et métadonnées de provenance exploitables par le backend/pipeline.

## Dépendances / interfaces

contracts; fournisseurs externes; stockage contrôlé.

## Vérification et reprise

Installation du wheel puis `python -m pytest tests -q`; commande `fireviewer-ingestion` pour usages configurés.

## Limites à conserver dans toute présentation

Ne pas aspirer sans limite ni transformer le dépôt en archive brute de médias. Droits, hash, temps et résultat d’acquisition doivent rester traçables.

## Règle de maintenance documentaire

Toute évolution qui change la responsabilité, un contrat public, un format de sortie, une limite de sécurité ou un identifiant compatible doit être reflétée dans le dépôt lui-même **et** dans la documentation canonique `Fireviewer_doc`. Une refonte documentaire ne doit pas être présentée comme une nouvelle preuve fonctionnelle.

## Références et portée

[Source du composant](https://github.com/fireviewer/fireviewer-evidence-ingestion) · [Organisation](../ORGANISATION.md) · [Statuts](../STATUTS_ET_VOCABULAIRE.md) · [Limites de réception](../STATUS.md).

Synthèse du pack documentaire du 19 septembre 2026, confrontée au README et à la visibilité du dépôt à cette date. Les commandes ci-dessus sont des procédures de reprise, pas des tests réexécutés lors de cette revue. Les versions mentionnées restent celles des sources consultées.
