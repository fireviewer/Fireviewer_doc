# Carte des contrats FireViewer

## Principe

Chaque contrat possède :

- un producteur ;
- un ou plusieurs consommateurs ;
- une version ;
- un schéma ;
- une empreinte ou un verrou ;
- une politique de compatibilité ;
- un propriétaire documentaire.

## Carte inter-dépôts

| Contrat | Producteur | Consommateurs | Rôle |
| --- | --- | --- | --- |
| Incident public | Backend | Frontend | Métadonnées et état public de l’incident. |
| Viewer manifest | Backend | Frontend | Asset courant, ETag et état du viewer. |
| Public incident view | Backend | Frontend | Faits et observations publiés. |
| Admin review | Backend | Frontend | Dossier privé de revue et actions autorisées. |
| Agent batch | Backend | AI worker | Lot, preuves, étapes et contraintes d’exécution. |
| Agent result | AI worker | Backend | Résultats partiels, abstentions, preuves et rapports. |
| Evidence artifact | Backend / worker | Backend / frontend Admin | Filiation et provenance des artefacts. |
| Spatial package | Spatial | Backend / frontend / worker | Référentiel versionné et assets du viewer. |
| Spatial registration | Backend / spatial | AI worker | Entrées de recalage autorisées. |
| Spatial proposal | AI worker | Backend / frontend Admin | Pose, intersection, incertitude ou abstention. |
| SDG case | SDG | AI worker / pipelines de training | Cas synthétique et provenance. |
| Model manifest | AI worker | Bootstrap / runtime / docs | Modèles, révisions, profils et état d’activation. |

## Route canonique

```text
/incident/{fire_id}
```

Les anciennes routes ne doivent être conservées que comme alias explicitement documentés.

## Contrats de décisions séparées

Les décisions suivantes ne partagent pas un unique statut :

- validation d’un fait ;
- validation d’une géométrie ;
- validation d’un rapport ;
- modération d’un média ;
- publication d’un média ;
- publication d’une révision spatiale.

## Versionnement

Une évolution incompatible crée une nouvelle version de contrat.

Les consommateurs doivent verrouiller :

- la version ;
- le chemin ;
- le schéma ;
- l’empreinte lorsque le mécanisme existe.

## Rejet

Un contrat invalide est rejeté avant traitement. Une sortie partielle valide peut être conservée uniquement si son statut et ses étapes manquantes sont explicites.

## Documentation spécialisée

- AI worker : `docs/PIPELINE_V2.md`, `docs/REPLAY_AND_PROVENANCE.md`
- Backend : `docs/AGENT_ORCHESTRATION.md`, `docs/EVIDENCE_REGISTRY.md`
- Spatial : `docs/CAMERA_AND_CRS_CONTRACT.md`, `docs/PACKAGE_VERSIONING.md`
- Frontend : `docs/REVIEW_UI_CONTRACT.md`
- SDG : `docs/SPLIT_AND_LEAKAGE_POLICY.md`
