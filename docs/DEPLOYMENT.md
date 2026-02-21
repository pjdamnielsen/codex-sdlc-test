# Deployment Baseline

## Mål

Etablere en kontrollert deployflyt til `dev` med godkjenninger og OIDC mot AWS.

## Implementert nå

- Workflow: `.github/workflows/deploy-dev.yml`
- Trigger: manuell (`workflow_dispatch`)
- Støtter `dry_run` (default `true`)
- Bruker GitHub Environment: `dev`
- Forberedt for AWS OIDC (`aws-actions/configure-aws-credentials`)

## Første gangs oppsett i GitHub

1. Repo -> `Settings` -> `Environments` -> opprett `dev`.
2. I environment `dev`, legg til secret:
- `AWS_ROLE_ARN`
3. (Valgfritt) Legg til environment variable:
- `AWS_REGION` (f.eks. `eu-west-1`)
4. Legg til required reviewers på environment hvis du vil ha manuell godkjenning før deploy.

## Kjøring

1. Gå til `Actions` -> `Deploy Dev`.
2. Klikk `Run workflow`.
3. Start med `dry_run = true`.
4. Når AWS er konfigurert, kjør med `dry_run = false`.

## Neste steg

- Erstatt "Deploy placeholder" med faktisk deploykommando.
- Legg til `deploy-stage` og `deploy-prod` med strengere approvals.
