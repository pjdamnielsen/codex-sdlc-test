# SDLC Prosess

## Flyt i praksis

1. Opprett issue i GitHub (Bug/Feature/Task)
2. Lag branch fra `main`
3. Gjør endring + oppdater docs
4. Opprett PR med `Closes #<issue>`
5. Vent på checks (`quality`, `CodeQL`, `Gitleaks`)
6. Få review og merge PR
7. Verifiser at issue er lukket automatisk

## Etablert kontrollnivå

- Branch protection på `main`:
  - PR påkrevd
  - minst 1 approval
  - required checks påkrevd
- Security checks:
  - CodeQL
  - Gitleaks
  - Dependabot updates
- Dokumentasjon:
  - Worklog i repo
  - Confluence sync workflow

## Release-flyt

1. Oppdater `VERSION`
2. Oppdater `CHANGELOG.md`
3. Push tag `vX.Y.Z`
4. `Release`-workflow oppretter GitHub Release

## Deploy-flyt

- `Deploy Dev`: manuell, støtter dry-run
- `Deploy Stage`: manuell, støtter dry-run
- `Deploy Prod`: manuell, krever `confirm=DEPLOY` ved faktisk deploy

## Kvalitetsporter

- Grønn `quality`
- Grønn `CodeQL`
- Grønn `Gitleaks`
- Minst én reviewer før merge
