---
name: New app bootstrap
about: Initialize a new web app with mandatory engineering standards
title: "[Bootstrap] "
labels: ["type:task", "status:triage", "bootstrap"]
assignees: []
---

## App Identity
- App name:
- Business purpose:
- Primary users:

## Mandatory Pre-Code Artifacts
- [ ] Problem Brief completed
- [ ] MVP scope defined (in/out)
- [ ] Architecture v1 documented
- [ ] ADR-001 created
- [ ] Initial backlog created with acceptance criteria

## Mandatory Engineering Standard Setup
- [ ] Initialize from `templates/web-app/`
- [ ] Create `apps/<app-name>/src/`
- [ ] Create `apps/<app-name>/tests/unit/`
- [ ] Create `apps/<app-name>/tests/integration/`
- [ ] Create `apps/<app-name>/tests/contract/`
- [ ] Create `apps/<app-name>/contracts/`
- [ ] Create `apps/<app-name>/docs/README.md`
- [ ] Create `apps/<app-name>/docs/ARCHITECTURE.md`

## Testing & TDD Plan
- [ ] TDD approach defined for domain logic
- [ ] Test-first plan defined for API/contract/integration
- [ ] Initial test cases listed
- [ ] Coverage expectation stated

## Contracts & Boundaries
- [ ] API contracts identified
- [ ] Event/schema contracts identified
- [ ] Module boundaries documented

## Definition of Done for Bootstrap
- [ ] First PR created with scaffold + docs + tests placeholders
- [ ] CI passes (`quality`, `CodeQL`, `Gitleaks`)
- [ ] Confluence pages updated

## References
- Delivery Contract: `docs/confluence/70-DELIVERY-CONTRACT.md`
- Web App Engineering Standard: `docs/confluence/80-WEB-APP-ENGINEERING-STANDARD.md`
- Repo standard: `docs/WEB_APP_ENGINEERING_STANDARD.md`
