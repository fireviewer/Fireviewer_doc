# Terminologie FireViewer

## Incident

Agrégat stable représentant un incendie ou un dossier en cours de rapprochement. Il possède un `fire_id` canonique.

## Épisode

Période temporelle distincte au sein d’un même incident, par exemple une réactivation.

## Source

Origine d’une observation ou d’un média : utilisateur, organisme, capteur, publication, dataset ou connecteur.

## `EventCandidate`

Objet privé créé lors d’une contribution. Il contient un point de prise de vue, un moment, un message et/ou des preuves, ainsi que les droits d’analyse. Il peut subsister après une abstention géométrique.

## `Viewpoint`

Position de l’observateur ou de la caméra. Elle ne représente jamais automatiquement un point de feu, une origine de fumée ou un front.

## `EvidenceAsset`

Image ou vidéo privée soumise par un contributeur et rattachable à un événement candidat. Le message appartient à `EventCandidate`. Les documents officiels, acquisitions satellite et produits spatiaux sont des révisions d’artefacts externes, pas des uploads de contribution.

## `LocalizationAttempt`

Tentative rejouable de produire une géométrie d’activité à partir d’un point de vue et de preuves. Elle produit une géométrie avec ses limites ou une abstention typée.

## `FireActivityEvent`

Objet métier stable représentant une activité documentée dans un incident. Ses informations, sa géométrie, son intervalle, son incertitude, ses preuves et sa revue évoluent par révisions.

## `EventRelation`

Relation versionnée entre événements ou candidats : identité proposée, ordre temporel, même front, support, contradiction, remplacement, fusion ou séparation.

## `ActivityEnvelopeRevision`

Enveloppe probable dérivée de plusieurs événements compatibles dans une fenêtre temporelle. Elle ne constitue ni une observation directe, ni une simulation, ni une prédiction.

## `ProgressionDelta`

Différence descriptive entre deux révisions validées. Elle ne remplit pas une période non observée et ne prédit pas la progression future.

## Preuve

Élément immuable utilisé pour soutenir une observation : image ou vidéo de contribution, frame, texte archivé, masque, boîte, produit satellite ou artefact spatial. L’API événementielle v2 n’accepte pas d’upload audio ou document.

Une preuve n’est pas nécessairement indépendante. Deux services peuvent diffuser des produits dérivés d’une même acquisition.

## Artefact de preuve

Fichier ou objet dérivé conservant son origine, son empreinte, son modèle, sa révision et ses parents.

## Observation

Énoncé structuré relié à une ou plusieurs preuves. Elle peut être observée, rapportée, contradictoire, inconnue ou soumise à revue.

## Observation capteur

Mesure ou détection issue d’un capteur avec temps d’acquisition, footprint et qualité. Son centroïde n’est pas automatiquement une position exacte du phénomène.

## Observation interprétée

Produit dérivé par un algorithme ou une analyse humaine, par exemple une surface brûlée. Sa méthode et ses parents restent visibles.

## Déclaration officielle

Assertion attribuée à une autorité identifiée. Son autorité dépend du type d’assertion et ne confère pas automatiquement une précision spatiale.

## Référentiel

Donnée utilisée pour géocoder, projeter ou contextualiser, par exemple un MNT IGN. Elle ne prouve pas une activité incendie.

## Prévision

Information produite pour une échéance future à partir d’un run daté. Elle reste séparée des observations.

## Fait accepté

Observation ayant passé les gates applicables et une décision humaine. Il ne devient public que par une action de publication séparée.

## Détection

Proposition de présence ou de localisation dans l’image, par exemple une boîte feu/fumée. Une détection n’est pas un fait public.

## Instance

Phénomène visuel distinct dans une image : foyer, colonne de fumée ou front visible.

## Ancrage visuel

Point ou ligne dans l’image représentant une origine observable : base de flamme, base de fumée ou front visible.

## Abstention visuelle

Le modèle ne peut pas proposer un ancrage défendable à partir de l’image.

Valeurs possibles :

- `insufficient_visual_anchor`
- `ambiguous_anchor`
- `no_visible_ground_origin`

## Abstention géométrique

La branche spatiale ne peut pas produire une position défendable.

Valeurs possibles :

- `insufficient_geometry`
- `unstable_camera_pose`
- `invalid_raycast`
- `uncertainty_above_limit`

## Pointage

Production d’un ancrage dans les coordonnées de l’image. Le pointage n’est pas une géolocalisation.

## Recalage spatial

Estimation de la relation entre une image et un référentiel géoréférencé.

## Pose caméra

Position, orientation et modèle de caméra dans un repère métrique versionné.

## Raycast

Intersection d’un rayon issu de la caméra avec le MNT de référence.

## `uncertainty_envelope`

Enveloppe dérivée de plusieurs sources d’incertitude. Elle n’est appelée ellipse de confiance calibrée qu’après validation empirique.

## `observed_hotspot`

Point ou observation thermique provenant d’un capteur ou d’un produit compatible. Il ne confirme pas automatiquement un feu.

## `observed_burned_perimeter`

Surface observée comme brûlée à partir d’un produit adapté et revue selon son contrat.

Elle ne représente pas automatiquement la zone active au moment de sa publication.

## `human_reviewed_active_zone`

Zone active proposée puis acceptée ou corrigée humainement.

## `simulated_scenario`

Résultat d’un modèle de simulation séparé des couches observées.

## Shadow mode

Exécution d’un composant sans autorité de production afin de comparer ses sorties.

## Gate

Contrôle explicite qui autorise, bloque, redirige ou place une étape en revue.

## Replay

Réexécution d’un traitement à partir des mêmes entrées, contrats, révisions et paramètres enregistrés.
