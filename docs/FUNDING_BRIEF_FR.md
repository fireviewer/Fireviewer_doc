# FireViewer — Brief financement et partenariats

Ce document est une version française courte et réutilisable pour les appels à projets, demandes de crédits cloud, demandes de soutien, mécénat/sponsoring technique et prises de contact avec des laboratoires ou partenaires.

Pour les formulaires plus détaillés, voir également le [kit de candidature financement](FUNDING_APPLICATION_KIT.md).

## Présentation en une phrase

**FireViewer est une infrastructure open source dédiée à la documentation des incendies, à leur reconstruction spatiale, au suivi temporel des états observés et aux études reproductibles après événement.**

## Résumé du projet

Les informations liées à un incendie sont dispersées entre photographies, vidéos, observations satellitaires, communications publiques, données de terrain, orthophotographies et reconstructions réalisées après coup. Ces sources n'ont ni la même précision, ni la même temporalité, ni le même niveau de confiance.

FireViewer construit une chaîne technique qui conserve ces différences au lieu de les masquer : provenance des sources, horodatage, incertitude, traitements appliqués, révisions des modèles et décisions humaines restent traçables.

Le projet combine notamment :

1. un registre de preuves et de provenance ;
2. un **map builder headless** déclenché via endpoint et indépendant du viewer ;
3. des traitements IA capables de proposer une analyse ou de s'abstenir ;
4. une revue humaine avant publication ;
5. des couches temporelles distinguant observation, reconstruction et simulation ;
6. des packages immuables permettant le replay et les études post-événement.

Le cœur FireViewer ne dépend plus de Unity ni de NVIDIA Omniverse. Omniverse peut rester utilisé dans des travaux R&D de génération de données synthétiques, séparés du pipeline principal.

## Problème traité

Aujourd'hui, la réutilisation scientifique ou technique d'informations liées aux incendies est compliquée notamment parce que :

- les sources arrivent à des moments et résolutions différentes ;
- le point de vue d'une caméra peut être confondu avec la position du feu ;
- un hotspot thermique, une colonne de fumée, une surface brûlée et un front actif sont des objets différents ;
- une carte ou capture d'écran finale ne conserve pas forcément la géométrie, la provenance et l'incertitude ;
- les connaissances obtenues après l'événement peuvent écraser ce qui était réellement connu à l'instant T ;
- un modèle IA peut produire une réponse visuellement convaincante sans géométrie défendable ;
- les datasets et benchmarks reproductibles exigent beaucoup plus qu'un contour final.

## Ce qui existe déjà

FireViewer dispose déjà d'une base technique substantielle :

- frontend React/TypeScript pour contribution, revue et consultation ;
- backend FastAPI pour identité des incidents, preuves, audit, orchestration et publication ;
- worker IA privé avec contrats événementiels, tentatives de localisation et abstention ;
- pipeline spatial capable de produire des packages OpenUSD/Blender reproductibles ;
- outils pour les périmètres temporels observés ;
- modèles et datasets FireViewer publiés sur Hugging Face ;
- contrats transverses de sécurité, provenance, replay et validation.

Ces briques n'ont pas toutes le même niveau de validation. FireViewer **ne se présente pas comme un outil opérationnel de secours ou de prévision certifiée**.

La maturité exacte est suivie dans la [matrice de statut](STATUS_MATRIX.md).

## Objectif du financement

L'objectif immédiat est de transformer une base technique déjà avancée, construite de manière indépendante, en une plateforme de recherche **reproductible, mesurée et vérifiable par des tiers**.

Les priorités sont :

- réaliser une campagne de builds de cartes réelles avec métriques archivées ;
- produire un premier incident de référence entièrement rejouable ;
- construire un benchmark fixe de localisation et d'abstention ;
- valider en environnement déployé plusieurs sources de données externes ;
- sécuriser le stockage, la sauvegarde et la restauration des gros artefacts ;
- publier plusieurs études techniques post-événement reproductibles.

## À quoi servirait concrètement un soutien

| Type de soutien | Utilisation |
| --- | --- |
| Crédits GPU | inférence, benchmarks de localisation, évaluations de modèles, SDG borné |
| Crédits CPU | construction des cartes, géométrie, packaging et validation |
| Stockage objet | packages de cartes, timelines, replays, datasets et résultats de benchmark |
| Bande passante | transfert et reproduction indépendante des artefacts |
| Temps de développement financé | intégration, fiabilité, sécurité, documentation et outils de replay |
| Expertise métier | incendies, SIG, télédétection, géodésie, validation méthodologique |
| Données d'évaluation | cas rétrospectifs tenus à l'écart du training et utilisables légalement |

## Livrables finançables et mesurables

### 1. Build spatial de référence

Livrables :

- package spatial validé ;
- provenance et hashes ;
- mesures de durée, stockage et coûts ;
- procédure de réouverture sur un environnement indépendant.

### 2. Incident entièrement rejouable

Livrables :

- carte immuable ;
- timeline versionnée ;
- références de preuves ;
- versions des outils/modèles ;
- décisions humaines référencées ;
- manifeste de replay ;
- première étude post-événement reproductible.

### 3. Benchmark localisation / abstention

Livrables :

- protocole versionné ;
- splits séparés par incident/source ;
- métriques ;
- analyse des erreurs ;
- comportement d'abstention ;
- recommandation documentée de promotion ou non des composants testés.

### 4. Validation de l'infrastructure

Livrables :

- tests de sources live sélectionnées ;
- cycle upload/download/hash sur gros artefacts ;
- exercice de sauvegarde/restauration ;
- rapport de récupération après échec simulé.

## Indicateurs possibles

Selon le programme, les résultats peuvent être suivis par :

- nombre de builds reproductibles réalisés et réouverts ;
- temps/coût/volume des jobs de production archivés ;
- nombre d'artefacts de replay validés ;
- nombre de connecteurs externes validés en conditions réelles ;
- erreurs de localisation sur les cas où une vérité de référence est défendable ;
- taux et qualité des abstentions ;
- exercices de sauvegarde/restauration réussis ;
- études techniques publiques reproductibles produites.

## Intérêt recherche / intérêt public

FireViewer peut contribuer à des travaux sur :

- la reproductibilité des études d'incendies ;
- la fusion de preuves géospatiales ;
- la télédétection ;
- l'évaluation de modèles IA sous incertitude ;
- les analyses rétrospectives ;
- la méthodologie de création de datasets et benchmarks ;
- la séparation transparente entre observation directe et reconstruction.

## Limites de sécurité

FireViewer n'est pas :

- un service d'alerte ;
- une source officielle sur les incendies ;
- un outil de commandement des secours ;
- un système de décision d'évacuation ;
- un moteur certifié de prédiction de propagation ;
- un système de confirmation automatique d'un incendie.

Les sorties automatisées restent des propositions jusqu'à la revue humaine prévue par le contrat concerné.

## Indépendance vis-à-vis des financeurs et partenaires

Un soutien financier, matériel ou infrastructure ne donne pas d'autorité sur :

- les conclusions techniques ou scientifiques ;
- la validation d'un incident ;
- l'affichage de l'incertitude ;
- les résultats de benchmark ;
- les décisions de publication.

Le soutien peut être mentionné séparément de la provenance technique des artefacts.

## Cadre actuel

FireViewer est actuellement un projet indépendant maintenu par **Unicorn Who Dev**.

La documentation ne revendique pas de statut associatif, caritatif, de déductibilité fiscale ou d'affiliation institutionnelle qui n'aurait pas été établi.

Lorsqu'un programme exige une structure juridique, une affiliation universitaire, un sponsor fiscal ou une société, l'éligibilité doit être vérifiée avant candidature.

## Contact

**unicornwhodev@gmail.com**

Documents utiles :

- [Kit de candidature financement](FUNDING_APPLICATION_KIT.md)
- [Présentation du projet](PROJECT_OVERVIEW.md)
- [Architecture](ARCHITECTURE.md)
- [Roadmap](ROADMAP.md)
- [Matrice de statut](STATUS_MATRIX.md)
- [Support et partenariats](SUPPORT_AND_PARTNERSHIPS.md)
