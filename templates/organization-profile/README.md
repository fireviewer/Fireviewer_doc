# FireViewer

**Open infrastructure for wildfire observation, spatial reconstruction, temporal tracking and reproducible post-event analysis.**

FireViewer is an independent open-source research and engineering project maintained by **Unicorn Who Dev**.

The project combines geospatial processing, provenance-aware evidence management, AI-assisted analysis, human review and portable spatial/temporal packages so that wildfire incidents can be inspected while active and studied reproducibly afterwards.

> FireViewer is not an emergency alert service, an official wildfire source, a command tool or a certified propagation predictor.

## What we are building

```text
sources + observations
        ↓
provenance + evidence
        ↓
AI analysis / localisation / abstention
        ↓
human review
        ↓
reproducible spatial map build
        +
reviewed temporal fire states
        ↓
public exploration / replay / datasets / post-event studies
```

### Spatial reconstruction

The canonical map builder is headless and endpoint-driven. It produces portable OpenUSD/Blender map packages from measured geographic inputs on a Lambert-93 tile grid.

**FireViewer core no longer depends on Unity or NVIDIA Omniverse.** Omniverse can still be used in optional synthetic-data R&D inside the SDG workstream.

### Fire evolution

Observed, reconstructed, interpreted, simulated and predicted states remain separate. Unknown intervals stay unknown instead of being silently interpolated.

### Replay and research

FireViewer aims to preserve enough provenance, hashes, model/tool revisions and human decisions to reopen an incident later and use it for reproducible post-event studies, datasets and benchmarks.

## Repositories

| Component | Responsibility |
| --- | --- |
| **Documentation** | Architecture, status, safety, reproducibility, roadmap and partnerships. |
| **Frontend** | Contribution, human review and public 2D/3D exploration. |
| **Backend** | Incident registry, evidence, orchestration, audit and publication. |
| **AI worker** | Private analysis, visual anchors, localisation attempts and abstention. |
| **Spatial** | Headless map builder, geographic packages and temporal perimeter layers. |
| **SDG** | Optional synthetic-data and simulation research. |

Models and datasets are published through the [FireViewer organisation on Hugging Face](https://huggingface.co/fireviewer).

## Looking for support and collaborators

FireViewer is currently maintained with limited independent resources. The project is looking for:

- GPU and CPU compute credits;
- object-storage and bandwidth support;
- geospatial / remote-sensing collaboration;
- wildfire-domain review;
- reproducible benchmark and evaluation support;
- research partnerships;
- grants or sponsorship that can fund infrastructure and sustained development.

Support does not buy influence over scientific conclusions or publication decisions.

See the canonical [Project Overview](https://github.com/fireviewer/Fireviewer_doc/blob/main/docs/PROJECT_OVERVIEW.md), [Funding Brief](https://github.com/fireviewer/Fireviewer_doc/blob/main/docs/FUNDING_BRIEF.md) and [Support & Partnerships](https://github.com/fireviewer/Fireviewer_doc/blob/main/docs/SUPPORT_AND_PARTNERSHIPS.md).

## Contact

Research, infrastructure support, sponsorship, provenance, security or data-removal requests:

**unicornwhodev@gmail.com**

---

### En français

FireViewer est une infrastructure ouverte de **documentation des incendies, reconstruction spatiale, suivi temporel et étude reproductible après événement**. Le projet cherche des partenaires techniques, scientifiques et infrastructure pour franchir les étapes de validation difficiles à financer seul.
