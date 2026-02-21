# SDLC Space Home

Dette Space-et er sannhetskilde for prosess, drift og beslutninger for `codex-sdlc-test`.
Denne siden synkroniseres automatisk fra GitHub-repoet.

## Status (oppdatert 2026-02-21)

Følgende er satt opp og verifisert:
- GitHub repo: `pjdamnielsen/codex-sdlc-test`
- Ticketsystem: GitHub Issues + maler + PR-mal
- Dokumentasjon: Confluence med auto-sync fra repo
- Kvalitet/sikkerhet: CI, CodeQL, Gitleaks, Dependabot
- Release: semver-tag (`vX.Y.Z`) -> automatisk GitHub Release
- Deploy: workflows for `dev`, `stage`, `prod` (dry-run klar)
- Branch protection: `main` krever PR + checks + review

## Quick links
- SDLC prosess
- Arkitektur
- Runbook Incident
- Onboarding
- Retrospektiv
- Delivery Contract

## Repo og tickets
- Repo: `https://github.com/pjdamnielsen/codex-sdlc-test`
- Tickets: GitHub Issues
- Board: GitHub Projects

## Definition of Done
- Kode er reviewet og merg'et i PR
- Required checks er grønne
- Issue er oppdatert/lukket
- Dokumentasjon er oppdatert i Confluence/repo
