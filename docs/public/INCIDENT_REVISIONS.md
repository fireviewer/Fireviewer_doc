# Migration vers les révisions temporelles d'incident

Mise à jour du 24 septembre 2026 : le backend 0.1.5 et le frontend 1.0.4 sont déployés
sur les services existants, avec le pilote de révisions activé. Cette réception ne qualifie
pas les modèles et fournisseurs sur des preuves réelles et ne clôt pas l'étape 4.

L'incident et son épisode conservent leur identité. Un état possède un instant de validité, une
coupure de connaissance et une révision immuable. La journée devient une lecture de ces états ; les
consommateurs et protocoles quotidiens historiques restent disponibles pendant la transition.

## Contrats et responsabilités

| Contrat | Responsabilité |
| --- | --- |
| `TemporalEvidence` | Version de preuve, dates, admission, droits et observations traçables. |
| `IncidentUpdateRequest` | Instant, connaissance, mode causal/rétrospectif et demande idempotente. |
| `IncidentStateRevision` | Géométries, preuves exactes, profil, contexte spatial et limites. |
| `IncidentUpdateResult` | Calcul créé/inchangé ou attente explicite d'initialisation, preuve ou enrichissement. |

Le backend garde le stockage, les droits, les travaux durables et les décisions. Fire State calcule
sur des entrées explicites. L'orchestration prépare et exécute les enrichissements conditionnels.
UWD reste responsable du terrain générique ; FV reste responsable des couches incendie.

Les dates d'observation, de réception, de connaissance et de calcul sont distinctes. Les intervalles
sont semi-ouverts. Les coupures quotidiennes respectent les fuseaux et changements d'heure.
Une preuve tardive peut corriger une reconstruction rétrospective sans modifier un résultat causal
figé. Une preuve de date inconnue ou un enrichissement en échec reste explicitement en attente.

## Interfaces et carte

Le site web conserve son interface : **Calques enregistrés**, tableau **Références de preuve**,
rubrique de **publication spatiale** et **frise de l'Atlas** accueillent les révisions.
La revue et la publication restent dans l'administration web. L'application Android ne possède pas
d'espace d'administration et n'est pas modifiée par ce raccordement.

Le périmètre reste une couche produite pour l'incident et son contexte spatial, affichée sur la carte
qui lui est rattachée. Les géométries gardent leurs trous et secteurs séparés. Une réponse appartenant
à un autre incident est refusée ; aucune interpolation de périmètre n'est inventée entre deux états.
La carte complète de Die est conservée. Le terrain peut être publié après réception technique,
indépendamment des décisions nécessaires aux résultats de calcul et aux sorties IA.

Approuver une révision ne la publie pas. Une publication exige l'accord sur cette révision précise et
des droits de diffusion compatibles. Une correction commence en attente, non publiée ; elle n'hérite
jamais de l'accord précédent. Les décisions anciennes restent dans l'historique.

## État des étapes

1. Contrats, règles temporelles et cas de recette définis.
2. Persistance additive des preuves, révisions, dépendances et décisions implémentée.
3. Fusion à un instant extraite avec adaptateur quotidien conservé.
4. Raccordements aux producteurs existants et interfaces web déployés dans le pilote activé.
   La qualification PostgreSQL concurrente et les contrôles des routes déployées ont réussi.
   Les reçus de workers sont vérifiés ; cela ne prouve pas l'exécution de chaque modèle
   et fournisseur sur des médias réels. L'enrichissement automatique complet reste à recevoir.
5. Ancien chemin conservé jusqu'à validation complète de ses remplaçants.

Les tests de navigateur à petit écran qualifient le site web responsive, pas l'application Android.
Les tests CPU et installations isolées ne remplacent ni la calibration, ni une recette native Unreal,
ni l'acceptation avec services déployés et preuves réelles.

## Réception datée du 24 septembre 2026

Le backend 0.1.5 a passé 843 tests, sans échec ni test ignoré, dont les recettes
PostgreSQL de concurrence et d'immuabilité. La sauvegarde a été restaurée et migrée
en recette avant la migration réelle. Les contrôles publics et de refus d'accès anonyme
ont réussi. Les tâches existantes de publication des cartes et de sources officielles
ont terminé avec succès sur la nouvelle version ; le pipeline événement manuel n'a
pas été exécuté en production pour la recette.

La carte complète de Die a été contrôlée visuellement en 2D et 3D, avec ses modes
Naturel/Altitude, périmètres, photos et changement de date. Les vérifications complémentaires
de l'accueil, du compte et du site à petit écran restent ouvertes. Les décisions et corrections
sont exercées avec des fixtures isolées ; aucun faux contenu n'a été publié pour les tester.

La migration d'hébergement vers AWS est en préparation et n'est pas déclarée terminée.
Les reçus d'exploitation détaillés restent dans la documentation privée d'infrastructure.
