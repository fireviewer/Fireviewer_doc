# fireviewer/FIRE-VIEWER-gestion-android

**Visibilité :** privé
**Catégorie :** Auxiliaire association
**URL :** https://github.com/fireviewer/FIRE-VIEWER-gestion-android

## Rôle

Application Android native pour tâches, finances, remboursements, budget, services, financements, partenariats, documents, échéances et décisions.

## État documenté au 19 septembre 2026

Actif comme outil de gestion associative. README courant mentionne correctif 1.2.1; certaines fonctions récentes restent à valider sur appareil.

## Entrées

Données du backend de coordination existant et saisies locales.

## Sorties

Interface mobile, file offline, synchronisation, gestion documentaire et associative.

## Dépendances / interfaces

Backend de coordination existant; Android SDK, Gradle/Kotlin; aucun nouveau serveur métier.

## Vérification et reprise

`./gradlew :app:testDebugUnitTest :app:lintDebug :app:assembleDebug --no-daemon` dans l’environnement Android documenté.

## Limites à conserver dans toute présentation

Ne fait pas partie du pipeline atlas/incendie. Une validation automatisée ne remplace pas la recette sur téléphone physique.

## Règle de maintenance documentaire

Toute évolution qui change la responsabilité, un contrat public, un format de sortie, une limite de sécurité ou un identifiant compatible doit être reflétée dans le dépôt lui-même **et** dans la documentation canonique `Fireviewer_doc`. Une refonte documentaire ne doit pas être présentée comme une nouvelle preuve fonctionnelle.

## Références et portée

[Source du composant](https://github.com/fireviewer/FIRE-VIEWER-gestion-android) · [Organisation](../ORGANISATION.md) · [Statuts](../STATUTS_ET_VOCABULAIRE.md) · [Limites de réception](../STATUS.md).

Synthèse du pack documentaire du 19 septembre 2026, confrontée au README et à la visibilité du dépôt à cette date. Les commandes ci-dessus sont des procédures de reprise, pas des tests réexécutés lors de cette revue. Les versions mentionnées restent celles des sources consultées.
