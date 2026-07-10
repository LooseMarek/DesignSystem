# ADR-002 — Bump to Swift 6.2 / iOS 17

**Date:** 2026-07-10
**Status:** Accepted
**Author:** Architect
**Deciders:** Marek Loose

---

## Context

At the start of this migration, `Package.swift` declared `swift-tools-version:5.3` and
`platforms: [.iOS(.v14)]`, while `README.md` claimed iOS 18.0+/Swift 6.1+/Xcode 15.0+ — an
inconsistency traced to two prior commits both titled "Lower Swift and iOS version" (reason
not recorded in commit history), after which the README was apparently never updated to match.
The user was asked which reflected real intent and confirmed the intent is a fresh, explicit
target: Swift 6.2 / iOS 17.

---

## Decision

`Package.swift` now declares `// swift-tools-version: 6.2` and `platforms: [.iOS(.v17)]`. The
Demo app's `project.yml` targets iOS 17 with `SWIFT_VERSION: 6.0` (Xcode's discrete language-
mode setting nearest to toolchain 6.2).

---

## Options Considered

### Option 1: Keep Package.swift as source of truth (iOS 14/Swift 5.3), fix the stale README

**Description:** Treat the two "lower version" commits as the real, deliberate target and
correct the README to match.

**Pros:**
- Zero build/compatibility risk
- No functional change bundled into a structural migration

**Cons:**
- Contradicts the user's stated actual intent once asked directly

---

### Option 2: Bump to Swift 6.2 / iOS 17 (chosen)

**Description:** Raise the toolchain and deployment target, explicitly confirmed by the user
during Step 2 clarifying questions.

**Pros:**
- Matches confirmed real intent
- Package already builds and passes tests (unit + snapshot) against this target via
  `xcodebuild -destination "platform=iOS Simulator,name=iPhone 17 Pro"`

**Cons:**
- Bare `swift build` (which targets the macOS host, not iOS, since the package declares no
  macOS platform) fails with availability errors — pre-existing behavior for this iOS-only
  package, not introduced by this bump, but worth noting for anyone reaching for `swift build`
  instead of an iOS-destination `xcodebuild`
- Swift 6 language mode is the default under swift-tools 6.2; existing component code has not
  been audited for strict-concurrency correctness beyond what the test suite covers

---

## Rationale

The user was asked directly given the Package.swift/README contradiction, and explicitly chose
Swift 6.2/iOS 17 over preserving the as-found iOS 14/Swift 5.3 state.

---

## Consequences

**Positive:**
- Package.swift and README (and now `Demo/project.yml`) agree on a single, confirmed target
- Package and Demo app both build and test green against iOS 17 / iPhone 17 Pro simulator

**Negative / Trade-offs:**
- Raises the minimum iOS version for any app consuming this package from 14 to 17 — a breaking
  change for any hypothetical existing consumer (none identified in this migration)

**Risks:**
- Swift 6 strict concurrency checking is now active by default; not fully audited — flagged as
  an Open Question in `docs/product/mvp-scope.md`

---

## Related

| Type | Reference |
|------|-----------|
| Supersedes | — |
| Related ADRs | ADR-000 |
| Related issues | — |
