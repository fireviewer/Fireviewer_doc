# Roadmap consolidée FireViewer

**Statut :** roadmap inter-dépôts pilotée par des gates de preuve  
**Principe :** aucun délai ou résultat n’est garanti par ce document

## G0 — Rétablir la source de vérité

### Travail

- maintenir l’architecture et la roadmap dans `fireviewer/.github` ;
- définir les statuts communs ;
- corriger les liens hérités de l’ancien monorepo ;
- marquer `charli-dev420/fireviewer` comme historique ;
- aligner la route canonique sur `/incident/{fire_id}` ;
- séparer le code public des résultats d’analyse privés ;
- retirer des documents actifs les chiffres sans artefact de benchmark.

### Gate

- les documents inter-dépôts ne se contredisent plus ;
- les liens canoniques sont valides ;
- aucun modèle n’est déclaré actif si son registre le désactive ;
- toute performance publiée référence une mesure archivée.

## G1 — Migrer Qwen vers Ministral et généraliser les stages

### Dépôts

- `fireviewer-ai-worker`
- `fireviewer-backend`

### Travail

- intégrer Ministral à révision fixe ;
- remplacer Qwen pour l’extraction, la recherche bornée et les rapports privés ;
- ajouter PP-OCRv6 comme stage CPU conditionnel ;
- remplacer l’ordre de rôles codé en dur par un graphe déclaratif ;
- conserver le verrou GPU et l’exécution séquentielle ;
- étendre les pré-gates et post-gates ;
- ajouter un manifeste de replay complet ;
- retirer les fallbacks Qwen silencieux.

### Gate

- les sorties structurées respectent leur schéma ;
- chaque affirmation acceptée référence une preuve ;
- Ministral ne produit aucun champ géographique ;
- un run peut être rejoué avec les mêmes entrées, contrats et révisions.

## G2 — Clarifier le rôle des détecteurs

### Mode normal

- image : D-FINE principal ;
- vidéo : RT-DETRv2 pour le triage, D-FINE sur les keyframes ;
- shadow : second détecteur sur échantillon ou incertitude ;
- validation : comparaison sur le corpus complet.

### Profils

- `production_cascade`
- `validation_quorum`
- `shadow_sampling`

### Challenger

RF-DETR est entraîné et évalué sur les mêmes splits FireViewer. La décision repose sur un compromis documenté, pas sur les seuls résultats externes.

### Gate

- le rappel des cas difficiles reste acceptable ;
- la calibration n’est pas dégradée sans justification ;
- le coût du profil est mesuré ;
- la contre-détection reste traçable.

## G3 — Construire le challenger segmentation-pointage

### Dépôts

- `fireviewer-ai-worker`
- `fireviewer-sdg`

### Données

Le SDG et les corpus réels doivent produire ou conserver :

- masque flamme ;
- masque fumée ;
- visibilité et occlusion ;
- base de flamme ;
- base de fumée visible ;
- front visible ;
- négatifs difficiles ;
- abstentions visuelles.

Les splits sont séparés par incident, zone, séquence et source.

### Modèle

```text
DINOv3
├─ tête segmentation
├─ tête heatmap
└─ tête abstention visuelle
```

Le premier pilote entraîne les têtes avec backbone gelé. Le déblocage de blocs supplémentaires dépend des résultats.

MolmoPoint reste primaire. SegFormer reste une baseline hors ligne. SAM sert à l’annotation et à la propagation.

### Gate

- le challenger est comparé à MolmoPoint et à la baseline ;
- l’abstention est évaluée séparément ;
- un point accepté respecte la zone admissible du masque ;
- la calibration est analysée sur réel et synthétique ;
- aucun incident opérationnel actif n’entre dans l’entraînement.

## G4 — Pilote de recalage des photos au sol

### Dépôts

- `fireviewer-spatial`
- `fireviewer-ai-worker`
- `fireviewer-sdg`

### Banque de rendus

La banque est limitée au package de l’incident et versionnée avec lui. Les poses sont priorisées autour des zones accessibles et pertinentes pour les prises de vue.

Un index local suffit pour le pilote. Une infrastructure nationale n’est pas une dépendance.

### Chaîne

```text
zone
→ retrieval
→ filtres métadonnées / horizon / FOV / relief
→ matching dense
→ points 2D-3D
→ PyCOLMAP
→ raycast MNT
→ uncertainty_envelope
```

MoGe reste auxiliaire.

### Gate

- les candidats, correspondances et poses sont inspectables ;
- les erreurs critiques sont consignées ;
- l’enveloppe est calibrée avant d’être présentée comme probabiliste ;
- le système s’abstient lorsque la pose ou le raycast n’est pas défendable.

## G5 — Recalage UAV et observation satellite

### UAV

Comparer sur les mêmes lots :

- AerialExtreMatch-RoMa ;
- RoMa v2 ;
- AdHoP/OrthoLoC ;
- autres challengers enregistrés.

La promotion dépend d’un benchmark FireViewer par domaine de vue.

### Satellite

Prithvi reste disponible comme étape auxiliaire. Les travaux portent sur les produits, leur géoréférencement, leur heure d’acquisition, leur footprint et leur confiance capteur.

Les types restent séparés :

- `observed_hotspot`
- `observed_burned_perimeter`
- `human_reviewed_active_zone`
- `simulated_scenario`

### Gate

- aucune sortie satellite ne confirme seule un incident ;
- le produit source et sa temporalité sont conservés ;
- les couches observées et simulées ne sont pas fusionnées.

## G6 — Revue humaine, shadow mode et promotion

### Interface

Afficher séparément :

- source ;
- détections ;
- masque ;
- heatmap ;
- point ;
- correspondances ;
- rendus candidats ;
- pose ;
- raycast ;
- enveloppe d’incertitude ;
- preuves textuelles et OCR ;
- raisons d’abstention.

### Actions opérateur

- corriger un masque ;
- déplacer ou rejeter un point ;
- invalider des correspondances ;
- imposer une abstention ;
- valider séparément le fait, la géométrie, le rapport, le média et la publication.

### Ordre de déploiement

```text
benchmark
→ replay
→ recette
→ shadow
→ Admin privé
→ validation indépendante
→ publication humaine limitée
```

### Gate

Aucune promotion n’est déclenchée par un score automatique seul. Toute décision reste auditée et réversible selon les règles du produit.

## À ne pas faire avant preuve

- supprimer MolmoPoint ;
- déclarer DINOv3 validé avant entraînement ;
- remplacer RT-DETRv2 par RF-DETR sans benchmark ;
- imposer MoGe sans comparaison ;
- créer un index national pour le pilote ;
- ajouter un serveur LLM optimisé sans besoin de concurrence mesuré ;
- publier des chiffres de coût ou de performance non archivés ;
- réactiver les propositions spatiales avant qualification ;
- intégrer une simulation dans le pipeline public courant.
