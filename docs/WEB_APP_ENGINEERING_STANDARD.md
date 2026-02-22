# Web App Engineering Standard

Dette er repo-versjonen av standarden som også publiseres i Confluence.

Kilde for Confluence-side:
- `docs/confluence/80-WEB-APP-ENGINEERING-STANDARD.md`

Template for nye apper:
- `templates/web-app/`

## Mandatory Rules

- Start alltid med Problem Brief + MVP + Architecture v1 før kode.
- Nye apper skal følge template-struktur i `templates/web-app/`.
- Endring i app `src` skal ha tilhørende test-/kontrakt-/docs-endring i samme PR.
- TDD er default for domene-/forretningslogikk.
- PR må passere `quality`, `CodeQL`, `Gitleaks`.
