# Deployment Baseline

## Mål

Etablere kontrollerte deployflyter til `dev`, `stage` og `prod` med godkjenninger og OIDC mot AWS.

## Implementert nå

- Workflow: `.github/workflows/deploy-dev.yml`
- Workflow: `.github/workflows/deploy-stage.yml`
- Workflow: `.github/workflows/deploy-prod.yml`
- Trigger: manuell (`workflow_dispatch`)
- Støtter `dry_run` (default `true`) i alle miljø
- Bruker GitHub Environments: `dev`, `stage`, `prod`
- Forberedt for AWS OIDC (`aws-actions/configure-aws-credentials`)
- Ekstra prod-sikring: `confirm=DEPLOY` når `dry_run=false`

## Første gangs oppsett i GitHub

1. Repo -> `Settings` -> `Environments` -> opprett:
- `dev`
- `stage`
- `prod`
2. I hvert environment, legg til secret:
- `AWS_ROLE_ARN`
3. (Valgfritt) Legg til environment variable:
- `AWS_REGION` (f.eks. `eu-west-1`)
4. Sett required reviewers:
- `dev`: valgfritt
- `stage`: anbefalt
- `prod`: anbefalt sterkt (minst 1)

## Kjøring

1. Gå til `Actions` -> velg workflow (`Deploy Dev`, `Deploy Stage`, `Deploy Prod`).
2. Klikk `Run workflow`.
3. Start med `dry_run = true`.
4. Når AWS er konfigurert, kjør med `dry_run = false`.
5. For prod med `dry_run=false`, sett `confirm=DEPLOY`.

## Neste steg

- Erstatt "Deploy placeholder" med faktisk deploykommando (Terraform/app deploy).
- Koble deploy til artifacts og release-tags ved behov.
- Legg inn rollback-steg i hvert miljø.
