# Session Pre-Flight

Denne rutinen er obligatorisk i starten av hver ny Codex-tråd.

## Kommando

```bash
scripts/session_preflight.sh
```

Valgfritt (forventet remote):

```bash
scripts/session_preflight.sh pjdamnielsen/codex-sdlc-test
```

## Hva den sjekker

- aktiv arbeidsmappe (`pwd`)
- at vi er i et git-repo
- aktiv branch
- origin remote
- nåværende git-status

## Arbeidsregel

Ingen kodeendringer før pre-flight viser:
- riktig mappe
- riktig remote
- forventet branch/state

Hvis noe er feil: stopp og korriger workspace før videre arbeid.
