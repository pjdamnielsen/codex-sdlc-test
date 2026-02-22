# Scaling Governance Routine (Timing for 5-9)

Denne rutinen sikrer at tiltak 5-9 gjennomføres når prosjektet når riktig modenhet.

## Tiltak som aktiveres via rutinen

5. Testpolicy i CI (coverage-gates, contract-test gates)
6. Observability-minimum per app
7. Sikkerhetsbaseline per app (threat model, rotation/SLA)
8. Miljø- og release-governance (approval/regler)
9. KPI-styring (engineering health)

## Triggerpunkter

Aktiver rutinen når ett eller flere av disse inntreffer:
- Ny app bootstrap issue opprettes
- Første app når "klar for intern test"
- Teamet får ny utvikler
- Flere enn 2 aktive appmoduler/tjenester
- Før første produksjonsdeploy

## Fast rytme

- Ukentlig (30 min): leveransehygiene
  - åpne PR-er, teststatus, docs freshness
- Månedlig (60 min): arkitektur og kvalitet
  - ADR-review, risiko, tech debt, KPI-trend
- Før release/deploy:
  - release checklist + rollback-verifisering

## Kontrolliste per tiltak

### 5) Testpolicy i CI
- coverage-threshold per app definert
- contract-tests er required check
- kritiske e2e-flyter definert

### 6) Observability
- standard log-format + correlation id
- health/readiness endpoints
- baseline alerts definert

### 7) Sikkerhet
- threat model oppdatert
- secrets-rotasjon dokumentert
- SLA for sårbarhetslukking satt

### 8) Miljø/release governance
- `dev/stage/prod` approvals validert
- deploy-runbooks oppdatert
- rollback testet siste 30 dager

### 9) KPI-styring
- lead time, change failure rate, MTTR
- test flakiness
- docs freshness
- open critical vulns

## Ansvar

- Owner: Tech lead / repo owner
- Executor: Codex + reviewer
- Artefakt: oppdatert WORKLOG + Confluence-notat etter hver månedlig review
