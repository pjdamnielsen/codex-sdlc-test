# Session Pre-Flight Routine

Denne rutinen brukes i starten av hver ny Codex-tråd for å bekrefte at vi jobber i riktig prosjekt.

## Kommando

```bash
scripts/session_preflight.sh
```

Valgfritt med forventet remote-pattern:

```bash
scripts/session_preflight.sh <owner>/<repo>
```

## Må være bekreftet før endringer

- riktig arbeidsmappe (`pwd`)
- riktig git-repo
- riktig branch
- riktig origin remote
- forstått git-status

## Regel

Ingen kodeendringer før pre-flight er grønn.
Ved mismatch skal arbeidet stoppes og workspace korrigeres.
