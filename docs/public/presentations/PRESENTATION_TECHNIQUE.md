# FIRE-VIEWER — présentation technique

## Architecture de référence

```text
sources officielles / publiques / autorisées
        ↓
collecte et normalisation
        ↓
preuves versionnées : temps + provenance + droits
        ├──────────────→ vision : détection / pointing / OCR / keyframes
        └──────────────→ géolocalisation : hypothèses + incertitude
                               ↓
                    recoupement / supervision
                    accept | reject | abstain
                               ↓
                  Fire State / Part.4 daté
                               ↓
                     revue et révisions
                               ↓
                 backend : autorité durable
                               ↓
                  atlas public 2D / 3D
```

Le Map Builder générique UWD produit séparément des packages géographiques versionnés consommés par FireViewer. Il ne possède ni les incidents, ni les preuves, ni les utilisateurs, ni la publication FireViewer.

## Responsabilités techniques

- **Backend** : source de vérité pour incidents, preuves durables, droits, jobs, révisions, décisions humaines, audit et publication.
- **Frontend** : catalogue, contribution, revue, chronologie et exploration 2D/3D.
- **Contracts** : schémas partagés et contrats d'échange.
- **Ingestion** : acquisition/normalisation des sources et observations.
- **Vision runtime** : observations dans l'espace image.
- **Geolocation** : hypothèses géographiques et recalage, avec incertitude explicite.
- **Evidence supervisor** : contradictions, support, rejet et abstention.
- **Orchestrator** : exécution, retries, receipts et idempotence ; pas une seconde base métier.
- **Fire State** : calcul déterministe Part.4 et produits probabilistes/provenance.
- **Model Lab** : corpus, entraînements, benchmark et registre de modèles.
- **Docker** : verrous de versions, composition et preuves opérationnelles privées.
- **AI Worker** : couche de compatibilité transitoire, pas emplacement de nouveaux algorithmes.

## Invariants

- aucune sortie de modèle ne remplace silencieusement une source ;
- toute hypothèse géographique garde ses entrées, sa confiance et ses limites ;
- les corrections sont versionnées et ne réécrivent pas l'historique ;
- les références d'évaluation ne doivent pas contaminer la reconstruction qu'elles mesurent ;
- les packages terrain et les résultats IA suivent des règles d'acceptation distinctes ;
- l'absence de donnée est représentée par `unknown`, `abstain` ou un état non observable lorsque c'est le résultat correct.

## Maturité

La séparation en dépôts rend les responsabilités plus claires mais ne vaut pas qualification. Les principaux travaux à continuer de prouver concernent le parcours réel complet sur de nouveaux incidents, la géolocalisation, la qualité des modèles, les corpus, la revue des reconstructions, la reprise sur panne et les coûts d'exploitation.
