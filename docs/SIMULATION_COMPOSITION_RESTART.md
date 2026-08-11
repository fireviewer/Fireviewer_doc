# Reprise des scènes Omniverse sur le catalogue de 295 assets

**État :** `BLOCKED_PENDING_REBUILT_USD_ASSETS`

## Décision

Les scènes Unity, les simulations précédentes et leurs contrats ne définissent
plus la production future. La cible est un catalogue définitif de 295 assets
USD refaits et une composition OpenUSD/Omniverse reproductible.

Deux artefacts historiques restent conservés pour audit et replay : le dataset
issu de la première simulation et le pack autonome complet de sa reproduction.
Ils ne sont ni proposés comme nouveaux téléchargements, ni réutilisés comme
catalogue de composition.

## Contrat de reprise

- exactement 295 assets USD acceptés et liés par SHA-256 ;
- identifiants stables, licences, provenance, rôles et contextes obligatoires ;
- ouverture Kit isolée de chaque asset avant admission ;
- quatre scènes de base, cinq variantes par base, vingt scènes au total ;
- sélection pseudo-aléatoire déterministe à seed et algorithme versionnés ;
- couverture des 295 assets au moins une fois dans le portfolio ;
- compatibilité contextuelle obligatoire pour conserver une variété cohérente ;
- positions géospatiales, relief, réseaux, eau et identifiants validés conservés ;
- aucun cube, placeholder, substitut procédural ou fallback simplifié ;
- carte, composition, simulation, reproduction et capture restent séparées.

## Roadmap de reprise

### P0 — Réception des USD

**Bloquant actuel.** Attendre les 295 assets refaits. Aucun lancement de scène,
aucune archive téléchargeable et aucune publication pendant cette attente.

**Gate :** 295/295 fichiers reçus, inventaire SHA-256, provenance/licence et
ouverture Kit isolée passés.

### P1 — Verrouillage du catalogue

Produire le manifeste V2 trié, contrôler les chemins relatifs, les rôles, les
contextes, les dimensions et les variantes LOD. Rejeter le catalogue complet
si une entrée est absente ou non acceptée.

**Gate :** même catalogue canonique et même SHA-256 sur deux validations.

### P2 — Plan de composition déterministe

Exécuter deux fois l'algorithme V2 sur les quatre bases acceptées, comparer le
fingerprint du plan et contrôler la couverture des 295 assets ainsi que la
cohérence des contextes.

**Gate :** vingt plans identiques entre replays, couverture complète, aucun
fallback, aucune relaxation silencieuse.

### P3 — Authoring OpenUSD

Authorer les vingt scènes par couches séparées, avec références relatives,
placements et identifiants stables. Conserver les densités et la complexité
des scènes acceptées ; les variantes doivent augmenter la richesse visuelle,
pas réduire le contenu.

**Gate :** dépendances complètes et ouverture Kit isolée de chaque scène.

### P4 — QA visuelle et simulation

Valider cadrages, échelles, terrain, variété, collisions, matériaux et rendu.
Ajouter la simulation uniquement après acceptation des scènes statiques.

**Gate :** reçus humains liés aux SHA-256 exacts et probes runtime séparés.

### P5 — Exports et site

Construire les packs autonomes, vérifier les ZIP et leurs chemins, les publier
dans le stockage privé, puis seulement inscrire leurs IDs et empreintes dans le
backend et le frontend.

**Gate :** archives isolées rouvertes, backend fail-closed, frontend sans ancien
pack et décision explicite de publication.
