# ADR-0001 — Architecture centrée sur les événements documentés

**Statut de décision :** accepté comme architecture cible

**Statut d’implémentation :** partiel, derrière des feature flags

**Date de dernière vérification locale :** 2026-08-03

## Lecture des statuts

| Statut | Signification |
| --- | --- |
| `IMPLEMENTED_TESTED_LOCAL` | Le code existe et des tests ciblés ont réussi localement. Cela ne prouve ni déploiement, ni service externe, ni précision terrain. |
| `IMPLEMENTED_NOT_LIVE_VERIFIED` | Le code existe, mais la dépendance réelle, la migration ou le parcours déployé n’a pas été exercé. |
| `PENDING` | Le contrat est défini, mais l’implémentation runtime complète n’existe pas encore. |

## État observé

| Composant | Statut | Preuve et limite |
| --- | --- | --- |
| Schéma événementiel additif et migration Alembic | `IMPLEMENTED_NOT_LIVE_VERIFIED` | Modèles et migration présents ; DDL PostgreSQL compilé et tests de dérive réussis. Aucune migration réelle sur Neon/PostGIS ni restauration n’a été exécutée. |
| API de contribution v2 | `IMPLEMENTED_TESTED_LOCAL` | Admission, message seul, multi-médias, finalisation, idempotence et lecture propriétaire sont couverts par les tests backend ciblés. Aucun Blob, ClamAV ou Supabase réel n’a été sollicité. |
| Dispatcher événementiel persistant | `IMPLEMENTED_TESTED_LOCAL` | Un `EventAnalysisJob` unique est créé avec le candidat ; leases, soumission distante, polling borné, abstention et échec ambigu sont testés avec doubles locaux. Aucun RunPod réel n’a été appelé. |
| Worker IA `event-2.0` | `IMPLEMENTED_TESTED_LOCAL` | Le contrat, les profils de vue, secteurs, abstentions, propositions et garde cross-view shadow sont testés localement. Aucune recette GPU ou précision terrain n’est prouvée. |
| Authentification Supabase et rôles | `IMPLEMENTED_NOT_LIVE_VERIFIED` | Client navigateur, vérification JWKS, rôle depuis `app_metadata`, contrôle actif `/auth/v1/user` et jeton récent sont implémentés et testés avec doubles. Aucun projet Supabase réel n’a été validé. |
| Formulaire événementiel et suivi contributeur | `IMPLEMENTED_TESTED_LOCAL` | Parcours mono-page, upload, reçu et `review_message` existent derrière les flags frontend. Pas de recette navigateur contre un backend déployé. |
| Revue analyste/éditeur | `IMPLEMENTED_TESTED_LOCAL` | API privée, lecture des preuves propres, rattachement incident, demande de preuve, contradiction, validation, rejet, publication et rétractation sont couverts localement. La correction spatiale avancée et le remplacement éditorial restent incomplets. |
| Registre externe et planification | `IMPLEMENTED_TESTED_LOCAL` | Fournisseurs, collections, révisions immuables, filiation, déduplication par famille, watermarks, leases et backoff sont testés localement. Cela ne constitue pas une collecte fournisseur. |
| Collecte IGN, Météo-France, EUMETSAT, EFFIS, FIRMS et CEMS | `IMPLEMENTED_NOT_LIVE_VERIFIED` pour CDSE STAC, IGN WFS et Météo-France SYNOP ; `PENDING` pour le reste | Trois adaptateurs, un cron privé, une CLI et un bootstrap existent. Les licences finales par collection, secrets runtime, quotas, déclenchement hébergé et tests réseau live restent à valider. |
| Timeline publique v2 | `IMPLEMENTED_TESTED_LOCAL` | L’endpoint lit uniquement les snapshots non rétractés, revérifie leur hash, canonise les géométries et exclut les données privées. Le frontend projette localement ce contrat dans le texte, la 3D et la 2D avec un instant commun et un fallback legacy. |
| Enveloppes, progression et projection publique 3D/2D | `PENDING` | Les tables existent, mais la génération calibrée, le replay public complet et la consommation unifiée 3D/2D ne sont pas livrés de bout en bout. |
| Nettoyage des preuves temporaires | `IMPLEMENTED_TESTED_LOCAL` | Seuls les uploads expirés jamais rattachés sont supprimés, avec compte rendu audité ; les preuves durables rattachées sont exclues. Aucun Blob de production n’a été nettoyé. |

## Contexte

Le flux historique organise principalement des médias, observations, faits et propositions spatiales séparés. Il ne représente pas directement le besoin produit : documenter l’évolution d’un incendie à partir d’événements situés dans le temps, observés depuis un point de prise de vue connu et soutenus par un message ou des preuves.

Une image isolée n’est pas un événement. Un point de prise de vue n’est pas un point de feu. Une surface brûlée n’est pas une zone active. Une prévision ou une simulation n’est pas une observation.

## Décision

Le cœur métier devient le `FireActivityEvent`. Une contribution crée d’abord un `EventCandidate` privé composé de :

- un incident existant ou un `IncidentCandidate` privé ;
- un `Viewpoint` placé ou confirmé par l’utilisateur ;
- un instant ou un intervalle d’observation ;
- un message et/ou des images ou vidéos finalisées ;
- les consentements nécessaires ;
- une clé d’idempotence ;
- un `EventAnalysisJob` persistant et unique.

Le point placé par l’utilisateur représente exclusivement la position de l’observateur ou de la caméra. Une géométrie d’activité provient d’une `LocalizationAttempt`, puis d’une décision humaine. L’envoi ne déclenche jamais directement une publication.

## Flux implémenté derrière flags

```text
Viewpoint + temps + message/preuves
→ EventCandidate privé + job persistant
→ worker event-2.0
→ localisation, secteur, abstention ou échec
→ LocalizationAttempt privée
→ FireActivityEvent DRAFT éventuel
→ revue analyste
→ validation ou rejet
→ publication éditeur explicite
→ PublicationSnapshot versionné et hashé
```

La timeline publique et sa projection locale d’événements en texte, 3D et 2D font partie du flux vérifié. La recette déployée, les couches d’enveloppe et de surface brûlée, le LOD avancé et la progression restent hors de cette preuve.

## Profils de vue

Le contrat cible comprend :

- `ground_wide_known_viewpoint` ;
- `ground_wide_named_viewpoint` ;
- `ground_distant_known_viewpoint` ;
- `ground_close_known_viewpoint` ;
- `ground_tight_known_viewpoint`.

Le worker local normalise les profils compatibles. Une vue large ou éloignée utilise les ancrages, la pose, le terrain et des observations indépendantes lorsqu’ils existent. Une vue proche utilise le viewpoint comme prior fort, mais requiert encore une direction, une portée ou des indices géométriques suffisants. Sans géométrie défendable, la sortie est un secteur non publiable ou une abstention.

## Revue et autorité

- le worker produit uniquement des éléments privés ;
- l’analyste peut rattacher un incident, demander une preuve, marquer une contradiction, valider ou rejeter ;
- l’éditeur peut publier uniquement un événement déjà validé ;
- la publication requiert le flag dédié, un rôle courant et une session récente ;
- une preuve contributeur sans consentement `public_derivative` bloque la publication ;
- le `PublicationSnapshot` ne contient pas le viewpoint exact ;
- la rétractation éditoriale est disponible ; les corrections, remplacements, restaurations et fusions complexes restent à compléter avant bascule publique.

## Sources externes

Les produits Sentinel, Copernicus, EFFIS, FIRMS, Météo-France, IGN, BDIFF et les communications officielles peuvent soutenir ou contredire un événement. Leur rôle dépend du produit, pas seulement de l’organisme.

Le registre implémenté sépare les rôles `raw_earth_observation`, `sensor_detection`, `interpreted_observation`, `official_incident_statement`, `weather_observation`, `weather_forecast`, `geospatial_reference`, `historical_registry` et `simulation`. Deux produits issus du même granule ou de la même famille de preuve ne constituent pas deux corroborations indépendantes.

Le registre, le cron privé, la CLI et le bootstrap ne prouvent pas une collecte live. L’état exact des adaptateurs et de leurs validations est maintenu dans [`../EXTERNAL_SOURCE_CONNECTORS.md`](../EXTERNAL_SOURCE_CONNECTORS.md).

## Périmètre et progression

Un événement unique ne produit pas un périmètre. Une `ActivityEnvelopeRevision` doit être soutenue par des relations persistantes vers plusieurs événements ou portions de front compatibles dans une fenêtre temporelle explicite.

La progression décrit des deltas entre états observés. Elle ne remplit pas les périodes non documentées et ne prédit pas un déplacement futur. La génération et la calibration de ces objets restent `PENDING`.

## Confidentialité

Le viewpoint exact reste privé. Les routes contributeur ne renvoient qu’une synthèse sans longitude ni latitude. Les routes internes exigent un rôle élevé courant et répondent sans cache. Une publication peut exposer une géométrie d’activité revue, jamais le viewpoint exact par simple propagation de données.

## Migration

La migration est additive : les contrats historiques restent lisibles, aucun backfill ne fabrique un événement et les routes v2 sont désactivées par défaut. La migration PostgreSQL ajoute des colonnes géométriques PostGIS synchronisées, des index GiST et des protections d’immutabilité pour le registre externe comme pour le payload des snapshots publics. Ces opérations restent à vérifier sur une copie Neon/PostGIS réelle avant activation.

## Conséquences

### Positives

- l’objet public devient temporel, spatial et auditable ;
- les médias redeviennent des preuves facultatives ;
- les abstentions conservent une valeur documentaire ;
- analyste et éditeur possèdent des transitions distinctes ;
- les sources externes sont versionnées sans double corroboration implicite.

### Contraintes

- aucune activation production sans migration, sauvegarde et restauration testées ;
- aucun connecteur déclaré opérationnel sans test live et licence validée ;
- aucune enveloppe publiée sans supports normalisés et calibration ;
- aucun nouveau train long avant benchmark événementiel par incident ;
- aucune précision terrain déduite des tests unitaires.

## Alternatives rejetées

- conserver le média comme objet métier principal ;
- demander à l’utilisateur de placer le feu sur la carte ;
- publier automatiquement une sortie d’agent ou un produit officiel ;
- transformer une surface annoncée sans géométrie en polygone ;
- fusionner observations, prévisions et simulations dans une même couche ;
- traiter un hotspot isolé comme créateur automatique d’incident.

## Références normatives

- [`../contracts/EVENT_API_V2.md`](../contracts/EVENT_API_V2.md)
- [`../contracts/EVENT_AND_PROVENANCE_V2.md`](../contracts/EVENT_AND_PROVENANCE_V2.md)
- [`../EXTERNAL_SOURCE_CONNECTORS.md`](../EXTERNAL_SOURCE_CONNECTORS.md)
- [`../MIGRATION_AND_FEATURE_FLAGS.md`](../MIGRATION_AND_FEATURE_FLAGS.md)
- [`../SECURITY_PRIVACY_EVENT_PIPELINE.md`](../SECURITY_PRIVACY_EVENT_PIPELINE.md)
- [`../ACCEPTANCE_AND_REPLAY_MATRIX.md`](../ACCEPTANCE_AND_REPLAY_MATRIX.md)
