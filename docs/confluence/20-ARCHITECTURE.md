# Arkitektur

## SDLC-plattform (nåværende)

Kjernen er GitHub + Confluence:
- GitHub: kildekode, issues, PR, CI/CD, releases
- Confluence: prosess- og driftsdokumentasjon
- Sync: repo `docs/confluence/*` -> Confluence sider

## Komponenter

- Repo: `codex-sdlc-test`
- Workflows:
  - CI (`quality`)
  - Security (`CodeQL`, `Gitleaks`)
  - Confluence Sync
  - Release
  - Deploy Dev/Stage/Prod
- Environments i GitHub:
  - `dev`
  - `stage`
  - `prod`

## Sikkerhetsmodell

- Branch protection på `main`
- Required checks før merge
- Secrets i GitHub Environments
- AWS-deploy forberedt via OIDC-role (`AWS_ROLE_ARN`)

## Risikoer og tiltak

- Risiko: dokumentasjon blir utdatert
  - Tiltak: sync-workflow + oppdatere docs i PR
- Risiko: direkte push til `main`
  - Tiltak: branch protection og PR-flyt
- Risiko: deploy til feil miljø
  - Tiltak: separate workflows + environment approvals
