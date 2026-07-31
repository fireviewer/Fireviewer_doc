# Sécurité et périmètre FireViewer

## Positionnement

FireViewer est un projet communautaire expérimental de documentation et de visualisation. Il n’est pas :

- un service d’alerte ;
- une source officielle ;
- un système de commandement ;
- un outil de conduite des secours ;
- un substitut aux consignes des autorités ;
- une preuve légale ou opérationnelle automatique.

## Règles de sécurité

### Aucune confirmation automatique

Un détecteur, un VLM, un produit satellite, un OCR ou une recherche de source ne confirme jamais seul un incendie.

### Aucune publication automatique

Les sorties IA restent privées jusqu’à une décision humaine explicite. Les faits, géométries, rapports et médias sont validés séparément.

### Aucune coordonnée générative

Ministral, MolmoPoint, DINOv3 et les autres modèles génératifs ou visuels ne produisent pas de latitude ou longitude faisant autorité.

La position finale, lorsqu’elle est proposée, vient d’une passe géométrique versionnée et vérifiable.

### Abstention

Le système doit pouvoir répondre :

- non applicable ;
- preuve insuffisante ;
- ancrage visuel ambigu ;
- géométrie insuffisante ;
- revue humaine nécessaire ;
- échec contrôlé.

Une abstention n’est pas une erreur à masquer.

### Absence d’EXIF

L’absence d’EXIF ne rend pas le média inutile. Elle limite la branche spatiale mais n’empêche pas la détection, la transcription, l’OCR, la chronologie ou la revue.

### OCR et texte visible

Le texte lu dans une image est un indice. Il peut être ancien, ajouté, manipulé ou hors contexte. Il exige une corroboration.

## Données et consentement

- les médias utilisateurs restent privés par défaut ;
- le consentement et la provenance sont enregistrés ;
- la modération d’un média est distincte de la validation d’une analyse ;
- une correction humaine n’entre pas automatiquement dans l’entraînement ;
- les incidents actifs sont exclus des corpus d’entraînement ;
- les demandes de retrait doivent pouvoir purger les dérivés concernés.

## Observation, estimation et simulation

Les couches suivantes restent séparées :

- observations directes ;
- surfaces brûlées observées ;
- zones revues humainement ;
- enveloppes d’incertitude ;
- simulations.

Une simulation n’est jamais présentée comme une observation.

## Recherche externe

Le worker ne dispose pas d’un réseau libre. Toute recherche passe par un courtier contrôlé avec :

- outils bornés ;
- hôtes autorisés ;
- journalisation ;
- archivage du contenu ;
- protection contre les instructions contenues dans les pages récupérées.

## Gestion des incidents techniques

Le backend conserve :

- kill switch ;
- suspension ;
- audit append-only ;
- dead letters ;
- retrait ;
- rollback ;
- statuts partiels.

Un échec de validation doit être détecté, contenu et journalisé. L’objectif n’est pas de faire disparaître les rejets.
