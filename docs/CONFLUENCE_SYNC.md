# Confluence Sync

Automatisk sync oppdaterer Confluence-sider fra `docs/confluence/`.

## Workflow

- Fil: `.github/workflows/confluence-sync.yml`
- Trigger:
  - Manuelt (`workflow_dispatch`)
  - Push til `main` når filer i `docs/confluence/` eller `scripts/confluence_sync.py` endres

## GitHub Secrets som må settes

- `CONFLUENCE_BASE_URL` (eksempel: `https://pjdamnielsen.atlassian.net/wiki`)
- `CONFLUENCE_EMAIL`
- `CONFLUENCE_API_TOKEN`
- `CONFLUENCE_SPACE_KEY` (for deg: `SD`)

## Sette secrets i GitHub

1. Gå til repo -> `Settings` -> `Secrets and variables` -> `Actions`.
2. Velg `New repository secret`.
3. Legg inn alle fire secrets.

## Kjør manuelt første gang

1. Gå til repo -> `Actions` -> `Confluence Sync`.
2. Klikk `Run workflow`.
3. Verifiser at sidene oppdateres i Confluence-space.
