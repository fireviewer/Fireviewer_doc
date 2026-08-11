# Roadmap consolidée FireViewer

**Statut :** roadmap inter-dépôts pilotée par des gates de preuve

**Principe :** aucun délai ou résultat n’est garanti par ce document

## Séquence prioritaire — recadrage événementiel

Les entraînements et promotions de nouveaux modèles ne sont pas le chemin critique de cette séquence. Les composants existants restent des baselines de perception jusqu’à la création du benchmark événementiel.

### E0 — Contrats et terminologie

**État :** `IMPLEMENTED_TESTED_LOCAL`

- adopter `EventCandidate`, `Viewpoint`, `LocalizationAttempt`, `FireActivityEvent`, `EventRelation` et `ActivityEnvelopeRevision` ;
- versionner l’API, la provenance, la temporalité et les reason codes ;
- maintenir les fonctions cibles en `specified_not_implemented` tant que le runtime n’existe pas.

**Gate :** contrats cohérents, fixtures définies, aucune fonction non implémentée déclarée active.

### E1 — Schéma backend additif

**État :** code et DDL `IMPLEMENTED_NOT_LIVE_VERIFIED`

- ajouter les entités v2 sans supprimer les objets historiques ;
- conserver des relations persistantes vers preuves et sources ;
- stocker les géométries métier en PostGIS ;
- produire des adaptateurs privés sans publication automatique.

**Gate :** migration idempotente, rollback, zéro perte et rapport de compatibilité.

### E2 — Contribution événementielle

**État :** `IMPLEMENTED_TESTED_LOCAL`, recette Supabase/Blob/ClamAV live en attente

- formulaire unique : point de vue, moment, message et zéro à vingt images ou vidéos facultatives ;
- upload privé et idempotence ;
- mise en file directe d’une analyse privée ;
- point de vue privé par défaut.

**Gate :** message seul accepté, plusieurs médias acceptés, un seul job par soumission et aucune confusion viewpoint/activité.

### E3 — Connecteurs et provenance externe

**État :** registre et scheduler `IMPLEMENTED_TESTED_LOCAL` ; adaptateurs et collecte live suivis par collection

- enrôler par collection Sentinel/Copernicus, FIRMS/EFFIS, Météo-France, IGN, BDIFF et organismes officiels ;
- distinguer observation, interprétation, déclaration, référentiel, prévision et simulation ;
- conserver révisions, filiation, licences, temps et CRS natifs ;
- planifier les collectes par incident et AOI.

**Gate :** même URL modifiée conservée comme révision, produits d’un même granule non comptés comme corroborations indépendantes, restrictions de redistribution respectées.

### E4 — Analyse et revue événementielles

**État :** admission, worker, dispatcher et transitions principales `IMPLEMENTED_TESTED_LOCAL` ; correction, fusion et replay avancés `PENDING`

- profils sol large, distant, proche et serré ;
- localisation ou abstention ;
- association, contradictions, fusion et séparation proposées ;
- revue unifiée des informations, preuves et géométries.

**Gate :** toute géométrie est rejouable, toute abstention conserve le candidat et toute correction crée une révision.

### E5 — Timeline, enveloppes et progression

**État :** `PENDING` au-delà du stockage additif

- timeline issue des événements validés ;
- couches `event`, `front`, `activity_envelope`, `burned_area` et `simulation` séparées ;
- enveloppes citant leurs événements supports ;
- progression décrite entre révisions, sans interpolation silencieuse.

**Gate :** un événement seul ne ferme pas un périmètre, la fumée seule ne crée pas une zone active et une prévision ne rejoint jamais les observations.

### E6 — Recette et activation limitée

**État :** `PENDING`

- exécuter la matrice d’acceptation ;
- mesurer localisation, abstention, association et calibration par profil ;
- tester sécurité, retrait, rollback et replay ;
- activer les flags sur des incidents de recette avant toute publication limitée.

**Gate :** décision humaine documentée avec artefacts ; aucune promotion sur score unique.

Les lots G1 à G6 ci-dessous restent des chantiers de capacités. Ils ne précèdent pas les gates E0 à E6 et ne constituent pas une autorisation de relancer des entraînements.

## S0 — Reprise des scènes Omniverse

**État :** `BLOCKED_PENDING_REBUILT_USD_ASSETS`

- les scènes Unity et simulations précédentes sont retirées du chemin actif ;
- le dataset de la première simulation et son pack autonome de reproduction
  complet restent conservés comme archives historiques ;
- le contrat V2 exige exactement 295 assets USD, quatre bases, cinq variantes
  par base et aucune simplification ou substitution ;
- le backend et le frontend ne publient aucun ancien pack pendant l'attente ;
- la séquence détaillée est définie dans
  [`SIMULATION_COMPOSITION_RESTART.md`](SIMULATION_COMPOSITION_RESTART.md).

**Gate :** ne lancer aucune nouvelle scène avant réception, inventaire SHA-256,
provenance et ouverture Kit isolée des 295 assets USD refaits.

## G0 — Rétablir la source de vérité

### Travail

- maintenir l’architecture et la roadmap dans `fireviewer_doc` ;
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
