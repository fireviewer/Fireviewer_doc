# fireviewer/fireviewer-association-site

**Visibilité :** privé
**Catégorie :** Institutionnel
**URL :** https://github.com/fireviewer/fireviewer-association-site

## Rôle

Source du site institutionnel `fire-viewer.fr`, distinct du viewer/administration des incidents.

## État documenté au 19 septembre 2026

Actif. Déploiement Vercel séparé de la construction locale.

## Entrées

Contenus institutionnels, présentation de l’association.

## Sorties

Site public de l’association.

## Dépendances / interfaces

Node 24 / Next.js / lockfile; projet Vercel externe au Git.

## Vérification et reprise

`npm ci`, `npm run build`, `npm start`; recette avant promotion.

## Limites à conserver dans toute présentation

Ne pas y déplacer la logique du viewer ou du pipeline incendie. Aucun secret, corpus ou poids modèle dans Git.

## Règle de maintenance documentaire

Toute évolution qui change la responsabilité, un contrat public, un format de sortie, une limite de sécurité ou un identifiant compatible doit être reflétée dans le dépôt lui-même **et** dans la documentation canonique `Fireviewer_doc`. Une refonte documentaire ne doit pas être présentée comme une nouvelle preuve fonctionnelle.

## Références et portée

[Source du composant](https://github.com/fireviewer/fireviewer-association-site) · [Organisation](../ORGANISATION.md) · [Statuts](../STATUTS_ET_VOCABULAIRE.md) · [Limites de réception](../STATUS.md).

Synthèse du pack documentaire du 19 septembre 2026, confrontée au README et à la visibilité du dépôt à cette date. Les commandes ci-dessus sont des procédures de reprise, pas des tests réexécutés lors de cette revue. Les versions mentionnées restent celles des sources consultées.
