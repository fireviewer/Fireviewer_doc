# Replay et provenance

## Objectif

Un résultat doit pouvoir être expliqué et, lorsque les dépendances le permettent, rejoué à partir des mêmes entrées et révisions.

## Manifeste de replay

Le manifeste conserve :

- identifiant du lot ;
- identifiant du média ;
- empreinte du média ;
- artefacts parents ;
- contrats ;
- stages exécutés ;
- stages non applicables ;
- abstentions ;
- modèle et révision ;
- paramètres d’inférence ;
- seed lorsqu’elle existe ;
- profil matériel ;
- versions runtime ;
- sorties ;
- erreurs ;
- temps et ressources mesurés ;
- trace d’audit.

## Résultats partiels

Un résultat partiel est conservé uniquement si :

- son stage est terminal ;
- son schéma est valide ;
- ses artefacts existent ;
- ses parents sont vérifiables ;
- les étapes manquantes sont explicites.

## Recherche externe

Le replay enregistre :

- requête ;
- outil ;
- URL ;
- date de collecte ;
- contenu archivé ;
- empreinte ;
- extraits utilisés ;
- liens vers les observations.

## Limites

Un replay peut différer lorsqu’une dépendance externe non archivée a changé. Cette limite doit être déclarée au lieu d’être masquée.
