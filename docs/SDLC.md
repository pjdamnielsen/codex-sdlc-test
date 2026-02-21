# SDLC

## Mål

Etablere en komplett, sporbar og sikker utviklingsprosess fra idé til drift.

## Faser og leveranser

### 1. Planlegging
- Produktmål og scope
- Prioritert backlog
- Akseptansekriterier

### 2. Design
- Arkitekturvalg
- Tekniske beslutninger (ADR ved behov)
- Risikoanalyse

### 3. Implementasjon
- Små, sporbare endringer per branch
- Code review i PR
- Oppdatert dokumentasjon i samme PR

### 4. Verifisering
- Unit/integration/e2e etter behov
- Lint/typecheck
- Sikkerhetsscanning av avhengigheter

### 5. Release
- Versjonering
- Release-notater
- Godkjenning før produksjon

### 6. Drift
- Logging og monitorering
- Incident-håndtering
- Kontinuerlig forbedring

## Kvalitetsporter (minimum)

- Grønn CI på PR
- Minst én reviewer
- Oppdatert dokumentasjon
- Ingen kjente kritiske sikkerhetsfunn
