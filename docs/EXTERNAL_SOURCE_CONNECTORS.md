# Connecteurs de sources externes

**Registre, révisions et scheduler local :** `IMPLEMENTED_TESTED_LOCAL`

**Adaptateurs HTTP structurés :** `IMPLEMENTED_NOT_LIVE_VERIFIED`

**Collecte fournisseur live :** `PENDING`

Le backend contient un registre immuable, des plans par incident, un scheduler appelable et trois adaptateurs HTTP bornés. La suite combinée adaptateurs, registre et scheduler compte 20 tests réussis ; Ruff et mypy strict ciblés réussissent. Les tests utilisent un client injecté et aucune requête réseau réelle. Aucun fournisseur ne doit être présenté comme opérationnel avant enrôlement, licence, credentials éventuels et recette live.

## Séparation des responsabilités

```text
ExternalProvider + ExternalCollection
→ IncidentSourcePlan
→ scheduler et lease
→ adaptateur exact provider/collection
→ ExternalArtifactRevision immuable
→ ArtifactLineage et famille de preuve
→ ExternalClaim structuré
→ corrélation et revue (encore à compléter)
```

- le registre valide identité, droits, provenance et géométrie ;
- le scheduler réclame un plan dû, construit un contexte incident/AOI/temps et applique watermark/backoff ;
- l’adaptateur interroge une interface exacte et retourne des artefacts stricts ;
- aucun de ces composants ne publie un événement ;
- l’enregistrement typé d’assertions est implémenté localement ; l’extraction automatique, la confiance calibrée et la corrélation analyste restent à compléter.

## Assertions externes

`register_external_claim` lie une assertion à une révision immuable, valide son type selon le rôle sémantique, refuse les secrets, contrôle géométrie/précision et conserve la famille indépendante. Le même contenu rejoué produit le même identifiant.

`create_private_incident_candidate_from_external_claim` accepte uniquement une assertion `incident_declaration` issue d’un artefact `official_incident_statement` courant. Elle crée un dossier `PRIVATE_MATCHING`, jamais un incident public. Une assertion `thermal_hotspot` est refusée. Ces services sont testés localement et ne sont exposés par aucun endpoint public.

## Adaptateurs présents

| Adaptateur | Interface exacte | Portée | Statut et limites |
| --- | --- | --- | --- |
| `CdseStacConnector` | `https://stac.dataspace.copernicus.eu/v1/search` | Découverte STAC par AOI et fenêtre pour une collection explicitement configurée | `IMPLEMENTED_NOT_LIVE_VERIFIED`. Ne télécharge pas les produits et n’exécute ni Process API ni OData. |
| `IgnGeoplateformeWfsConnector` | `https://data.geopf.fr/wfs/ows` | Lecture WFS bornée d’une couche de référence explicitement choisie | `IMPLEMENTED_NOT_LIVE_VERIFIED`. La définition fournie est un template désactivé ; `type_name` et licence du produit doivent être confirmés avant activation. |
| `MeteoFranceSynopConnector` | `https://public-api.meteofrance.fr/public/DPObs/v1/synop` | Observations SYNOP pour une liste explicite de stations et une fenêtre incidente | `IMPLEMENTED_NOT_LIVE_VERIFIED`. Exige un token serveur ; ne couvre ni radar, ni AROME, ni ARPEGE. |

Les métadonnées de bootstrap déclarent tous les fournisseurs désactivés. Le registre runtime ne construit que les routes listées dans la configuration `FV_OFFICIAL_CONNECTOR_COLLECTIONS` avec `enabled=true`. Une route sans adaptateur exact échoue et entre en backoff ; aucun wildcard n’est accepté.

### Collections CDSE préparées mais désactivées

- `sentinel-3-sl-2-frp-nrt` — détection capteur ;
- `sentinel-3-sl-2-frp-ntc` — détection capteur ;
- `sentinel-2-l2a` — observation terrestre brute ;
- `sentinel-1-grd` — observation terrestre brute.

Ces noms et leurs disponibilités doivent être vérifiés contre le catalogue live avant activation. Une réponse STAC valide ne signifie pas que l’asset, sa licence détaillée ou sa cadence ont été validés pour FireViewer.

## Contrôles HTTP présents

- HTTPS, port 443 et host exacts ;
- chemin exact ou préfixe explicitement borné ;
- aucune redirection suivie ;
- proxy d’environnement désactivé sur le client construit par défaut ;
- URL sans credentials, fragment ou paramètres de signature ;
- délais de connexion, lecture, écriture et pool bornés ;
- réponse lue avec taille maximale, y compris sans `Content-Length` ;
- types JSON/GeoJSON explicitement acceptés ;
- JSON avec clés dupliquées refusé ;
- AOI WGS84 finie, ordonnée et limitée ;
- fenêtre temporelle bornée ;
- nombre d’items ou features borné ;
- pagination ou troncature refusée au lieu d’être ignorée ;
- ETag et `Last-Modified` transportés dans un watermark opaque ;
- erreurs persistées sous forme de code borné, sans URL, token ni corps de réponse ;
- secret Météo-France conservé dans les settings serveur et jamais dans la collection.

La protection DNS/rebinding et les politiques réseau de l’infrastructure restent à vérifier dans le déploiement. Les contrôles d’host applicatifs ne remplacent pas un egress policy.

## Registre et immutabilité

Le service local impose :

1. domaine exact et URL canonique ;
2. licence et attribution non vides ;
3. hash SHA-256 ;
4. rôle sémantique cohérent avec la collection ;
5. temps d’acquisition distincts des temps de publication et récupération ;
6. CRS reconnu pour un footprint ;
7. transformation vers EPSG:4326 avec réseau PROJ désactivé ;
8. statut `PROVISIONAL`, `VALIDATED`, `CORRECTED` ou `RETRACTED` ;
9. révision append-only ;
10. filiation explicite.

Même produit et même hash constituent un replay idempotent. Un nouveau hash crée une révision. Un même hash sous plusieurs URL autorisées crée une relation de miroir. Une correction ou rétractation crée une révision et conserve l’historique.

## Indépendance des preuves

Pour les produits capteurs, la famille repose sur collection, plateforme, capteur, granule et pixel ou feature natif. Deux relais du même passage appartiennent à la même famille, même s’ils proviennent de portails différents.

Les règles locales de famille sont testées. Le rapprochement concret de produits FIRMS et EFFIS exige encore un adaptateur et un mapping de leurs identifiants natifs ; il reste `PENDING`.

## Scheduler par incident

`IncidentSourcePlan` conserve :

- incident ou incident candidat ;
- collection et cadence ;
- AOI issue de l’incident ou du point de référence privé ;
- intervalle observé ;
- watermark ;
- prochaine interrogation et dernière réussite ;
- erreur et backoff borné ;
- lease, propriétaire et hash du token de lease.

Le scheduler :

1. ne fait rien si `FV_OFFICIAL_CONNECTORS_ENABLED=false` ;
2. réclame au plus un plan dû avec lease ;
3. résout exactement provider et collection ;
4. exécute l’adaptateur hors transaction longue ;
5. enregistre chaque révision de manière idempotente ;
6. avance le watermark après succès ;
7. conserve un échec visible et retryable ;
8. refuse la clôture par un worker périmé.

Le scheduler est raccordé à deux points d’exécution :

- le cron privé `GET /api/v1/internal/external-sources/progress`, protégé par l’autorisation cron, absent du schéma public et planifié toutes les cinq minutes dans `vercel.json` ;
- la commande `python -m fire_viewer.scripts.run_external_source_scheduler --once`, ou sa boucle de polling sans `--once`.

La commande `python -m fire_viewer.scripts.bootstrap_official_sources` enregistre de manière idempotente les fournisseurs et collections revus, sans effectuer de requête réseau. Une collection n’est activée que par configuration explicite et lorsque `FV_OFFICIAL_CONNECTORS_ENABLED=true`.

Ce raccordement est `IMPLEMENTED_TESTED_LOCAL`. Il ne prouve ni cadence hébergée réellement déclenchée, ni secret configuré, ni disponibilité, quotas, droits ou contenu d’un fournisseur live.

## Catalogue restant

| Priorité | Source ou famille | État |
| --- | --- | --- |
| 1 | CDSE STAC Sentinel-1/2/3 | Découverte structurée en code, live non vérifiée. |
| 2 | IGN Géoplateforme | WFS générique en code ; MNT, MNS, orthophoto, BD TOPO et tuiles restent à enrôler produit par produit. |
| 3 | Météo-France | SYNOP en code ; radar, AROME et autres produits restent `PENDING`. |
| 4 | EUMETSAT MTG/FCI FRP/FIR | `PENDING`, feature flag obligatoire. |
| 5 | NASA FIRMS et EFFIS | `PENDING`. |
| 6 | CEMS | `PENDING`, activations publiques uniquement et droits par produit. |
| 7 | Préfecture, SDIS/SIS, ONF, DDTM, mairies | `PENDING`, adaptateur exact par organisme/territoire. |
| 8 | CAMS/GFAS | `PENDING`, contexte fumée/émissions séparé. |
| 9 | BDIFF | `PENDING`, post-incident ou benchmark uniquement. |

## Sémantique obligatoire

- Sentinel-2 soutient le changement et la surface brûlée, pas une garantie temps réel ;
- Sentinel-1 reste un signal radar auxiliaire ;
- un hotspot conserve footprint et résolution ;
- une délinéation CEMS décrit un produit et une acquisition, pas un front tactique courant ;
- une surface annoncée sans géométrie reste numérique ;
- une prévision reste `weather_forecast` ;
- IGN est une référence, jamais une preuve d’activité ;
- BDIFF est rétrospectif.

## Gate live par collection

Une collection ne passe à « live vérifiée » qu’après :

1. confirmation de l’URL, du schéma et des identifiants réels ;
2. configuration d’un secret serveur si nécessaire ;
3. validation de licence, attribution et redistribution ;
4. requête réelle sur une AOI et une fenêtre de recette ;
5. contrôle des réponses vide, inchangée, paginée, corrigée et indisponible ;
6. enregistrement puis replay d’une révision ;
7. vérification du CRS, footprint, temps et famille de preuve ;
8. preuve qu’aucun secret ou viewpoint privé n’apparaît dans les logs ;
9. test du quota, du backoff et de l’arrêt ;
10. décision d’activation documentée.

Une indisponibilité produit une couverture dégradée explicite. Elle ne signifie jamais absence d’incendie.

## Références d’interface

- [Copernicus Data Space Ecosystem — STAC](https://documentation.dataspace.copernicus.eu/APIs/STAC.html)
- [Météo-France — API Données d’observation](https://confluence-meteofrance.atlassian.net/wiki/spaces/OpenDataMeteoFrance/pages/853639294/API%2BCibl%2Be%2BDonn%2Bes%2Bd%2BObservation)
- [Météo-France — réutilisation et attribution](https://confluence-meteofrance.atlassian.net/wiki/spaces/OpenDataMeteoFrance/pages/457803314/Quels%2Bsont%2Bles%2Bdroits%2Bde%2Br%2B-utilisation%2Bet%2Bcomment%2Bsourcer%2Bles%2Bdonn%2Bes%2Bpubliques%2Bde%2BM%2Bt%2Bo-France)
- [IGN — tutoriel Géoplateforme WFS](https://geoservices.ign.fr/sites/default/files/2024-06/Tuto_Geoplateforme.pdf)

Ces références décrivent les interfaces. Elles ne constituent ni une preuve de disponibilité live, ni une validation automatique de licence pour chaque produit sélectionné.
