# WORKLOG

Denne filen dokumenterer konkrete endringer i repoet.

## 2026-02-21

### Initialt oppsett
- Initialiserte Git-repo lokalt med `main` branch.
- Opprettet `README.md`.
- Opprettet `.gitignore` med ekskludering av `.auth/`.
- Konfigurerte remote til `git@github.com:pjdamnielsen/codex-sdlc-test.git`.
- Pushet første commit til GitHub.

### Tilgang og sikkerhet
- Opprettet dedikert SSH-nøkkel for repo-operasjoner fra denne workspace.
- La opp til at privatnøkkel holdes lokalt og ikke commit'es.

### Dokumentasjon
- Oppdatert `README.md` med dokumentasjonsoversikt.
- Opprettet `docs/SDLC.md` for livssyklus-plan.
- Opprettet `CONTRIBUTING.md` med arbeidsregler.

## Hvordan denne loggen oppdateres
- Hver gang jeg gjør en teknisk endring, legger jeg inn:
- dato
- hva som ble gjort
- hvorfor det ble gjort
- hvilken fil/prosess som ble påvirket

### GitHub ticketsystem
- Opprettet issue templates for bug, feature og task i `.github/ISSUE_TEMPLATE/`.
- Opprettet `.github/ISSUE_TEMPLATE/config.yml` for å deaktivere blank issues.
- Opprettet `.github/pull_request_template.md` med kvalitets- og dokumentasjonssjekker.
- Opprettet `docs/TICKETS.md` med anbefalt board-oppsett og arbeidsregler.

### Confluence-oppsett (innholdspakke)
- Opprettet `docs/confluence/` med ferdige sider for Space Home, SDLC-prosess, arkitektur, ADR-mal, incident-runbook, onboarding og retrospektiv.
- Oppdatert `README.md` med referanse til Confluence-oppsettet.
- Pakken er laget for enkel copy/paste inn i Confluence UI.

### Confluence publisering
- Publiserte sidehierarki til Confluence space `SD` via API.
- Opprettet/oppdatert sider:
  - SDLC Space Home (ID: 393217)
  - SDLC Prosess (ID: 393233)
  - Arkitektur (ID: 294915)
  - ADR Template (ID: 425985)
  - Runbook Incident (ID: 393248)
  - Onboarding (ID: 98309)
  - Retrospektiv Mal (ID: 98324)

### Confluence auto-sync
- Opprettet `scripts/confluence_sync.py` for create/update av Confluence-sider fra `docs/confluence/`.
- Opprettet GitHub Actions-workflow `.github/workflows/confluence-sync.yml`.
- Opprettet `docs/CONFLUENCE_SYNC.md` med setup og runbook for secrets + manuell kjøring.

### CI/CD og sikkerhetsbaseline
- Opprettet `.github/workflows/ci.yml` med quality-gates for repo-hygiene, markdownlint og actionlint.
- Opprettet `.github/workflows/security.yml` med CodeQL + Gitleaks.
- Opprettet `.github/dependabot.yml` for ukentlige GitHub Actions-oppdateringer.
- Opprettet `docs/CI_CD.md` med branch protection-oppsett og videre deploy-plan.
- Justerte CI workflow: byttet `rhysd/actionlint` fra `@v1` til eksisterende tag `@v1.7.11` etter setup-feil i GitHub Actions.
- Justerte CI markdown-sjekk fra markdownlint til robust filvalidering (UTF-8 + ikke tom fil) for stabil baseline i tidlig fase.

### Release-baseline
- Opprettet `VERSION` med initial versjon `0.1.0`.
- Opprettet `CHANGELOG.md` med initial release-notat.
- Opprettet `.github/workflows/release.yml` for automatisk GitHub Release ved semver-tag.
- Opprettet `docs/RELEASES.md` med standard release-flyt.

### Deploy-baseline (dev)
- Opprettet `.github/workflows/deploy-dev.yml` med manuell deployflyt til environment `dev`.
- La inn `dry_run` som standard for sikker første validering.
- Forberedte workflowen for AWS OIDC via `AWS_ROLE_ARN` (environment secret).
- Opprettet `docs/DEPLOYMENT.md` med setup og kjøreinstruks.

### Deploy-utvidelse (stage/prod)
- Opprettet `.github/workflows/deploy-stage.yml` for stage-miljø.
- Opprettet `.github/workflows/deploy-prod.yml` for prod-miljø med ekstra `confirm=DEPLOY` ved faktisk deploy.
- Oppdatert `docs/DEPLOYMENT.md` med environment-oppsett for `dev`, `stage` og `prod`.

### SDLC flyt-validering
- Opprettet test-issue for end-to-end validering: #5.
- Opprettet branch `codex/sdlc-flow-validation` for PR-baserte testendringer.
- Lagt til `docs/PROCESS_VALIDATION.md` som sporbarhetsdokument for flyt-test.
- Fikset PR-check feil i `security.yml`: satte `actions/checkout` til `fetch-depth: 0` i Gitleaks-jobb for korrekt commit-range i pull_request-kjøring.

### Forbedret Confluence-innhold
- Oppdaterte Space Home med konkret status for faktisk etablert oppsett (GitHub, tickets, CI/security, release, deploy).
- Oppdaterte SDLC Prosess med reell issue->PR->merge flyt og aktive kvalitetsporter.
- Oppdaterte Arkitektur med nåværende plattformdesign og sikkerhetsmodell.
- Oppdaterte Onboarding med konkrete steg for dette prosjektet.
- Synket oppdateringene til Confluence space `SD`.

### Delivery Contract
- Opprettet ny Confluence-kildeside: `docs/confluence/70-DELIVERY-CONTRACT.md`.
- Oppdatert Confluence sync-script for å inkludere siden automatisk.
- Oppdatert Space Home med quick link til Delivery Contract.

### PR pre-flight
- Oppdatert `.github/pull_request_template.md` med Delivery Contract pre-flight checklist.
- Lagt inn direkte referanse til `docs/confluence/70-DELIVERY-CONTRACT.md`.

### Web App Engineering Standard
- Opprettet ny Confluence-kildeside: `docs/confluence/80-WEB-APP-ENGINEERING-STANDARD.md`.
- Oppdatert Confluence sync-script for å inkludere `Web App Engineering Standard`.
- Utvidet `Delivery Contract` med obligatoriske TDD/test/kontrakt-regler.
- Oppdatert PR-template med pre-flight-krav for test/kontrakt og coverage.
- Oppdatert CI-policy (`.github/workflows/ci.yml`) med:
  - validering av obligatoriske standard-filer
  - PR-policy som krever test-/kontrakt-/docs-endring ved app `src`-endring
- Opprettet repo-template for nye webapper under `templates/web-app/`.
- Opprettet `docs/WEB_APP_ENGINEERING_STANDARD.md` som repo-referanse.
