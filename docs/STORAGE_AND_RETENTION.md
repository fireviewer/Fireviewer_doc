# Politique de stockage et de rétention FireViewer

## Objet

Cette politique définit où résident le code, les données, les modèles, les
travaux temporaires, les exports et les archives FireViewer. Elle empêche les
copies lourdes dans les dépôts Git, l'accumulation de checkpoints et la
suppression d'un artefact avant preuve de récupération.

Elle s'applique aux cinq dépôts produit, au dépôt documentaire, aux outils
d'entraînement, aux productions spatiales, aux simulations Omniverse et aux
ressources Docker utilisées par FireViewer.

## Autorité et périmètre actif

Les dépôts actifs sont :

- `Fireviewer_doc` ;
- `fireviewer-frontend` ;
- `fireviewer-backend` ;
- `fireviewer-ai-worker` ;
- `fireviewer-spatial` ;
- `fireviewer-sdg`.

L'ancien monorepo conserve un historique et des travaux locaux qui doivent être
inventoriés puis archivés. Il ne reçoit plus de nouveau dataset, cache, export
ou worktree tant que sa fermeture n'est pas terminée.

## Arborescence logique obligatoire

Les chemins physiques sont locaux et injectés par variables d'environnement.
Ils ne sont jamais versionnés. Une machine matérialise les classes suivantes :

```text
<FV_STORAGE_ROOT>/
  data/          # sources et datasets canoniques
  models/        # modèles de base et releases vérifiées
  work/          # jobs actifs, caches et temporaires bornés
  exports/       # livrables immuables et validés
  quarantine/    # lots récupérables en attente de décision
  archive/       # historiques gelés
  receipts/      # petits reçus de provenance et de récupération
```

| Classe | Variable | Contenu autorisé | Contenu interdit |
| --- | --- | --- | --- |
| `CODE` | `FV_CODE_ROOT` | dépôts Git, configurations, schémas, petits fixtures | datasets, poids, caches, environnements, runs |
| `DATA` | `FV_DATA_ROOT` | sources traçables, corpus normalisés, manifests, splits | copies de publication et archives monolithiques redondantes |
| `MODEL` | `FV_MODEL_ROOT` | modèles de base immuables, `best`, `last`, exports finaux | checkpoints périodiques non bornés |
| `WORK` | `FV_WORK_ROOT` | `active/<job_id>`, cache, temp, logs rotatifs | référence durable ou livrable unique |
| `EXPORT` | `FV_EXPORT_ROOT` | packages validés, contrats, provenance, sommes et reçus | cache de génération et fichiers sans identité |
| `QUARANTINE` | `FV_QUARANTINE_ROOT` | lots datés, récupérables, avec inventaire et motif | suppression automatique |
| `ARCHIVE` | `FV_ARCHIVE_ROOT` | historique gelé, bundle Git, anciennes productions nécessaires | développement actif et cache mutable |
| `RECEIPT` | `FV_RECEIPT_ROOT` | JSON, rapports, commandes assainies, révisions et SHA-256 | média, modèle ou dataset complet |

La correspondance locale est fournie par un fichier non versionné référencé par
`FV_STORAGE_CONFIG`. Le modèle
[`templates/storage-layout.local.example.json`](../templates/storage-layout.local.example.json)
ne contient aucun chemin personnel.

## Règles de placement

1. Un dépôt Git ne contient que du code et de petits fixtures. Tout répertoire
   `data`, `models`, `outputs`, `runs`, `artifacts`, `cache` ou environnement
   local lourd réside sous la racine de stockage et peut être exposé à un ancien
   chemin par une jonction déclarée.
2. Une donnée possède une seule copie physique canonique. Une vue de publication
   sur le même volume utilise des hardlinks lorsque le format le permet et
   l'indique dans son manifeste.
3. Un audit distingue toujours taille logique et occupation physique. Il ne
   suit pas les points de jonction et ne présente pas deux hardlinks comme deux
   gains récupérables.
4. Aucun nouveau worktree FireViewer n'est créé dans un répertoire temporaire
   générique. Les worktrees résident sous `FV_WORK_ROOT/worktrees` et sont
   déplacés ou supprimés avec `git worktree`, jamais par effacement brut.
5. Les caches Hugging Face, UV, pip, npm, Omniverse et modèles sont dédiés à une
   racine déclarée, bornés et distincts des releases. Un cache partagé n'est pas
   purgé sans inventaire de ses consommateurs.
6. Une source spatiale non reproductible ou nécessaire à la provenance reste
   canonique. Les dérivés reproductibles peuvent être purgés uniquement après
   vérification du manifeste, du générateur et des entrées.
7. Les simulations complètes restent privées. La scène publique ne contient que
   la carte et ses couches autorisées.
8. Docker reste géré par Docker Desktop. Son VHDX n'est jamais supprimé ou
   déplacé manuellement et aucun `docker system prune` global n'est autorisé.

## Budget disque

Avant une génération, un téléchargement ou un entraînement lourd :

```text
espace_requis = données matérialisées
              + deux checkpoints estimés
              + plus gros shard ou export temporaire
              + marge de 15 %
```

Le lancement est refusé lorsque le volume de travail ne conserve pas le plus
grand des deux seuils suivants après allocation :

- 100 Gio libres ;
- 15 % de la capacité du volume.

Chaque job déclare aussi un budget maximal et une date de revue. Le disque
système ne reçoit aucun payload FireViewer lourd, dataset, environnement GPU,
worktree durable ou cache de modèle.

## Cycle de vie et rétention

| Objet | Règle de rétention | Gate avant retrait |
| --- | --- | --- |
| cache de test, type ou build | revue après 7 jours, budget explicite | aucun PID actif, source et commande de reconstruction connues |
| logs | rotation par taille et date ; reçus séparés | diagnostic clos et reçu conservé |
| dataset de travail | un seul corpus matérialisé par train | révision distante immuable et inventaire distant complet |
| run d'entraînement | `best` et `last` au maximum | processus arrêté, export testé, publication et récupération vérifiées |
| modèle final | conservation locale jusqu'à preuve distante | fichiers obligatoires, tailles, révision et smoke final confirmés |
| export spatial ou simulation | immuable tant qu'il est référencé | consommateurs résolus, manifeste et SHA-256, copie privée vérifiée si nécessaire |
| export supersédé ou rejeté | déplacement en quarantaine | motif, identité, taille, provenance et copie canonique consignés |
| quarantaine | revue sous 30 jours, jamais d'auto-suppression | approbation explicite du lot exact |
| ancien monorepo | gel puis archive | branches, worktrees et changements sales récupérés ; bundle et inventaire vérifiés |

Un succès d'upload n'est jamais une preuve de récupération. Pour Hugging Face,
Blob ou un autre stockage distant, le gate exige l'inventaire distant, la
révision immuable, les tailles attendues et, lorsque pertinent, un
téléchargement de contrôle. Un dépôt privé inaccessible avec l'identité locale
reste `NON VÉRIFIÉ`.

## Déplacement avec chemin de compatibilité

Lorsqu'un ancien outil impose un chemin :

1. arrêter et identifier les processus consommateurs ;
2. résoudre la source et la destination absolues et refuser tout reparse point
   inattendu ;
3. copier ou déplacer vers la racine canonique ;
4. comparer le nombre de fichiers, les octets et les SHA-256 des artefacts
   critiques ;
5. conserver l'original tant que la comparaison n'est pas complète ;
6. créer une jonction au chemin historique ;
7. vérifier la cible, les comptes et un smoke du consommateur ;
8. retirer la sauvegarde seulement après approbation du lot exact.

Une vue de publication créée par hardlinks est supprimée comme une vue, sans
annoncer sa taille logique comme espace récupéré.

## Procédure de nettoyage obligatoire

Tout nettoyage suit cet ordre :

1. inventaire en lecture seule avec exclusion des reparse points ;
2. classement `CANONIQUE`, `REPRODUCTIBLE`, `CACHE`, `QUARANTAINE`,
   `DOUBLON_PROUVÉ` ou `INCERTAIN` ;
3. résolution des propriétaires, consommateurs, processus et manifests ;
4. SHA-256 pour les doublons de même taille ;
5. plan de prévisualisation listant chaque chemin et son gain réaliste ;
6. approbation explicite séparée pour chaque catégorie ou lot exact ;
7. exécution bornée, sans glob destructif ni racine calculée ;
8. vérification d'absence, de compatibilité et d'espace libre ;
9. reçu final conservé sous `FV_RECEIPT_ROOT`.

Les commandes suivantes sont interdites dans ce workflow :

- suppression brute d'un VHDX Docker ou d'un stockage applicatif ;
- `git clean -fdx`, `git reset --hard` ou suppression brute d'un worktree ;
- prune global de Docker, Hugging Face ou d'un cache partagé ;
- suppression fondée seulement sur le nom, la taille ou l'ancienneté ;
- parcours récursif qui suit une jonction ;
- suppression d'une simulation privée avant upload, SHA-256 et téléchargement
  authentifié de bout en bout.

## Contrôle périodique

Le script [`scripts/audit-fireviewer-storage.ps1`](../scripts/audit-fireviewer-storage.ps1)
mesure les racines déclarées sans déplacer ni supprimer de fichier. Il utilise
`robocopy /L /XJ`, signale les reparse points, les chemins manquants et le seuil
d'espace libre, puis écrit un rapport JSON et Markdown local.

La revue est exécutée :

- avant tout job estimé à plus de 10 Gio ;
- après chaque publication de dataset, modèle ou simulation ;
- avant création d'un worktree ou d'une nouvelle copie locale ;
- au minimum une fois par mois.
