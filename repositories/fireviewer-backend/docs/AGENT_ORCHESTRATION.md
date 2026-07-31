# Orchestration des analyses agentiques

## Responsabilité du backend

Le backend est la source durable pour :

- lots ;
- fenêtres d’analyse ;
- preuves ;
- candidats de modèles ;
- consensus et cascades ;
- leases ;
- tentatives ;
- annulations ;
- dead letters ;
- revues ;
- publications.

Le worker ne décide pas seul de la suite du workflow.

## Graphe de stages

Le backend fournit un plan déclaratif composé de stages et dépendances.

Le graphe peut libérer plusieurs branches logiques, mais le worker GPU conserve une exécution lourde séquentielle.

## États

- `pending`
- `ready`
- `running`
- `completed`
- `not_applicable`
- `abstain`
- `human_review`
- `partial`
- `failed`
- `cancelled`
- `dead_letter`

## Profils d’exécution

- `production_cascade`
- `validation_quorum`
- `shadow_sampling`

Le profil est enregistré avec le lot et ses résultats.

## Résultats partiels

Une étape réussie reste disponible si une étape ultérieure échoue. La consolidation indique les sorties présentes, absentes et non applicables.

## Barrière de revue

Une fenêtre devient présentable lorsque chaque opération attendue atteint un état terminal. Une fenêtre vide ou pauvre conserve ses limites et abstentions.

## Séparation des décisions

Le backend distingue :

- fait ;
- repère ;
- géométrie ;
- rapport ;
- média ;
- publication.

Aucune décision ne valide implicitement les autres.
