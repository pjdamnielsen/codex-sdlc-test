# Project Bootstrap

Bruk denne pakken for å starte nye prosjekter med samme SDLC-baseline.

## Kommando

```bash
scripts/bootstrap_project.sh <project-name> [--target-root <path>] [--remote <git-url>]
```

Eksempel:

```bash
scripts/bootstrap_project.sh my-new-app --target-root "/Users/pjdn/Documents/Codex projects" --remote "git@github.com:pjdamnielsen/my-new-app.git"
```

## Hva scriptet gjør

- oppretter ny prosjektmappe
- kopierer SDLC-baseline (workflows, docs, templates, scripts)
- fjerner lokale secret-filer (`.github.env`, `.confluence.env`, `.auth/`)
- erstatter noen hardkodede repo-navn med prosjektplaceholder
- initialiserer nytt git-repo på `main`
- legger til `origin` hvis `--remote` er oppgitt

## Etter bootstrap

1. Oppdater prosjektspesifikk info i `README` og Confluence-kilder.
2. Sett opp GitHub secrets/environments for det nye repoet.
3. Kjør første PR med `New app bootstrap` issue-template.
