# Terminologie FireViewer

## Incident

Agrégat stable représentant un incendie ou un dossier en cours de rapprochement. Il possède un `fire_id` canonique.

## Épisode

Période temporelle distincte au sein d’un même incident, par exemple une réactivation.

## Source

Origine d’une observation ou d’un média : utilisateur, organisme, capteur, publication, dataset ou connecteur.

## Preuve

Élément immutable utilisé pour soutenir une observation : média, frame, segment audio, texte archivé, masque, boîte, produit satellite ou artefact spatial.

## Artefact de preuve

Fichier ou objet dérivé conservant son origine, son empreinte, son modèle, sa révision et ses parents.

## Observation

Énoncé structuré relié à une ou plusieurs preuves. Elle peut être observée, rapportée, contradictoire, inconnue ou soumise à revue.

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
