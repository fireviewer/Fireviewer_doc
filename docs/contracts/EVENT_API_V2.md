# Contrat API — événements v2

**Statut du contrat et des routes :** `IMPLEMENTED_TESTED_LOCAL`

**Statut des dépendances Supabase, Blob, ClamAV et RunPod réelles :** `IMPLEMENTED_NOT_LIVE_VERIFIED`

**Autorité :** `fireviewer-backend`

**Consommateurs :** `fireviewer-frontend`, `fireviewer-ai-worker`

Les routes sont raccordées à l’application FastAPI et restent fermées lorsque `FV_EVENT_V2_ENABLED=false`. Les tests locaux couvrent l’admission, les uploads, l’idempotence, la confidentialité, le dispatcher et les transitions principales. Ils ne prouvent pas un déploiement ni un appel à un service externe réel.

## Authentification

- la contribution exige un bearer JWT et un compte email vérifié ;
- en mode Supabase, le backend vérifie la signature via le JWKS du projet ;
- `contributor` est implicite pour un utilisateur Supabase vérifié ;
- les rôles élevés proviennent uniquement de `app_metadata.roles` ;
- les routes internes recontrôlent les rôles auprès de `/auth/v1/user` afin qu’un JWT ancien ne conserve pas un accès retiré ;
- la publication exige en plus une session récente et `FV_V2_PUBLICATION_ENABLED=true` ;
- le mode administrateur local est réservé au développement ou au secours et ne remplace pas Supabase en staging ou production lorsque v2 est actif.

La révocation globale de toutes les sessions Supabase lors d’un changement de rôle reste `PENDING`. Le contrôle live empêche déjà l’utilisation d’un rôle retiré sur les routes v2 élevées.

## Routes contributeur

| Méthode | Route | Réponse | Rôle |
| --- | --- | --- | --- |
| `POST` | `/api/v2/evidence/uploads` | `201` | Ouvrir un lot privé de 1 à 20 images ou vidéos. |
| `PUT` | `/api/v2/evidence/uploads/{upload_id}/assets/{asset_id}` | `204` | Envoyer un objet au stockage local, uniquement en développement ou test. |
| `POST` | `/api/v2/evidence/uploads/{upload_id}/finalize` | `200` | Contrôler les objets, signatures MIME, tailles, hashes et antivirus. |
| `POST` | `/api/v2/event-candidates` | `202` | Créer un candidat privé et exactement un job persistant. |
| `GET` | `/api/v2/me/event-candidates` | `200` | Lister uniquement les candidats du contributeur courant. |
| `GET` | `/api/v2/me/event-candidates/{candidate_id}` | `200` | Lire uniquement un candidat appartenant au contributeur courant. |

Le stockage Blob utilise le protocole de grant privé géré par le même endpoint d’ouverture. Le `PUT` direct n’est jamais exposé en staging ou production.

## Route publique

| Méthode | Route | Réponse | Rôle |
| --- | --- | --- | --- |
| `GET` | `/api/v2/incidents/{incident_id}/timeline` | `200` | Retourne uniquement les événements issus de snapshots non rétractés lorsque les flags événement et publication v2 sont actifs. |

Cette route est publique, mais elle échoue en `404` lorsque `FV_EVENT_V2_ENABLED=false` ou `FV_V2_PUBLICATION_ENABLED=false`.

```json
{
  "incident_id": "FR-13-00042",
  "revision": 3,
  "events": [
    {
      "event_id": "FAE_...",
      "state": "EDITOR_PUBLISHED",
      "phenomenon_kind": "visible_front",
      "observed_start_at": "2026-08-03T12:32:00Z",
      "observed_end_at": null,
      "geometry": {"type": "LineString", "coordinates": [[5.1, 44.9], [5.2, 44.95]]},
      "uncertainty": {
        "type": "Polygon",
        "coordinates": [[[5.09, 44.89], [5.21, 44.89], [5.21, 44.96], [5.09, 44.96], [5.09, 44.89]]]
      },
      "method": "terrain_raycast",
      "publication_revision": 3
    }
  ]
}
```

La projection ne contient ni viewpoint, ni propriétaire, ni identifiant de preuve. Le snapshot stocke uniquement un `evidence_count` agrégé, qui n’est pas nécessairement exposé par ce contrat. Les géométries publiques sont canoniques : seuls `type` et `coordinates` sont propagés après validation. La réponse utilise un cache public court avec revalidation.

À chaque lecture publique, le backend recalcule et vérifie `payload_sha256`. La migration protège par trigger le payload, la révision, l’éditeur et la date de publication, interdit la suppression et autorise une unique rétractation complète avec date, acteur et motif. Cette défense est testée localement sur SQLite ; son équivalent PostgreSQL reste à exercer sur une vraie copie PostGIS.

Le schéma FastAPI runtime et l’artefact statique régénéré `openapi/openapi.json` exposent la timeline publique et les transitions internes, dont la rétractation. La dérive entre runtime et artefact versionné doit rester contrôlée en CI avant publication d’un SDK.

## Routes internes

| Méthode | Route | Autorisation | Effet |
| --- | --- | --- | --- |
| `GET` | `/api/v2/internal/event-candidates` | rôle élevé courant | Liste paginée, filtrable par état ; sans filtre, tous les états sont accessibles. |
| `GET` | `/api/v2/internal/event-candidates/{candidate_id}` | rôle élevé courant | Bundle privé complet de revue. |
| `GET` | `/api/v2/internal/evidence-assets/{asset_id}/content` | rôle élevé courant | Preuve `VERIFIED` et antivirus `CLEAN` uniquement ; réponse privée sans cache. |
| `POST` | `/api/v2/internal/event-candidates/{candidate_id}/review` | `analyst` ou `administrator` | `reject`, `request_evidence` ou `mark_contradictory`. |
| `POST` | `/api/v2/internal/event-candidates/{candidate_id}/attach-incident` | `analyst` ou `administrator` | Rattache un candidat privé à un incident existant et matérialise les brouillons défendables sans relancer l’analyse. |
| `POST` | `/api/v2/internal/fire-activity-events/{event_id}/validate` | `analyst` ou `administrator` | Passe un brouillon à `ANALYST_VALIDATED`. |
| `POST` | `/api/v2/internal/fire-activity-events/{event_id}/reject` | `analyst` ou `administrator` | Rejette le brouillon privé et actualise le candidat. |
| `POST` | `/api/v2/internal/fire-activity-events/{event_id}/publish` | `editor` ou `administrator`, rôle courant et session récente | Publie un événement validé et crée une nouvelle révision de snapshot ; refuse une preuve contributeur sans consentement `public_derivative`. |
| `POST` | `/api/v2/internal/fire-activity-events/{event_id}/retract` | `editor` ou `administrator`, rôle courant et session récente | Rétracte un événement publié et son snapshot actif en conservant acteur et motif ; il disparaît de la timeline publique. |

Un rôle élevé de lecture est l’un de `analyst`, `editor`, `security_operator` ou `administrator`. Un éditeur seul peut consulter la revue mais ne peut pas effectuer les transitions réservées à l’analyste. Un utilisateur possédant les deux rôles peut enchaîner les deux gates.

Les opérations de correction spatiale structurée, de fusion/séparation, de remplacement éditorial et de restauration restent `PENDING`.

## Création d’un événement candidat

```http
POST /api/v2/event-candidates
Content-Type: application/json
Authorization: Bearer <access-token>
```

### Corps canonique

```json
{
  "idempotency_key": "c6464e91-42cf-4d2b-9fa1-48fdf92daf1f",
  "incident_id": "FR-13-00042",
  "viewpoint": {
    "longitude": 5.1234,
    "latitude": 44.9876,
    "horizontal_accuracy_m": 25,
    "altitude_m": 340,
    "label": "Route forestière, belvédère",
    "yaw_deg": 45,
    "fov_deg": 70,
    "origin": "USER_PLACED"
  },
  "observed_time": {
    "start_at": "2026-08-03T14:32:00+02:00",
    "end_at": null
  },
  "message": "Fumée sombre visible au nord-est derrière la crête.",
  "evidence_asset_ids": [],
  "consent": {
    "analysis": true,
    "retention": true,
    "public_derivative": false
  }
}
```

`incident_id` est facultatif. Lorsqu’il est absent, le backend crée un `IncidentCandidate` privé d’origine `CONTRIBUTION`. Il n’invente ni identité publique ni géométrie d’activité.

### Invariants d’admission

- `idempotency_key` est un UUID obligatoire ;
- longitude, latitude et précision horizontale finies et bornées sont obligatoires ;
- l’heure inclut un fuseau et `end_at` ne précède pas `start_at` ;
- au moins un message non vide ou une preuve finalisée est fourni ;
- zéro à vingt images ou vidéos sont autorisées par candidat ;
- les seuls MIME acceptés sont `image/jpeg`, `image/png`, `image/webp`, `video/mp4`, `video/quicktime` et `video/webm` ;
- l’extension du nom doit correspondre au MIME déclaré ;
- les limites par défaut sont 25 Mio par image, 500 Mio par vidéo et 2 Gio par contribution ;
- `consent.analysis` et `consent.retention` valent `true` ;
- `consent.public_derivative` vaut `false` par défaut ;
- le client ne fournit aucune géométrie de feu faisant autorité ;
- le viewpoint n’est jamais copié dans la géométrie d’activité ;
- l’écriture du candidat, de l’outbox et du job est atomique.

### Réponse

```json
{
  "candidate_id": "EC_...",
  "analysis_job_id": "EAJ_...",
  "tracking_id": "EC_...",
  "state": "QUEUED",
  "incident_id": "FR-13-00042",
  "incident_candidate_id": null,
  "observed_start_at": "2026-08-03T12:32:00Z",
  "observed_end_at": null,
  "message": "Fumée sombre visible au nord-est derrière la crête.",
  "review_message": null,
  "evidence_asset_ids": [],
  "viewpoint": {
    "horizontal_accuracy_m": 25,
    "origin": "USER_PLACED",
    "has_orientation": true,
    "exact_position_withheld": true
  },
  "created_at": "2026-08-03T12:33:00Z",
  "updated_at": "2026-08-03T12:33:00Z"
}
```

Une répétition avec la même clé et le même corps retourne les mêmes identifiants et l’en-tête `Idempotent-Replay: true`. La même clé avec un corps différent est refusée. Une autre clé n’est pas fusionnée silencieusement.

## Upload et finalisation

L’ouverture reçoit :

```json
{
  "files": [
    {
      "file_name": "observation-001.jpg",
      "media_type": "image/jpeg",
      "size_bytes": 2849312,
      "sha256": "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
    }
  ]
}
```

La finalisation :

1. vérifie la propriété et l’état de chaque asset ;
2. lit les métadonnées réelles de l’objet ;
3. vérifie taille, signature MIME et hash SHA-256 côté serveur ;
4. applique le mode antivirus configuré ;
5. ne retourne que des assets `VERIFIED` et `CLEAN` lorsqu’ils peuvent être rattachés.

En staging et production, l’activation v2 exige `FV_EVENT_ANTIVIRUS_MODE=clamav`. Le parcours ClamAV réel et les gros objets Blob restent `IMPLEMENTED_NOT_LIVE_VERIFIED`.

## États persistants

`EventCandidate` :

```text
RECEIVED → QUEUED → ANALYZING
→ NEEDS_REVIEW | ABSTAINED | FAILED
→ VALIDATED | REJECTED
```

`EventAnalysisJob` :

```text
QUEUED → SUBMITTING → AWAITING_REMOTE
→ COMPLETED | ABSTAINED | FAILED
```

`FireActivityEvent` :

```text
DRAFT → ANALYST_VALIDATED → EDITOR_PUBLISHED
→ SUPERSEDED | RETRACTED
```

L’action `retract` fait passer un événement `EDITOR_PUBLISHED` à `RETRACTED` et rétracte une seule fois son snapshot actif. L’action de remplacement menant à `SUPERSEDED`, ainsi que la restauration, restent `PENDING`.

## Sortie worker et persistance

Le dispatcher accepte une sortie `event-2.0` strictement typée :

- une localisation avec géométrie et précision ;
- un secteur non publiable lorsque seule la direction est défendable ;
- une abstention avec reason codes ;
- zéro ou plusieurs propositions `DRAFT` privées.

Chaque `LocalizationAttempt` conserve méthode, modèle, révision, profil, ancrage, géométrie ou secteur, incertitude, abstention et provenance. Une réponse distante ambiguë échoue explicitement ; elle n’est pas resoumise automatiquement au risque de doubler le calcul.

## Confidentialité et cache

- les routes `/api/v2/me` et `/api/v2/internal` répondent avec une politique `no-store` ;
- les routes contributeur ne renvoient jamais longitude, latitude, altitude, yaw ou FOV exacts ;
- le bundle interne contient le viewpoint exact pour la revue autorisée ;
- un autre contributeur reçoit une absence de ressource plutôt que le dossier d’autrui ;
- une preuve interne n’est servie que si elle est vérifiée et propre, avec `nosniff` ;
- un snapshot public est construit à partir de champs autorisés et exclut le viewpoint exact.

Le streaming de consultation interne des vidéos volumineuses doit encore être durci avant activation production ; le chemin local actuel charge le contenu contrôlé avant réponse.

## Erreurs normatives

| Code | Signification |
| --- | --- |
| `event_viewpoint_required` | Point de vue absent ou invalide. |
| `event_time_required` | Moment absent, naïf ou incohérent. |
| `event_context_required` | Ni message ni preuve. |
| `event_analysis_consent_required` | Analyse ou rétention non autorisée. |
| `event_evidence_not_finalized` | Preuve inconnue, non propre ou non finalisée. |
| `event_idempotency_conflict` | Même clé, requête différente. |
| `event_activity_geometry_forbidden` | Le client tente d’imposer une géométrie d’activité. |
| `event_private_only` | Transition publique non autorisée. |

Les erreurs FastAPI de validation peuvent aussi être retournées sous forme `422` lorsque le schéma strict est violé.

## Compatibilité

Les routes historiques restent disponibles. La timeline publique v2 est consommée localement par le panneau texte et les projections 3D/2D lorsque les flags événement et publication sont actifs. Le parseur frontend ne conserve que le contrat public et le parcours revient au contenu legacy si l’API v2 échoue. La délégation automatique de v1 vers v2, la comparaison publique shadow et le backfill prudent restent suivis séparément. Aucun objet legacy n’est automatiquement converti ou publié.
