# Ouverture progressive du code source FireViewer

**Premier lot : 19 septembre 2026 — huit composants.**

Le mainteneur a autorisé l’ouverture publique des huit dépôts ci-dessous. Le profil GitHub et `Fireviewer_doc` étaient déjà publics. L’organisation compte donc dix dépôts publics et huit dépôts privés après ce premier lot.

| Dépôt public | Responsabilité |
| --- | --- |
| [fireviewer-contracts](https://github.com/fireviewer/fireviewer-contracts) | Contrats, schémas et géométrie partagés |
| [fireviewer-evidence-ingestion](https://github.com/fireviewer/fireviewer-evidence-ingestion) | Collecte et normalisation des sources autorisées |
| [fireviewer-vision-runtime](https://github.com/fireviewer/fireviewer-vision-runtime) | Inférence spécialisée et observations en espace image |
| [fireviewer-geolocation](https://github.com/fireviewer/fireviewer-geolocation) | Hypothèses géographiques et recalage |
| [fireviewer-evidence-supervisor](https://github.com/fireviewer/fireviewer-evidence-supervisor) | Recoupement, contradictions et abstention |
| [fireviewer-orchestrator](https://github.com/fireviewer/fireviewer-orchestrator) | Exécution, reprises et idempotence |
| [fireviewer-fire-state](https://github.com/fireviewer/fireviewer-fire-state) | Calculs Fire State / Part.4 |
| [fireviewer-model-lab](https://github.com/fireviewer/fireviewer-model-lab) | Recettes, préparation de corpus, benchmarks et registre |

## Périmètre conservé privé

- `fireviewer-frontend` et `fireviewer-association-site` : sites et interfaces applicatives.
- `fireviewer-backend` : service métier et persistance des incidents.
- `pointing-atelier` et `FIRE-VIEWER-gestion-android` : applications Android.
- `fireviewer-docker` : infrastructure et exploitation.
- `fireviewer-ai-worker` : compatibilité transitoire.
- `fireviewer-unreal` : chantier distinct conservé privé à cette étape.

Le Map Builder générique `unicornwhodev/map-builder` reste un dépôt UWD externe, hors de ce lot. La visibilité des ressources Hugging Face reste régie par chaque ressource ; cette ouverture GitHub ne rend aucun corpus privé public.

## Licences, provenance et compatibilité

Les huit composants conservent leur licence de code originale AGPL-3.0-or-later, leur licence documentaire CC BY 4.0 et les notices particulières. Les droits des modèles, données, fournisseurs et autres dépendances restent distincts. L’ouverture du dépôt n’établit pas une cession des actifs antérieurs à l’association.

Les tags, releases, identifiants, contrats et hashes des artefacts existants gardent leur sens historique. Les mentions anciennes de dépôt privé décrivent l’état de leur date. Les reçus et documents historiques ne sont pas réécrits pour inventer une réception ou une cession.

## Portée de la préparation

La préparation comprend une revue des fichiers et de l’historique accessible, des références de pull requests et des éléments GitHub associés qui deviennent visibles. Les alertes du contrôle automatique doivent être interprétées ; aucun scan ne garantit l’absence absolue de secret ou de vulnérabilité.

Une ouverture du code n’est ni un déploiement, ni une campagne d’évaluation, ni une qualification des modèles ou des parcours applicatifs. FireViewer reste un MVP de recherche et les résultats IA sensibles conservent leur validation humaine.

[Organisation](ORGANISATION.md) · [Dépôts](REPOSITORIES.md) · [Statut](STATUS.md) · [Licences](../LICENSING.md).
