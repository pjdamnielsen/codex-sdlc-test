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
