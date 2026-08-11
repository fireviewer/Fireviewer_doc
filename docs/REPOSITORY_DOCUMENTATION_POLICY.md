# Politique documentaire inter-dépôts FireViewer

## Objet

Ce document fixe l’autorité, la portée et la synchronisation de la documentation FireViewer. Il évite qu’un README, un guide d’exploitation ou le profil GitHub de l’organisation présente une architecture, un statut ou une promesse différente du contrat canonique.

## Hiérarchie d’autorité

En cas de divergence, l’ordre suivant s’applique :

1. les ADR et contrats versionnés de `Fireviewer_doc` ;
2. la matrice de statut et la terminologie de `Fireviewer_doc` ;
3. les documents spécialisés sous `repositories/<repo>/docs` ;
4. les README et guides d’exploitation du dépôt producteur ;
5. le profil GitHub de l’organisation et les descriptions de dépôts.

Un document de niveau inférieur résume ou référence le niveau supérieur. Il ne modifie pas seul une décision produit, un contrat inter-dépôts ou le statut de validation d’une capacité.

## Responsabilités

| Dépôt | Responsabilité documentaire locale | Références canoniques principales |
| --- | --- | --- |
| `Fireviewer_doc` | doctrine produit, architecture inter-dépôts, contrats, sécurité, migration, stockage et statut | `ARCHITECTURE.md`, `STATUS_MATRIX.md`, `TERMINOLOGY.md`, `CONTRACT_MAP.md`, `STORAGE_AND_RETENTION.md` |
| `fireviewer-backend` | API, persistance, migrations, sécurité serveur, connecteurs et publication | `EVENT_API_V2.md`, `EVENT_AND_PROVENANCE_V2.md`, `SECURITY_PRIVACY_EVENT_PIPELINE.md` |
| `fireviewer-frontend` | contribution, authentification cliente, revue, timeline et vues 3D/2D | `EVENT_API_V2.md`, `MIGRATION_AND_FEATURE_FLAGS.md`, `STATUS_MATRIX.md` |
| `fireviewer-ai-worker` | traitement des preuves, abstention, modèles, provenance et replay | `EVENT_AND_PROVENANCE_V2.md`, `ACCEPTANCE_AND_REPLAY_MATRIX.md`, `STATUS_MATRIX.md` |
| `fireviewer-spatial` | référentiels, CRS, terrain, packages spatiaux et validation géométrique | `EVENT_AND_PROVENANCE_V2.md`, `CONTRACT_MAP.md`, `STATUS_MATRIX.md` |
| `fireviewer-sdg` | génération synthétique, provenance, splits et validation réel/synthétique | `SAFETY_AND_SCOPE.md`, `ACCEPTANCE_AND_REPLAY_MATRIX.md`, `STATUS_MATRIX.md` |
| `fireviewer/.github` | présentation publique synthétique de l’organisation | README et matrice de statut canoniques |

## Doctrine commune obligatoire

Tous les dépôts et le profil d’organisation doivent présenter FireViewer comme une plateforme de documentation quasi temps réel des incendies centrée sur les événements, leur localisation, leur incertitude, leur chronologie et leur progression observée.

Ils doivent rappeler les frontières suivantes lorsqu’elles sont pertinentes :

- FireViewer n’est ni un service d’alerte, ni un outil de commandement, ni un moteur de prédiction de propagation ;
- une contribution associe un point de prise de vue privé, un temps, un message et éventuellement des médias ;
- le point de prise de vue n’est jamais assimilé au phénomène actif ;
- une sortie agentique peut proposer une localisation avec incertitude ou s’abstenir ;
- un analyste valide avant qu’un éditeur puisse publier ;
- la 3D est la vue principale et la 2D une expérience complète de secours ;
- les données officielles, satellitaires, les prévisions et les simulations conservent des rôles sémantiques distincts ;
- une fonctionnalité testée localement n’est pas présentée comme validée en production.

## Statuts et preuves

Une affirmation de capacité utilise les statuts de `STATUS_MATRIX.md`. Les documents d’exploitation distinguent au minimum :

- `OBSERVÉ` : présence constatée dans le code ou un artefact ;
- `VÉRIFIÉ` : contrôle exécuté avec commande, périmètre et résultat ;
- `NON VÉRIFIÉ` : gate non exécuté ou environnement indisponible ;
- `BLOQUÉ` : dépendance ou autorisation absente.

Un ancien rapport de test reste historique. Il ne prouve pas la révision courante sans date, commit, commande et périmètre associés.

## Documentation canonique et documents locaux

Les contrats inter-dépôts sont maintenus dans `Fireviewer_doc`. Les copies placées dans un dépôt producteur servent à rendre son exploitation autonome ; elles doivent :

- porter le même titre et le même sens que leur source canonique ;
- indiquer l’URL de la source canonique ;
- ne pas être modifiées isolément pour changer un contrat ;
- être resynchronisées dans le même lot documentaire qu’une évolution canonique.

Les détails propres à un dépôt — installation, commandes, variables, packaging et runbooks — restent locaux. Un guide v1 conservé pendant la migration doit être marqué explicitement comme historique ou compatible, sans suggérer une conversion automatique vers v2.

## Liens et terminologie

- Les liens inter-dépôts utilisent des URLs GitHub complètes ; les liens relatifs sont réservés aux fichiers du même dépôt.
- Les noms éditoriaux utilisent `FireViewer`.
- Les identifiants publiés ou immuables contenant `FireWarning` ou `firewarning` sont conservés et qualifiés d’identifiants historiques.
- Aucun chemin personnel, secret, jeton, dataset, checkpoint, log ou fichier de run ne doit apparaître dans la documentation publiée.

## Profil et métadonnées GitHub

Le modèle du profil public est maintenu dans `templates/organization-profile/README.md`. Le dépôt `fireviewer/.github` en contient la copie destinée à publication. Les descriptions, thèmes et pages d’accueil proposés sont suivis dans `templates/organization-profile/github-metadata.yaml`.

La préparation locale, le commit et le push sont des opérations distinctes. Une modification distante du profil ou des métadonnées exige une autorisation explicite et ne peut pas être déduite de l’alignement local.

## Gate de synchronisation

Avant commit d’un lot documentaire inter-dépôts :

1. vérifier les liens locaux et les URLs canoniques ;
2. rechercher les secrets et chemins personnels ;
3. comparer la terminologie aux contrats v2 ;
4. confirmer que les statuts ne dépassent pas les preuves disponibles ;
5. inspecter le diff indexé dépôt par dépôt ;
6. exclure explicitement datasets, modèles, caches, logs et fichiers de run.
