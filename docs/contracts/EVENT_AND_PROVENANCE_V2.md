# Contrat — événement, temporalité et provenance v2

**Schéma et services locaux :** `IMPLEMENTED_TESTED_LOCAL`

**Migration Neon/PostGIS réelle :** `IMPLEMENTED_NOT_LIVE_VERIFIED`

**Collecte fournisseur live et validation de la projection publique déployée :** `PENDING`

Ce document distingue les objets effectivement présents du comportement cible. La migration additive, les services et leurs règles locales sont testés ; aucune exécution sur la base applicative réelle ni collecte externe live n’est déduite de ces tests.

## Entités présentes

### `IncidentCandidate`

Dossier privé créé lorsque la contribution n’est pas rattachée à un incident existant. Son origine est `CONTRIBUTION` ou `OFFICIAL_STATEMENT`. Une origine officielle exige une révision d’artefact source. Les états sont `PRIVATE_MATCHING`, `CONFIRMED`, `MERGED` et `REJECTED`.

Le worker peut proposer la création d’un candidat uniquement à partir d’une déclaration officielle structurée. Un hotspot isolé ne crée jamais un incident.

### `EventCandidate`

Contribution privée versionnée. Elle référence exactement un incident existant ou un `IncidentCandidate`, un `Viewpoint`, un intervalle, un message et/ou des preuves. Elle conserve clé d’idempotence, hash de requête, historique d’état, message de revue et contexte privé.

### `EventAnalysisJob`

Job durable unique par candidat. Il conserve état, lease, identifiant distant, tentatives, échéance de polling, hash et synthèse de résultat. La clôture est `COMPLETED`, `ABSTAINED` ou `FAILED`.

### `Viewpoint`

Position privée de l’observateur ou de la caméra, distincte de toute activité incendie. Elle conserve longitude, latitude, précision horizontale, altitude, label, yaw, FOV, origine et consentement éventuel à un dérivé public.

Dans PostgreSQL, la migration crée `point_geom geometry(Point, 4326)` avec index GiST et trigger de synchronisation. Cette partie n’a pas encore été exécutée sur Neon/PostGIS réel.

### `EvidenceAsset`

Image ou vidéo privée. L’asset conserve propriétaire, lot, URI objet, MIME déclaré et détecté, taille, SHA-256, état, résultat antivirus, métadonnées, échéance de purge et date de purge.

Un asset rattaché à un candidat est durable par le contrat actuel. Le nettoyage automatique cible uniquement un lot expiré qui n’a jamais été rattaché.

### `LocalizationAttempt`

Tentative de localisation privée contenant :

- profil de vue ;
- méthode et révisions de modèle ;
- ancrages ;
- géométrie, secteur ou abstention ;
- géométrie d’incertitude et précision horizontale ;
- raison d’abstention ;
- provenance rejouable.

Les états sont `PROPOSED`, `SECTOR`, `ABSTAINED`, `FAILED` et `REVIEWED`.

### `FireActivityEvent`

Événement spatial privé puis publiable, rattaché à un incident et un épisode. Il référence le candidat et la tentative de localisation, conserve phénomène, temps observé, géométrie, incertitude, méthode, acteurs et dates de validation/publication, lien éventuel vers l’événement remplacé et numéro de version.

Les états sont `DRAFT`, `ANALYST_VALIDATED`, `EDITOR_PUBLISHED`, `SUPERSEDED` et `RETRACTED`.

### `FireActivityEventEvidence`

Relation normalisée entre événement et `EvidenceAsset`. Les identifiants de preuves ne sont pas enfouis dans un document JSON. Le rôle courant est un support explicite.

### `EventRelation`

Relation persistante entre événements. Les types du domaine sont `identity`, `succession`, `contradiction`, `merge` et `split`. Le remplacement est porté séparément par `supersedes_event_id`, et le support de preuve par `FireActivityEventEvidence`. Le stockage existe ; l’API complète de fusion/séparation et ses métriques restent `PENDING`.

### `ActivityEnvelopeRevision` et `ActivityEnvelopeSupport`

Une révision d’enveloppe conserve incident, épisode, fenêtre effective, géométrie, incertitude, méthode, résolution et état de revue. Chaque support est une relation normalisée vers un `FireActivityEvent`.

Le stockage est présent. La génération calibrée, les gates métier et la publication de ces enveloppes restent `PENDING`.

### `ProgressionDelta`

Différence observée entre deux révisions d’enveloppe, avec type, intervalle, méthode et éventuelle géométrie. Ce n’est jamais une prédiction. Le stockage est présent ; le moteur de calcul et le replay restent `PENDING`.

### `PublicationSnapshot`

Projection publique versionnée, hashée, attribuée à un éditeur et chaînable à la révision précédente. La publication locale d’un événement validé exclut le viewpoint et canonise les géométries en `type` et `coordinates`. Le hash est revérifié à la lecture. Les triggers de migration rendent le payload et ses attributs de publication immuables, interdisent la suppression et n’autorisent qu’une unique rétractation renseignant date, acteur et motif. La route éditeur de rétractation et la disparition de la timeline sont testées localement sur SQLite. Les mêmes garanties sur PostgreSQL réel, la recette 3D/2D déployée, le remplacement et le rollback restent à valider ou `PENDING` selon le composant.

## Géométries

Les services échangent des GeoJSON stricts. En PostgreSQL, la migration ajoute des colonnes PostGIS SRID 4326 et des index GiST pour :

- le point de référence d’un incident candidat ;
- le viewpoint ;
- le résultat et l’incertitude d’une localisation ;
- l’événement et son incertitude ;
- l’enveloppe et son incertitude ;
- le delta de progression ;
- le footprint d’un artefact externe ;
- la géométrie d’une assertion externe.

Des triggers synchronisent les colonnes natives à partir des champs canoniques. Toute géométrie ou tout CRS invalide doit faire échouer l’écriture. La compilation du DDL ne remplace pas un test de migration, d’index et d’axes sur PostGIS réel.

## Phénomènes

Le stockage d’événement accepte actuellement :

- `active_fire` ;
- `visible_front` ;
- `smoke_origin` ;
- `thermal_hotspot`.

Le worker propose :

- `active_fire_point` ;
- `visible_fire_front` ;
- `smoke_origin`.

La normalisation worker-vers-stockage est effectuée par le dispatcher. Les surfaces brûlées, prévisions, références et simulations restent des artefacts ou couches externes séparés.

Règles invariantes :

- un événement isolé produit un point, un segment, un secteur ou une abstention, pas un périmètre ;
- la fumée seule ne ferme jamais une enveloppe active ;
- un hotspot conserve son empreinte ou sa résolution et ne devient pas un foyer métrique ;
- une surface brûlée n’est pas le front actuel ;
- une prévision et une simulation ne sont jamais des observations actives.

## Temps

Les temps suivants restent distincts :

- `observed_start_at` et `observed_end_at` ;
- `effective_start_at` et `effective_end_at` ;
- `acquisition_start_at` et `acquisition_end_at` ;
- `processed_at` ;
- `published_at` ;
- `retrieved_at` ;
- `forecast_run_at` et `forecast_valid_at`, réservés aux prévisions ;
- dates de revue, remplacement et retrait.

La timeline utilise le temps observé ou effectif. Les dates naïves et les intervalles inversés sont refusés.

## Provenance externe présente

### `ExternalProvider`

Organisme, clé stable, domaines exacts autorisés, mode d’authentification, attribution et état d’activation. Les domaines wildcard et les URL non HTTPS sont refusés par le service d’enregistrement.

### `ExternalCollection`

Produit ou API d’un fournisseur : collection, capteur, plateforme, licence, cadence, rôle sémantique et configuration non secrète. Les secrets et paramètres de signature sont refusés dans la configuration persistée.

### `ExternalArtifactRevision`

Révision immuable contenant notamment :

- identifiant produit et révision ;
- URL canonique ;
- hash, ETag et processing baseline ;
- granule, pixel et famille de preuve ;
- temps d’acquisition, d’effet, de traitement, de publication et de récupération ;
- temps de run et de validité pour une prévision ;
- CRS natif, footprint, résolution et qualité ;
- licence, attribution, statut et rôle sémantique.

### `ExternalClaim`

Assertion structurée extraite d’une révision, éventuellement spatiale, avec incident, type, payload, confiance et famille indépendante. Le service local :

- refuse un artefact rétracté ;
- impose la compatibilité entre rôle sémantique et type d’assertion ;
- refuse les secrets dans le payload ;
- exige une précision horizontale avec toute géométrie ;
- produit un identifiant déterministe et un replay idempotent ;
- hérite de la famille de preuve de l’artefact ;
- est protégé contre update et delete par les triggers du registre externe ;
- audite l’enregistrement.

Une déclaration d’incident officielle doit contenir une géométrie ou un lieu nommé. Elle seule peut créer un `IncidentCandidate` privé. Une assertion `thermal_hotspot`, même valide, est explicitement refusée pour cette opération. Le service est `IMPLEMENTED_TESTED_LOCAL` ; il ne possède pas encore d’endpoint public et l’extraction automatique fournisseur reste `PENDING`.

Lors du dispatch, le bundle agent inclut les assertions non rétractées liées à l’incident. Pour un candidat privé issu d’une déclaration officielle, il inclut celles rattachées à la révision source de cette déclaration. La projection transmise conserve identifiant d’assertion et d’artefact, famille indépendante, rôle sémantique, phénomène, temps, géométrie, résolution et contradictions déclarées ; elle ne transforme pas ces signaux en vérité publiée.

### `ArtifactLineage`

Filiation immuable entre révisions : `derived_from`, `same_acquisition_as`, `supersedes`, `retracts`, `mirrors`, `conflicts_with` ou `uses_restricted_asset` selon le domaine. Les tables de révisions et de filiation sont protégées contre update et delete par triggers de migration.

### `IncidentSourcePlan`

Plan persistant par incident ou incident candidat et par collection. Il conserve cadence, watermark, prochaine interrogation, dernière réussite, erreur, backoff et lease. Les primitives locales utilisent un token de lease dont seul le hash est persisté, refusent un worker périmé et bornent le backoff.

## Rôles sémantiques externes

- `raw_earth_observation` ;
- `sensor_detection` ;
- `interpreted_observation` ;
- `official_incident_statement` ;
- `weather_observation` ;
- `weather_forecast` ;
- `geospatial_reference` ;
- `historical_registry` ;
- `simulation`.

Une prévision exige ses temps de run et de validité. Un artefact non prévisionnel ne peut pas les porter.

## Identité, révision et indépendance

Règles implémentées localement :

- même produit et même hash : replay idempotent ;
- même produit et nouveau hash : nouvelle révision ;
- même hash sous plusieurs URL autorisées : miroir ;
- correction et rétractation : nouvelles révisions et filiation, jamais suppression de l’historique ;
- même capteur, plateforme, granule et pixel : même famille de preuve ;
- une prévision reste séparée d’une observation ;
- une géométrie avec CRS inconnu ou incohérent est rejetée ;
- la transformation spatiale n’autorise aucun téléchargement de grille PROJ implicite.

Les rapprochements FIRMS/EFFIS ou multiportails réels dépendent encore des adaptateurs et métadonnées produits. Ils ne sont pas prouvés par les fixtures locales génériques.

## Confiance

Aucun score global d’organisme ne valide une assertion. Une décision doit conserver :

- compétence pour le type d’assertion ;
- maturité du produit ;
- fraîcheur ;
- résolution et précision ;
- qualité capteur ;
- indépendance de filiation ;
- corroboration ;
- calibration historique ;
- état de revue humaine.

Le calcul calibré de confiance par assertion reste `PENDING`.

## Couches temporelles cibles

| Couche | Géométrie | État actuel |
| --- | --- | --- |
| `event` | point, ligne ou polygone | Persistance, transitions, timeline publique et projection locale texte/3D/2D présentes ; recette déployée en attente. |
| `front` | ligne ou multiligne | Représentable par événement ; fusion temporelle en attente. |
| `activity_envelope` | polygone ou multipolygone | Persistance/supports présents ; génération et calibration en attente. |
| `burned_area` | polygone ou multipolygone | Source externe ou modèle séparé ; intégration v2 en attente. |
| `simulation` | type autorisé par le simulateur | Toujours séparée des couches observées. |

La route publique `/api/v2/incidents/{incident_id}/timeline` expose les événements issus des snapshots non rétractés. Le frontend consomme localement cette même projection versionnée pour le panneau texte, les points et segments 3D ainsi que le SVG 2D, avec un instant sélectionné commun et un fallback legacy en cas d’échec API. Cette preuve locale ne couvre pas la recette déployée, le LOD avancé, les enveloppes, les surfaces brûlées ou les simulations.
