# Registre de preuves

## Objet

Le registre relie chaque observation, proposition et décision à ses entrées réelles.

## Entités

### Evidence source

Source originale : média, texte, capteur, produit satellite ou publication archivée.

### Evidence artifact

Artefact dérivé : frame, crop, segment audio, transcription, boîte, masque, heatmap, OCR, correspondances, pose ou raycast.

### Evidence link

Relation typée entre un artefact et son parent.

### Evidence use

Référence d’une observation ou d’une proposition vers l’artefact utilisé.

## Champs minimaux

- identifiant ;
- lot ;
- média ;
- type ;
- URI privée ;
- empreinte ;
- format ;
- dimensions ou durée ;
- parent ;
- modèle et révision ;
- contrat ;
- date de création ;
- statut de validation ;
- rétention ;
- trace d’audit.

## Règles

- un artefact ne traverse pas silencieusement les lots ;
- les `evidence_refs` doivent exister ;
- un retrait de source déclenche l’identification des dérivés ;
- une correction humaine crée une nouvelle révision ;
- une correction ne devient pas automatiquement une donnée d’entraînement ;
- les preuves brutes ne sont pas exposées dans la projection publique par défaut.
