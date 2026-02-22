# Web App Engineering Standard

Denne standarden er obligatorisk for alle nye webapplikasjoner i dette SDLC-oppsettet.

## Mål

- Skalerbar kodebase som kan overtas av mennesker
- Forutsigbar vedlikeholdbarhet for Codex når kompleksiteten øker
- Tydelige kontrakter mellom moduler/tjenester

## Obligatoriske leveranser før kode

1. Problem Brief
2. MVP-scope (in/out)
3. Architecture v1
4. Minst én ADR
5. Initial backlog med akseptansekriterier

## Obligatorisk struktur per app

- `apps/<app>/src/`
- `apps/<app>/tests/unit/`
- `apps/<app>/tests/integration/`
- `apps/<app>/tests/contract/`
- `apps/<app>/contracts/`
- `apps/<app>/docs/README.md`
- `apps/<app>/docs/ARCHITECTURE.md`

## Guardrails

- Ingen direkte push av featurearbeid til `main`
- All kode via issue -> branch -> PR -> checks -> merge
- Kontrakter skal være eksplisitte (API/events/schemas)
- Modulgrenser skal dokumenteres og respekteres

## Testing og TDD

- TDD er default for domene-/forretningslogikk
- Ved endring i `src` skal tester oppdateres i samme PR
- Minimum testlag:
  - unit
  - integration
  - contract
- E2E legges til for kritiske brukerflyter

## CI policy (obligatorisk)

PR kan ikke merges uten grønn:
- `quality`
- `CodeQL`
- `Gitleaks`

I tillegg skal CI verifisere:
- required appstruktur finnes
- kodeendringer i app har med test- eller kontraktendring i samme PR

## Dokumentasjonskrav

Hver app skal ha:
- onboarding for utviklere
- arkitektur og moduloversikt
- runbook for drift/feil
- oversikt over kontrakter

## Evolusjonsregel

Start modulært (modular monolith). Gå til mikrotjenester kun ved dokumentert behov
(trafikk, teamskille, deploy-uavhengighet) og med ADR som begrunner overgangen.
