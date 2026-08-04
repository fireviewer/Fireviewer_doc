# Matrice d’acceptation et de replay événementiel

**Statut global :** socle local testé ; dépendances live, précision terrain, enveloppes, progression et replay complet non validés

## Signification

| Statut | Signification |
| --- | --- |
| `IMPLEMENTED_TESTED_LOCAL` | Le code et un test ciblé local existent. |
| `IMPLEMENTED_NOT_LIVE_VERIFIED` | Le code existe, mais la dépendance ou l’environnement réel n’a pas été exercé. |
| `PENDING` | Le comportement complet ou sa preuve manque. |

Une réussite locale ne prouve ni précision terrain, ni sécurité d’un déploiement, ni disponibilité d’un fournisseur.

## Admission, preuves et dispatcher

| Gate | Statut | Preuve locale | Reste à valider |
| --- | --- | --- | --- |
| Refus sans viewpoint ou temps | `IMPLEMENTED_TESTED_LOCAL` | Schémas worker et API négatifs | Recette déployée. |
| Message sans média | `IMPLEMENTED_TESTED_LOCAL` | Candidat et job créés dans les tests API/dispatcher | Parcours navigateur avec compte réel. |
| Plusieurs médias | `IMPLEMENTED_TESTED_LOCAL` | Ouverture, upload local, finalisation et rattachement testés ; le contrôle interne matérialise chaque objet par flux dans un fichier temporaire | Vercel Blob réel et charge maximale. |
| MIME, extension, taille et SHA-256 | `IMPLEMENTED_TESTED_LOCAL` | Cas valides et incohérents couverts, avec calcul de signature et hash par blocs sans lecture intégrale en mémoire | Formats malformés étendus et charge maximale. |
| Antivirus | `IMPLEMENTED_NOT_LIVE_VERIFIED` | Mode propre réservé aux tests et gate de configuration | Démon ClamAV réel, timeout, quarantaine et reprise. |
| Idempotence candidat/job | `IMPLEMENTED_TESTED_LOCAL` | Même clé/corps : un candidat et un job ; conflit de corps refusé | Concurrence multi-connexion PostgreSQL. |
| Job persistant | `IMPLEMENTED_TESTED_LOCAL` | Leases, soumission, polling, reprise et états terminaux testés | RunPod réel, coupure réseau et redémarrage processus. |
| Réponse distante ambiguë | `IMPLEMENTED_TESTED_LOCAL` | Échec explicite sans resoumission dangereuse | Validation avec transport réel. |
| Rétention temporaire | `IMPLEMENTED_TESTED_LOCAL` | Seuls les lots expirés non rattachés sont purgés, avec compte et octets audités | Stockage Blob réel et exécution planifiée. |

## Authentification, rôles et confidentialité

| Gate | Statut | Preuve locale | Reste à valider |
| --- | --- | --- | --- |
| Email vérifié obligatoire | `IMPLEMENTED_TESTED_LOCAL` | Claims standard sans `email_verified` recontrôlés via utilisateur actif simulé | Projet Supabase réel et parcours email. |
| Rôles depuis `app_metadata` uniquement | `IMPLEMENTED_TESTED_LOCAL` | `user_metadata` ignoré et rôles filtrés | Mutation de rôle réelle. |
| Contributeur interdit de revue | `IMPLEMENTED_TESTED_LOCAL` | Gates backend et frontend ciblées | Test d’intrusion déployé. |
| Analyste interdit de publication | `IMPLEMENTED_TESTED_LOCAL` | Transition et permissions UI testées | Session Supabase réelle. |
| Utilisateur analyste + éditeur | `IMPLEMENTED_TESTED_LOCAL` | Les deux gates sont accessibles selon les rôles | Parcours live complet. |
| Rôle retiré refusé avec JWT ancien | `IMPLEMENTED_TESTED_LOCAL` | Relecture live simulée de `app_metadata.roles` | Retrait de rôle réel et propagation. |
| Révocation de toutes les sessions au retrait d’un rôle | `PENDING` | Aucun hook d’administration Supabase implémenté | Révocation serveur et recette multi-session. |
| Jeton récent pour publier | `IMPLEMENTED_TESTED_LOCAL` | Âge d’authentification et session active testés | Politique et réauthentification UX live. |
| Point de vue absent des réponses contributeur/publiques | `IMPLEMENTED_TESTED_LOCAL` | Reçu réduit et snapshot sans coordonnées exactes | Audit de tous les endpoints déployés. |
| Consentement au dérivé public obligatoire | `IMPLEMENTED_TESTED_LOCAL` | La publication est refusée lorsque `consent.public_derivative=false` | Parcours éditorial et retrait du consentement sur environnement réel. |
| Anti-IDOR contribution | `IMPLEMENTED_TESTED_LOCAL` | Lecture d’un candidat tiers refusée | Campagne sécurité complète. |
| Preuve privée réservée à la revue | `IMPLEMENTED_TESTED_LOCAL` | Rôle élevé, état `VERIFIED`, scan `CLEAN`, URI exacte signée, taille/hash revérifiés, réponse fichier temporaire et nettoyage après réponse | Requêtes HTTP Range, charge vidéo maximale et Blob réel. |
| Aucune clé secrète Supabase dans le frontend | `IMPLEMENTED_TESTED_LOCAL` | Configuration navigateur limitée à URL et clé publishable | Inspection du bundle déployé. |

## Analyse et revue

| Gate | Statut | Preuve locale | Reste à valider |
| --- | --- | --- | --- |
| Viewpoint distinct du point actif | `IMPLEMENTED_TESTED_LOCAL` | Le worker n’émet aucune coordonnée depuis le seul viewpoint | Benchmark terrain indépendant. |
| Direction sans distance | `IMPLEMENTED_TESTED_LOCAL` | Secteur non publiable ou abstention | Calibration de l’incertitude. |
| Message seul sans géométrie | `IMPLEMENTED_TESTED_LOCAL` | Abstention conservée sans invention | Valeur analyste sur incidents réels. |
| Cross-view shadow | `IMPLEMENTED_TESTED_LOCAL` | Le contrat impose `shadow_only`, la persistance utilise l’état distinct `SHADOW` et le rattachement d’incident exclut encore méthode et provenance shadow | Benchmark indépendant avant toute promotion. |
| Hotspot incapable de créer un incident | `IMPLEMENTED_TESTED_LOCAL` | Contrat worker ciblé | Adaptateurs FIRMS/EFFIS réels. |
| Déclaration officielle crée seulement un candidat privé | `IMPLEMENTED_TESTED_LOCAL` | Contrat worker ciblé | Ingestion et revue d’une source officielle réelle. |
| Assertion externe structurée | `IMPLEMENTED_TESTED_LOCAL` | Sémantique par rôle, idempotence, secret et précision testés | Extraction automatique et revue fournisseur réelle. |
| Persistance méthode/modèle/révision/incertitude | `IMPLEMENTED_TESTED_LOCAL` | Le résultat worker retourne ses ancrages et preuves spatiales ; les ancrages inférés doivent viser le bundle, tandis qu’une preuve spatiale localisée doit exister à l’identique dans l’outbox persistante | Replay de modèles réels et branche spatiale de confiance. |
| Revue candidat | `IMPLEMENTED_TESTED_LOCAL` | Rejet, demande de preuve et contradiction testés | Correction structurée de faits et géométries. |
| Rattachement à un incident | `IMPLEMENTED_TESTED_LOCAL` | Rattachement et matérialisation de brouillons sans réanalyse testés | Matching assisté et fusion de candidats. |
| Validation analyste puis publication éditeur | `IMPLEMENTED_TESTED_LOCAL` | États, rôles, flag et nouvelle révision de snapshot couverts | Remplacement, rollback et UI live. |
| Plusieurs vues du même événement sans duplication | `PENDING` | Relations disponibles, fixture métier complète absente | Dataset multivue par incident et seuils d’association. |
| Contradictions conservées jusqu’à résolution | `IMPLEMENTED_TESTED_LOCAL` pour le marquage | Le candidat garde le contexte de contradiction | Graphe multi-source, blocage de fusion et résolution. |

## Sources externes et géométrie

| Gate | Statut | Preuve locale | Reste à valider |
| --- | --- | --- | --- |
| Domaines exacts et HTTPS | `IMPLEMENTED_TESTED_LOCAL` | URL hors allowlist, wildcard, signature et secret refusés | Redirections, DNS et SSRF avec broker réel. |
| Licence et attribution obligatoires | `IMPLEMENTED_TESTED_LOCAL` | Enregistrement incomplet refusé | Audit juridique par collection. |
| Même URL, nouveau hash : nouvelle révision | `IMPLEMENTED_TESTED_LOCAL` | Fixtures de révision et filiation | ETag et produit fournisseur réel. |
| Même hash, URLs différentes : miroir | `IMPLEMENTED_TESTED_LOCAL` | Fixture miroir locale | Portails réels. |
| Correction et rétractation immuables | `IMPLEMENTED_TESTED_LOCAL` | Nouvelle révision, filiation et triggers locaux | Triggers PostgreSQL réels et propagation publique. |
| Même acquisition : une famille de preuve | `IMPLEMENTED_TESTED_LOCAL` | Capteur, plateforme, granule et pixel dédupliqués | Mappage FIRMS/EFFIS réel. |
| Prévision séparée de l’observation | `IMPLEMENTED_TESTED_LOCAL` | Contraintes de schéma et fixture | AROME/CAMS réels. |
| CRS incohérent bloquant | `IMPLEMENTED_TESTED_LOCAL` | CRS inconnu refusé, transformation locale contrôlée | Tests d’axes et datums avec produits IGN/Copernicus. |
| Colonnes PostGIS et GiST | `IMPLEMENTED_NOT_LIVE_VERIFIED` | DDL PostgreSQL compilé et migration présente | Upgrade/downgrade, index et requêtes sur PostGIS réel. |
| Watermark, lease et backoff | `IMPLEMENTED_TESTED_LOCAL` | Worker périmé refusé, backoff borné et succès testés ; cron privé et CLI raccordés | Déclenchement hébergé et scheduler concurrent multi-processus. |
| Collecte fournisseur live | `PENDING` ou `IMPLEMENTED_NOT_LIVE_VERIFIED` selon adaptateur | Voir `EXTERNAL_SOURCE_CONNECTORS.md` | Identifiants, quotas, droits, corrections et indisponibilités réels. |

## Enveloppes, progression et présentation

| Gate | Statut | Preuve locale | Reste à valider |
| --- | --- | --- | --- |
| Supports d’enveloppe normalisés | `IMPLEMENTED_NOT_LIVE_VERIFIED` | Table et clés étrangères présentes | Service de création et règles de majorité. |
| Une observation ne ferme pas un périmètre | `PENDING` | Règle contractuelle seulement | Test déterministe du futur moteur. |
| La fumée seule ne ferme pas une enveloppe | `PENDING` | Garde worker sur les propositions | Test du futur moteur d’enveloppe. |
| Surface brûlée distincte de l’activité | `PENDING` | Taxonomie et stockage externe séparés | Projection UI et tests de non-confusion. |
| Progression par deltas observés | `PENDING` | Table présente | Calcul, revue et replay. |
| Formulaire et reçu frontend | `IMPLEMENTED_TESTED_LOCAL` | Tests composants, types et build locaux | Navigateur contre Supabase/backend/Blob réels. |
| Revue unifiée frontend | `IMPLEMENTED_TESTED_LOCAL` | Tests de permissions, contrat et rendu local | Recette navigateur avec média volumineux et session réelle. |
| Projection événementielle 3D et fallback 2D | `IMPLEMENTED_TESTED_LOCAL` | Points, segments et incertitudes v2 suivent l’instant sélectionné ; SVG 2D et texte restent disponibles sans WebGL | Recette navigateur réelle, LOD, accessibilité complète et performance terrain. |
| Timeline publique v2 | `IMPLEMENTED_TESTED_LOCAL` | Endpoint issu des snapshots non rétractés, réponse fermée, cache court et projection frontend strictement v2 lorsqu’elle est disponible ; aucun mélange géométrique ou temporel v1/v2 | Comparaison shadow v1/v2, replay complet et recette déployée. |
| Immutabilité défensive des snapshots | `IMPLEMENTED_TESTED_LOCAL` | Géométries canoniques, revérification de `payload_sha256`, payload immuable, suppression interdite et unique rétractation auditée couvertes sur SQLite | Exercices équivalents sur PostgreSQL réel, sauvegarde et restauration. |
| Artefact OpenAPI versionné | `IMPLEMENTED_TESTED_LOCAL` | `openapi/openapi.json` régénéré contient la timeline publique et les transitions internes, dont la rétractation | Contrôle de dérive en CI et publication éventuelle du SDK. |
| Rétractation publique v2 | `IMPLEMENTED_TESTED_LOCAL` | Route éditeur, transition vers `RETRACTED`, motif/acteur conservés et timeline vidée | Propagation cache et recette Supabase/PostgreSQL live. |
| Remplacement et rollback publics v2 | `PENDING` | Schéma de filiation seulement | Actions, restauration et replay. |

## Manifeste de replay cible

Le replay complet reste `PENDING`. Son manifeste devra contenir :

- `event_candidate_id`, hash et révision de source ;
- snapshot privé autorisé du `Viewpoint` ;
- intervalle temporel ;
- hashes des preuves et artefacts parents ;
- révisions de contrats, modèles et packages spatiaux ;
- stages exécutés, ignorés et échoués ;
- paramètres, seed et profil matériel ;
- requêtes externes, collection, objet, révision et temps de collecte ;
- CRS natifs, transformations et datums ;
- tentatives de localisation et reason codes ;
- associations, contradictions et supports d’enveloppe ;
- décisions humaines référencées, sans les rejouer comme sorties de modèle ;
- snapshot public et identifiant de rollback.

## Incidents et fixtures minimales avant promotion

1. message seul, viewpoint connu, abstention géométrique ;
2. vue large avec viewpoint, ancrage et raycast ;
3. vue proche sans distance, secteur ou abstention ;
4. deux viewpoints soutenant le même événement ;
5. deux événements distincts proches dans le temps ;
6. hotspot FIRMS et EFFIS issus de la même acquisition ;
7. page officielle mise à jour à la même URL ;
8. surface brûlée et zone active distinctes ;
9. observation météo et prévision séparées ;
10. source corrigée puis rétractée ;
11. migration puis rollback sur copie PostGIS ;
12. replay d’un incident de référence avec hashes identiques.

## Preuves locales enregistrées le 2026-08-03

- backend : suite complète `331 passed` ; sous-suites rejouées séparément : `67 passed` sur l’événementiel, la sécurité des preuves, les sources externes, le runtime et la migration, puis `20 passed` sur les gardes HTTP et le contrat OpenAPI ;
- assertions externes : `3 passed` sur `test_external_claims.py` ;
- adaptateurs, registre et scheduler externes : `20 passed` sur `test_official_connectors.py`, `test_external_source_registry.py` et `test_external_source_scheduler.py` ; Ruff et mypy strict ciblés réussis ;
- worker : `59 passed` sur le pipeline événementiel, le handler, les adaptateurs et les contrats associés ;
- frontend contribution/auth/timeline/3D/revue : `236 passed`, `4 skipped` sur la suite complète ; `29 passed` sur la revue et la projection publique ciblées ; vérification TypeScript et build Vite réussis ;
- la revue frontend n’a pas été contrôlée visuellement avec une session Supabase réelle ; ses preuves restent des tests jsdom et de contrat ;
- migration : compilation hors ligne du DDL PostgreSQL réussie, sans exécution sur PostgreSQL/PostGIS.

## Gate de promotion

La promotion publique exige encore :

- migration, sauvegarde et restauration sur une copie PostGIS ;
- Supabase, Blob, ClamAV et worker réels ;
- au moins un connecteur fournisseur validé live avec licence ;
- replay d’un incident de référence ;
- métriques de localisation en mètres et calibration de l’abstention ;
- projection publique v2, rollback et parité 2D/3D ;
- contrôle de dérive OpenAPI en CI et publication éventuelle du contrat consommable ;
- validation sécurité et décision de promotion documentée.
