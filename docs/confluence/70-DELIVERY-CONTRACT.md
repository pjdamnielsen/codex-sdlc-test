# Delivery Contract

Denne siden er arbeidsavtalen for hvordan vi samarbeider for høy kvalitet og forutsigbar leveranse.

## Formål

- Redusere konteksttap og rework
- Sikre jevn kvalitet i hver iterasjon
- Holde fremdrift uten å ofre kontroll

## Arbeidsregler

1. Scope-kontroll
- Vi jobber med én tydelig leveranseblokk om gangen.
- Scope-endringer må prioriteres eksplisitt før de tas inn.

0. Session pre-flight
- Hver ny Codex-tråd starter med prosjektkontekst-sjekk via `scripts/session_preflight.sh`.
- Ingen kodeendringer før pre-flight bekrefter korrekt workspace/repo/branch.

2. Obligatorisk issue-ramme før kode
- Hver sak skal ha:
  - problem/mål
  - avgrensning (in/out)
  - akseptansekriterier
  - Definition of Done

3. PR-flyt uten unntak
- All kode går via `issue -> branch -> PR -> checks -> merge`.
- Ingen direkte leveranser til `main` for feature/forbedring.
- Avvik tillates kun via dokumentert incident-unntak (se unntaksprosess).

4. Kvalitetsporter
- Required checks må være grønne:
  - `quality`
  - `CodeQL`
  - `Gitleaks`
- Minst én review før merge.
- Endringer i app-kode uten tester/kontraktoppdatering skal stoppes.

5. Dokumentasjonsplikt
- Vesentlige endringer skal oppdatere:
  - `docs/WORKLOG.md`
  - relevant fagdokumentasjon
  - Confluence ved prosess/arkitektur-endringer

6. Beslutningslogg
- Arkitekturvalg med konsekvens dokumenteres i ADR.
- Uavklarte valg skal ikke skjules i kode.

7. Test- og TDD-prinsipper
- TDD er default for domene-/forretningslogikk.
- Test-first brukes for API/kontrakter/integrasjoner der full TDD ikke er praktisk.
- PR som endrer `src` skal inkludere testendringer eller kontraktendringer i samme PR.

8. Modulgrenser og kontrakter
- Alle moduler skal ha tydelig ansvar og eksplisitte grensesnitt.
- Kontrakter (API/event/schema) er bindende mellom moduler/tjenester.
- Endring i kontrakt krever versjonert oppdatering av kontraktstester.

9. Standard for nye webapper
- Nye apper skal starte fra repo-template i `templates/web-app/`.
- Minimumsstruktur med `src`, `tests`, `contracts` og `docs` er obligatorisk.

## Unntaksprosess (incident-only)

Direkte endringer mot `main` kan kun skje ved kritisk incident:
- incident-id opprettet
- risiko og rollback-plan dokumentert
- post-incident PR opprettes for å dokumentere varig løsning
- avvik logges i `WORKLOG` og gjennomgås i neste governance-review

## Samarbeidsrytme

- Oppstart per initiativ:
  - Problem Brief
  - MVP-avgrensning
  - Architecture v1
- Under gjennomføring:
  - små PR-er
  - tydelige statusoppdateringer
- Ved avslutning:
  - hva ble levert
  - hva gjenstår
  - risiko/teknisk gjeld videre

## Eskaleringsregler

Hvis en leveranse bryter avtalen (for stort scope, uklare krav, manglende kvalitet), stoppes implementasjon til vi har:
- re-prioritert scope
- oppdatert akseptansekriterier
- enighet om neste minste leveranse

## Resultatmål

- Forutsigbare leveranser med færre regressions
- Bedre sporbarhet fra idé til produksjon
- Høyere kvalitet over tid, ikke bare rask første versjon
