# Sécurité et confidentialité du pipeline événementiel

**Contrôles locaux :** `IMPLEMENTED_TESTED_LOCAL`

**Supabase, Blob, ClamAV et audit déployés :** `IMPLEMENTED_NOT_LIVE_VERIFIED`

**Révocation globale des sessions et redaction avancée :** `PENDING`

## Données sensibles

Le viewpoint peut révéler un domicile, un déplacement, une caméra privée ou la position d’un intervenant. Il reste privé par défaut, indépendamment de la publication d’une activité.

Les catégories sensibles incluent :

- position précise d’un contributeur ;
- EXIF et identifiants appareil ;
- visage, voix, plaque et domicile ;
- victimes et mineurs ;
- position ou mouvement d’équipes d’intervention ;
- infrastructures critiques et points tactiques ;
- secrets d’API, tokens et URL signées.

## Identité et autorisation présentes

- le navigateur utilise `supabase-js` avec URL et clé publishable uniquement ;
- le backend vérifie les JWT asymétriques via le JWKS Supabase ;
- le rôle `contributor` est implicite après vérification de l’email ;
- les rôles élevés sont lus uniquement depuis `app_metadata.roles` ;
- `user_metadata` n’intervient dans aucune décision d’autorisation ;
- les routes internes revalident le rôle courant auprès de Supabase ;
- la publication exige un jeton récent, une session active et un rôle éditeur courant ;
- en staging et production, v2 refuse de démarrer sans mode Supabase ;
- le mode administrateur local reste limité au développement ou au secours.

La revalidation live empêche un rôle retiré d’accéder aux routes élevées même si son JWT n’a pas encore expiré. La révocation de toutes les sessions Supabase lors d’une modification de rôle nécessite encore un hook d’administration et reste `PENDING`.

## Séparation des autorisations

Les autorisations suivantes restent indépendantes :

- analyser la contribution ;
- conserver les preuves ;
- publier un dérivé ;
- publier ou généraliser le viewpoint ;
- utiliser ultérieurement une correction dans un corpus d’entraînement.

Le contrat v2 exige l’analyse et la rétention pour accepter une contribution. Le consentement `public_derivative` est séparé et vaut `false` par défaut ; la transition de publication refuse toute preuve contributeur lorsque ce consentement est absent. Aucun consentement à l’entraînement n’est déduit de ces champs.

## Viewpoint

### Réponses contributeur

Le reçu contient seulement :

- précision horizontale ;
- origine ;
- présence éventuelle d’une orientation ;
- `exact_position_withheld=true`.

Longitude, latitude, altitude, yaw, FOV et label exact ne sont jamais renvoyés sur `/api/v2/me`.

### Revue privée

Le bundle interne contient le viewpoint exact pour les rôles élevés courants. Les routes `/api/v2/internal` et `/api/v2/me` sont couvertes par une politique `no-store`.

### Publication

Le snapshot public créé par la transition locale exclut le viewpoint exact. Une généralisation ou publication volontaire du lieu de prise de vue reste `PENDING` et exigera consentement explicite, décision éditoriale et contrôle de sensibilité.

## Preuves privées

L’ingestion applique :

- stockage privé ;
- noms simples sans traversée de chemin ;
- allowlist MIME et extension correspondante ;
- limites par fichier, type et contribution ;
- vérification de taille, signature réelle et SHA-256 côté serveur ;
- état de quarantaine et scan antivirus ;
- rattachement uniquement après finalisation ;
- contrôle de propriété avant upload, finalisation et contribution.

Une preuve n’est consultable en revue que si elle est `VERIFIED` et `CLEAN`. La réponse utilise `private, no-store` et `X-Content-Type-Options: nosniff`.

En staging et production, `FV_EVENT_V2_ENABLED=true` exige ClamAV. Le démon réel, Vercel Blob, les vidéos proches de la limite et les range requests n’ont pas encore été validés. La lecture interne actuelle doit être rendue streamée avant d’accepter des vidéos volumineuses en production.

## Anti-IDOR

- la liste contributeur est filtrée par sujet authentifié ;
- le détail d’un autre contributeur est refusé sans révéler son contenu ;
- un asset doit appartenir au même contributeur et au bon lot ;
- les médias internes exigent un rôle élevé revalidé ;
- les tests locaux couvrent l’isolation des reçus et des médias.

Une campagne de sécurité déployée reste requise avant promotion.

## Recherche et connecteurs

Les services du registre imposent :

- HTTPS ;
- domaines exacts sans wildcard ;
- URL canonique ;
- rejet des paramètres de signature et secrets persistés ;
- licence et attribution obligatoires ;
- statut, hash, ETag et filiation ;
- CRS connu pour toute géométrie ;
- réseau PROJ désactivé pendant les transformations.

Les adaptateurs HTTP doivent en plus imposer validation des redirections, délais, tailles, types de contenu, pagination bornée et transport des secrets uniquement côté serveur. Le contenu externe est une donnée non fiable, jamais une instruction pour un agent.

Un organisme public peut republier des contenus soumis à des droits tiers. Les logos, photographies et contenus sociaux ne sont jamais présumés libres. Chaque collection conserve licence, attribution et restrictions.

## Minimisation et rétention

Le nettoyage présent :

- sélectionne un lot expiré dont aucun asset n’est rattaché ;
- verrouille et recontrôle tout le lot ;
- supprime uniquement son préfixe objet ;
- marque chaque asset et conserve une tombstone auditable ;
- journalise le nombre de lots, d’assets, d’octets et les échecs ;
- laisse un échec retryable ;
- ne touche jamais une preuve rattachée durable.

La redaction automatisée des visages, plaques, EXIF, documents sensibles et dérivés publics reste `PENDING`. Aucun incident actif ne doit être utilisé pour l’entraînement.

## Publication

Avant une promotion publique complète, il faut encore prouver :

- décision analyste puis éditeur ;
- contrôle des droits ;
- redaction des données personnelles ;
- contrôle des informations tactiques ;
- provenance affichable ;
- fraîcheur et limites ;
- retrait, remplacement et rollback ;
- absence de viewpoint dans toutes les projections publiques ;
- restauration après incident.

Une source officielle est attribuée comme telle. FireViewer ne transforme pas cette attribution en « confirmation FireViewer ».

## Audit et réponse aux incidents

Les créations, transitions, publications, échecs de dispatch et purges produisent des traces d’audit locales. Les révisions d’artefacts et filiations externes sont append-only dans la migration.

Restent à valider dans l’environnement réel :

- accès aux journaux sensibles ;
- export et retrait d’une preuve ;
- rotation et révocation des secrets ;
- désactivation d’urgence des connecteurs ;
- dead letters et reprise ;
- rollback d’une projection publique ;
- notification et réponse à un incident de sécurité.
