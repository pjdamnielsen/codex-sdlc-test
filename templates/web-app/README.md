# Web App Template

Bruk denne templaten for alle nye webapper.

## Opprett ny app

1. Kopier `templates/web-app/{app-name}` til `apps/<app-name>`.
2. Fyll ut `apps/<app-name>/docs/README.md` og `ARCHITECTURE.md` før implementasjon.
3. Definer kontrakter i `contracts/`.
4. Opprett første tester i `tests/unit`, `tests/integration`, `tests/contract`.

## Guardrail

En PR som endrer `apps/<app-name>/src` skal også endre test- eller kontraktfiler.
