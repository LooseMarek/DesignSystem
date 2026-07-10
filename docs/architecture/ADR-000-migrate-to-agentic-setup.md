# ADR-000 — Migrate to Agentic Setup

**Date:** 2026-07-10
**Status:** Accepted
**Author:** Architect
**Deciders:** Marek Loose

---

## Context

DesignSystem was an already-working SwiftUI package with a hand-built Demo app, created
directly in Xcode with no `project.yml`, no Fastlane, no GitHub Actions, no test targets, and
no `docs/` tree. To bring it onto the same footing as projects `phase-2-setup` scaffolds from
scratch — and unlock downstream `phase-3`/`phase-4`/`phase-5` skills — it needed to be migrated
into the Agentic setup without breaking the working package or Demo app.

---

## Decision

Run `migrate-existing-project` to: reverse-engineer `docs/product/mvp-scope.md` and
`docs/architecture/architecture-plan.md` + ADRs from the existing code; generate
`docs/architecture/architecture.json`; add `Demo/project.yml` (XcodeGen) for the existing,
unmodified Demo app; add unit + snapshot test targets to the SPM package; add Fastlane
(`test`/`beta` lanes) and GitHub Actions CI; extend `.gitignore`, README, and add a project
`CLAUDE.md`; do all of this as a series of small, individually-committed, revertible git
commits behind a rollback tag.

---

## Options Considered

### Option 1: Full migration via `migrate-existing-project` (chosen)

**Description:** Reverse-engineer docs, add missing infra (XcodeGen, tests, Fastlane, CI),
without moving or rewriting existing source.

**Pros:**
- Existing Demo app and package source untouched beyond confirmed version bumps
- Every downstream Agentic skill can now operate on this repo like any freshly scaffolded one
- Fully reversible via the `pre-agentic-migration-*` git tag

**Cons:**
- Some divergence from the exact `phase-2-setup` demo-app scaffold (single target instead of
  Default/Custom) since the real Demo app didn't match that shape

---

### Option 2: Leave the project as-is

**Description:** Do nothing; keep developing without XcodeGen/Fastlane/CI/docs.

**Pros:**
- Zero migration risk

**Cons:**
- No CI, no test coverage, no reverse-engineered docs; every future Agentic skill would need
  special-casing for this project indefinitely

---

## Rationale

Option 1 was chosen because the project is a solo side project with an already-working Demo
app worth preserving exactly as-is, and the migration skill is explicitly designed to layer
Agentic infrastructure on top of real code without regenerating it.

---

## Consequences

**Positive:**
- CI now runs on every push/PR; TestFlight distribution is one Fastlane lane away
- Package has test coverage (unit + snapshot) for the first time
- `docs/` gives future work (human or agent) a documented picture of product scope and
  architecture instead of needing to re-derive it from code every time

**Negative / Trade-offs:**
- Package's minimum deployment target/Swift version was raised (iOS 14→17, Swift 5.3→6.2) as
  part of this same pass, at the user's explicit request — a functional change bundled into
  what is nominally a structural migration
- Demo app's `project.yml` deviates from the standard Default/Custom two-target scaffold

**Risks:**
- Swift 6 language mode (default under swift-tools 6.2) may surface strict-concurrency issues
  in existing component code that haven't been fully audited yet — flagged as an Open Question
  in `mvp-scope.md`
- GitHub Actions workflows assume a self-hosted macOS runner is registered on this repo; not
  verified during migration

---

## Related

| Type | Reference |
|------|-----------|
| Supersedes | — |
| Related ADRs | ADR-001, ADR-002 |
| Related issues | — |
