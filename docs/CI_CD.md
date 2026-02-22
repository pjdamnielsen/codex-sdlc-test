# CI/CD Baseline

## Hva som er satt opp

- CI workflow: `.github/workflows/ci.yml`
- Security workflow: `.github/workflows/security.yml`
- Dependabot: `.github/dependabot.yml`

## CI quality gate

CI kjører på PR og push til `main`:
- Repo-hygiene sjekk (hindrer at `.confluence.env` eller `.auth/` blir tracked)
- Validering av obligatoriske engineering standard-filer
- Markdown-validering (UTF-8 + ikke tomme filer)
- PR-policy: app `src`-endringer må ha test-/kontrakt-/docs-endring i samme PR
- PR-policy: arkitektur-/kontraktendringer må ha ADR-oppdatering i `docs/adr/`
- Workflow lint (`actionlint`)

## Security baseline

Security workflow kjører på PR, push og ukentlig:
- CodeQL analyse av GitHub Actions
- Gitleaks secret scan

Dependabot oppdaterer GitHub Actions-avhengigheter ukentlig.

## Anbefalt branch protection (`main`)

I GitHub repo settings, aktiver:

1. `Require a pull request before merging`
2. `Require approvals` (minst 1)
3. `Require status checks to pass before merging`
- Velg checks:
  - `quality`
  - `CodeQL`
  - `Gitleaks`
4. `Require branches to be up to date before merging`

## Neste trinn for deploy

Når AWS-miljø er klart:
- legg til `deploy-dev` workflow først
- deretter `deploy-prod` med approval-gate
