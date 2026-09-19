# fireviewer/fireviewer-fire-state

**Visibilité :** public
**Catégorie :** Cœur
**URL :** https://github.com/fireviewer/fireviewer-fire-state

## Rôle

Calcul déterministe Part.4, profils de fusion, calibration et évaluation.

## État documenté au 19 septembre 2026

Actif — package v0.1.2. La baseline Part.4 documentée reste non calibrée pour publication autonome.

## Entrées

Contexte spatial validé, observations géoréférencées admissibles, état précédent et provenance.

## Sorties

États `affected`, `active`, `observable`, incertitude et produits probabilistes/provenance retournés au backend.

## Dépendances / interfaces

contracts; contexte fourni par le backend.

## Vérification et reprise

Installation + `python -m pytest tests -q`; API centrale `fuse_daily_fire_state`.

## Limites à conserver dans toute présentation

Ne crée pas ses propres transactions métier. Interpolation seule ne doit pas créer de nouvelle surface brûlée; un calcul n’est pas une observation.

## Règle de maintenance documentaire

Toute évolution qui change la responsabilité, un contrat public, un format de sortie, une limite de sécurité ou un identifiant compatible doit être reflétée dans le dépôt lui-même **et** dans la documentation canonique `Fireviewer_doc`. Une refonte documentaire ne doit pas être présentée comme une nouvelle preuve fonctionnelle.

## Références et portée

[Source du composant](https://github.com/fireviewer/fireviewer-fire-state) · [Organisation](../ORGANISATION.md) · [Statuts](../STATUTS_ET_VOCABULAIRE.md) · [Limites de réception](../STATUS.md).

Synthèse du pack documentaire du 19 septembre 2026, confrontée au README et à la visibilité du dépôt à cette date. Les commandes ci-dessus sont des procédures de reprise, pas des tests réexécutés lors de cette revue. Les versions mentionnées restent celles des sources consultées.
