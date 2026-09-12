# Organisation de Fireviewer_doc

Source canonique : **[fireviewer/Fireviewer_doc](https://github.com/fireviewer/Fireviewer_doc)**. Responsabilité technique : **FV**. Accès : **public**.

Documentation de référence et organisation du projet.

## Où travailler et commiter

Dans le workspace organisé, ouvrir **`actifs/fireviewer/Fireviewer_doc`**. Chaque dossier est un dépôt Git autonome. Créer une branche de chantier dans ce dépôt ; pour un travail parallèle, créer un worktree sous `travaux/<chantier>/<composant>`. Ne jamais commiter depuis la racine multi-dépôts, `archives/` ou un ancien chemin de compatibilité.

Architecture, responsabilités, contrats décrits, limites de qualification et guide des dépôts.

Les secrets, journaux privés et procédures internes vont dans fireviewer-docker ou restent locaux.

Avant un commit : vérifier `git rev-parse --show-toplevel`, `git remote -v`, `git status --short` puis `git diff --check`. Ajouter les fichiers nommément après revue. Les modifications de plusieurs composants donnent des commits distincts, reliés par leurs versions et contrats.

## Reprendre la vérification

```text
git diff --check
```

Suivre les prérequis et verrous du dépôt. Les packages privés sont téléchargés avec les accès limités prévus ; aucun dossier source voisin ne doit être nécessaire. Les secrets et fichiers `.env` réels, données, poids, corpus et sorties restent hors Git.

## Droits, historique et limites

Les licences, auteurs et notices historiques sont conservés. La responsabilité technique UWD/FV et la visibilité GitHub ne constituent pas une cession signée. Les droits tiers restent distincts.

Les anciens dépôts `fireviewer-spatial`, `fireviewer-sdg` et `models` sont remplacés et conservés en archives restaurables hors de l’organisation active. Les anciens imports nécessaires restent dans les adaptateurs explicitement maintenus. Les références historiques dans les notices et reçus gardent leur date.

La généralisation agentique des périmètres/photos, les recettes fournisseurs/modèles et Unreal natif auparavant inachevées gardent leurs propres critères de réception. Aucun succès CPU ne les déclare réalisés.

[README](README.md) · [Organisation générale](https://github.com/fireviewer/Fireviewer_doc/blob/main/docs/public/ORGANISATION.md)
