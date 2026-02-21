# Releases

## Versjonering

- Prosjektet bruker Semantic Versioning (`MAJOR.MINOR.PATCH`).
- `VERSION` er kilden for gjeldende versjon.
- Git-tag må være `v<version>` og matche `VERSION`.

## Release-flyt

1. Oppdater `VERSION`.
2. Oppdater `CHANGELOG.md` med ny seksjon for versjonen.
3. Commit + push til `main`.
4. Opprett og push tag:
   - `git tag vX.Y.Z`
   - `git push origin vX.Y.Z`
5. GitHub Actions workflow `Release` lager GitHub Release automatisk.

## Kvalitetskrav før release

- `CI` og `Security` må være grønne.
- Relevante issues må være lukket.
- Dokumentasjon må være oppdatert.
