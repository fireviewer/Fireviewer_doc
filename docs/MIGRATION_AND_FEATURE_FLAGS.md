# Migration et feature flags — recadrage événementiel

**Migration additive en code :** `IMPLEMENTED_NOT_LIVE_VERIFIED`

**Activation déployée :** `PENDING`

La migration `b7f2e4a9c810` ajoute le domaine événementiel, les jobs, la revue, le registre externe, les plans de source et les snapshots sans supprimer les objets historiques. Sa compilation et sa dérive de schéma ont été contrôlées localement. Elle n’a pas été exécutée sur Neon/PostGIS réel et ne doit pas être promue avant sauvegarde, restauration, upgrade et downgrade sur une copie.

## Stratégie

- migration additive uniquement ;
- routes v1 maintenues ;
- routes, analyse, connecteurs, 3D principale et publication v2 désactivés par défaut ;
- aucun backfill automatique ;
- aucun objet legacy publié ou fusionné sans décision humaine ;
- rollback par désactivation des flags et retour à la projection v1, sans suppression des données v2.

## Tables ajoutées

- `incident_candidate` ;
- `viewpoint` ;
- `event_candidate` ;
- `event_analysis_job` ;
- `evidence_asset` ;
- `localization_attempt` ;
- `fire_activity_event` ;
- `fire_activity_event_evidence` ;
- `event_relation` ;
- `activity_envelope_revision` ;
- `activity_envelope_support` ;
- `progression_delta` ;
- `publication_snapshot` ;
- `external_provider` ;
- `external_collection` ;
- `external_artifact_revision` ;
- `external_claim` ;
- `artifact_lineage` ;
- `incident_source_plan`.

Sur PostgreSQL, la migration ajoute aussi les colonnes PostGIS, index GiST, triggers de synchronisation, protections append-only du registre externe et garde d’immutabilité/rétractation unique des snapshots publics. Ces éléments sont `IMPLEMENTED_NOT_LIVE_VERIFIED` tant qu’ils n’ont pas été exercés sur une vraie instance.

## Correspondances historiques

| Objet historique | Cible possible | Règle |
| --- | --- | --- |
| `Observation` | `EventCandidate` ou assertion | Seulement si viewpoint, temps et contexte sont réellement présents. |
| `AgentSpatialProposal` | `LocalizationAttempt` | Conserver méthode, modèle, révision et abstention. |
| `AgentFactProposal` | `ExternalClaim` ou assertion | Ne jamais lui attribuer une géométrie absente. |
| `IncidentSpatialMarker` | géométrie candidate | Revue obligatoire avant événement. |
| `ActiveFireZoneRevision` | `ActivityEnvelopeRevision` | Conserver origine et supports ; ne pas présumer leur indépendance. |
| `IncidentBulletinEntry` | assertion éditoriale | Ne pas créer d’événement spatial sans preuve spatiale. |
| média ou contribution | `EvidenceAsset` | Un média isolé ne devient pas un événement. |

Les adaptateurs de migration devront produire `convertible`, `incomplete`, `ambiguous` ou `rejected`. `incomplete` et `ambiguous` restent privés. Ces adaptateurs et rapports sont `PENDING`.

## Flags backend et worker

| Variable | Valeur initiale | État | Autorise |
| --- | --- | --- | --- |
| `FV_EVENT_V2_ENABLED` | `false` | `IMPLEMENTED_TESTED_LOCAL` | Routes de contribution et revue v2. En staging/production, exige Supabase et ClamAV. |
| `FV_SUPABASE_AUTH_ENABLED` | `false` | `IMPLEMENTED_TESTED_LOCAL` | Mode Supabase du backend, avec configuration correspondante. |
| `FV_AGENT_EVENT_PIPELINE_ENABLED` | `false` | `IMPLEMENTED_TESTED_LOCAL` | Traitement worker des payloads `schema_version=event-2.0`. |
| `FV_AGENT_EVENT_PIPELINE_ENABLED` via `agent_event_pipeline_enabled` backend | `false` | `IMPLEMENTED_TESTED_LOCAL` | Priorité au dispatcher événementiel dans le dispatcher backend. |
| `FV_OFFICIAL_CONNECTORS_ENABLED` | `false` | `IMPLEMENTED_TESTED_LOCAL` pour registre/scheduler | Réclamation des `IncidentSourcePlan` par cron privé ou CLI ; n’implique jamais qu’un adaptateur live soit prêt. |
| `FV_3D_PRIMARY_ENABLED` | `false` | `IMPLEMENTED_TESTED_LOCAL` pour le flag/fallback | Préférence 3D du frontend ; alias backend temporaire `FV_THREE_D_PRIMARY_ENABLED`. |
| `FV_V2_PUBLICATION_ENABLED` | `false` | `IMPLEMENTED_TESTED_LOCAL` pour la transition | Publication d’un événement analyste-validé avec rôle courant et session récente. |

Le dispatcher général conserve également ses propres gates historiques, notamment `FV_AGENT_DISPATCH_ENABLED`. Activer le pipeline événementiel sans le processus de dispatch ne traite aucun job.

Le registre officiel est initialisé sans réseau par `python -m fire_viewer.scripts.bootstrap_official_sources`. Le scheduler s’exécute par `GET /api/v1/internal/external-sources/progress` dans le cron privé ou par `python -m fire_viewer.scripts.run_external_source_scheduler` ; ces points d’entrée restent sans preuve de déclenchement hébergé ou de collecte fournisseur live.

## Flags frontend

Vite expose uniquement les variables préfixées `VITE_` :

- `VITE_FV_EVENT_V2_ENABLED` ;
- `VITE_FV_SUPABASE_AUTH_ENABLED` ;
- `VITE_FV_OFFICIAL_CONNECTORS_ENABLED` ;
- `VITE_FV_AGENT_EVENT_PIPELINE_ENABLED` ;
- `VITE_FV_3D_PRIMARY_ENABLED` ;
- `VITE_FV_V2_PUBLICATION_ENABLED`.

Seule la chaîne exacte `true` active un flag. Les flags frontend n’accordent aucune autorisation : le backend reste la source de vérité pour les rôles et transitions.

## Ordre d’activation

1. restaurer une copie récente de la base ;
2. exécuter upgrade, contrôles PostGIS et downgrade sur la copie ;
3. réexécuter upgrade et vérifier les objets legacy ;
4. configurer Supabase, JWKS, session active et ClamAV ;
5. activer v2 uniquement en environnement privé ;
6. valider contribution, upload, dispatch, abstention et revue ;
7. valider chaque adaptateur officiel séparément ;
8. activer la publication uniquement sur un incident de recette ;
9. comparer v1/v2 en shadow ;
10. tester rollback et restauration ;
11. décider explicitement d’une activation limitée.

## Double écriture et délégation v1

La double écriture et la délégation du formulaire v1 restent `PENDING`. Elles ne seront autorisées que si :

- une transaction relie les identifiants v1 et v2 ;
- une erreur n’entraîne aucune publication partielle ;
- la source immuable n’est écrite qu’une fois ;
- les divergences sont mesurées ;
- une seule projection publique est autoritaire.

## Backfill

Le backfill reste `PENDING` et devra :

- fonctionner par incident et fenêtre temporelle ;
- être rejouable et idempotent ;
- conserver les objets historiques ;
- ne jamais inventer viewpoint, précision, temps d’observation ou filiation ;
- ne rien publier ;
- produire un rapport de couverture et de rejets.

## Rollback

Le rollback fonctionnel désactive les flags v2 et restaure la lecture publique v1. Il ne supprime pas les tables ni les données v2. Les jobs restent privés et sont terminés ou suspendus selon leur état. Une migration destructive est exclue tant que la période de compatibilité n’est pas close par décision documentée.
