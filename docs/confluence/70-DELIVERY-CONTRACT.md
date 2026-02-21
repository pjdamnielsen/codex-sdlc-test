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

2. Obligatorisk issue-ramme før kode
- Hver sak skal ha:
  - problem/mål
  - avgrensning (in/out)
  - akseptansekriterier
  - Definition of Done

3. PR-flyt uten unntak
- All kode går via `issue -> branch -> PR -> checks -> merge`.
- Ingen direkte leveranser til `main`.

4. Kvalitetsporter
- Required checks må være grønne:
  - `quality`
  - `CodeQL`
  - `Gitleaks`
- Minst én review før merge.

5. Dokumentasjonsplikt
- Vesentlige endringer skal oppdatere:
  - `docs/WORKLOG.md`
  - relevant fagdokumentasjon
  - Confluence ved prosess/arkitektur-endringer

6. Beslutningslogg
- Arkitekturvalg med konsekvens dokumenteres i ADR.
- Uavklarte valg skal ikke skjules i kode.

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
