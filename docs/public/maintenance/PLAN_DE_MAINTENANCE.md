# Plan de maintenance documentaire

## À chaque changement de code significatif

- mettre à jour le README du composant ;
- si le contrat public ou la responsabilité change, mettre à jour `Fireviewer_doc` dans la même fenêtre de release ;
- conserver versions, migrations et identifiants de compatibilité ;
- ne pas rafraîchir une date de test sans nouveau test.

## À chaque nouvelle release modèle/dataset

- figer révision, corpus, protocole et résultats ;
- publier les droits et attributions avant ou avec la ressource ;
- vérifier que la card ne contredit pas la visibilité du repo ;
- vérifier que le Dataset Viewer ou l'exemple de chargement fonctionne ;
- mettre à jour l'index HF de l'organisation sans conserver d'anciens modèles comme « actuels » par défaut.

## Revue mensuelle légère

- inventaire des repos GitHub actifs ;
- inventaire HF actuel ;
- liens cassés ;
- visibilité public/privé ;
- licences/cards absentes ;
- statut « current » devenu historique ;
- ressources retirées/superseded ;
- URLs institutionnelles et contacts.

Une revue mensuelle documentaire ne nécessite pas de retester toutes les capacités fonctionnelles ; elle doit simplement ne pas confondre son propre contrôle avec une nouvelle qualification du logiciel.
