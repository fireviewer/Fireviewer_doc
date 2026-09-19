# fireviewer/fireviewer-backend

**Visibilité :** privé
**Catégorie :** Cœur
**URL :** https://github.com/fireviewer/fireviewer-backend

## Rôle

Autorité incident-centred pour preuves durables, jobs, permissions, review, audit, révisions et publication.

## État documenté au 19 septembre 2026

Actif. Backend FastAPI + SQLAlchemy/Alembic. Part.4 calculé par fire-state, pas ici.

## Entrées

Contributions, preuves normalisées, résultats de composants, packages géographiques acceptés.

## Sorties

État durable des incidents, décisions, revisions, manifests publics, jobs et publication contrôlée.

## Dépendances / interfaces

contracts, orchestrator, fire-state, composants d’évidence; Map Builder UWD comme producteur externe.

## Vérification et reprise

`python tools/ci.py verify` dans l’environnement documenté (Python 3.13 / uv / Node / accès dépendances privées).

## Limites à conserver dans toute présentation

Un worker/modèle ne publie jamais directement. Le profil Part.4 documenté reste non calibré; APIs présentes ≠ parcours frontend complet accepté.

## Règle de maintenance documentaire

Toute évolution qui change la responsabilité, un contrat public, un format de sortie, une limite de sécurité ou un identifiant compatible doit être reflétée dans le dépôt lui-même **et** dans la documentation canonique `Fireviewer_doc`. Une refonte documentaire ne doit pas être présentée comme une nouvelle preuve fonctionnelle.

## Références et portée

[Source du composant](https://github.com/fireviewer/fireviewer-backend) · [Organisation](../ORGANISATION.md) · [Statuts](../STATUTS_ET_VOCABULAIRE.md) · [Limites de réception](../STATUS.md).

Synthèse du pack documentaire du 19 septembre 2026, confrontée au README et à la visibilité du dépôt à cette date. Les commandes ci-dessus sont des procédures de reprise, pas des tests réexécutés lors de cette revue. Les versions mentionnées restent celles des sources consultées.
