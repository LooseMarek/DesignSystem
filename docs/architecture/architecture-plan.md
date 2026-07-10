# Architecture Plan — DesignSystem

**Date:** 2026-07-10
**Based on:** MVP Scope v1.0 (reverse-engineered)
**Migration source:** Existing codebase, migrated to Agentic setup by `migrate-existing-project`

> This document was reverse-engineered from an existing codebase. It describes the
> architecture **as it exists after migration**, not a plan written before development.
> Any decision that was inherited from the pre-existing project (rather than freshly
> decided during migration) is marked "Inherited" in the ADR table below.

---

## Project Identity

- **Name:** DesignSystem
- **Platforms:** iOS (SPM library + Demo app)
- **Scale:** Solo side project

---

## Component Structure

| Folder | Purpose |
|--------|---------|
| `Sources/DesignSystem/` | The library itself — Components, Modifiers, Tokens |
| `Tests/DesignSystemTests/` | Unit tests |
| `Tests/DesignSystemSnapshotTests/` | Snapshot tests (swift-snapshot-testing) |
| `Demo/` | `DesignSystemDemo` Xcode app (XcodeGen `project.yml`), consumes the package locally |
| `fastlane/` | Fastlane lanes (`test`, `beta`) |
| `docs/` | Documentation, ADRs, design specs |

---

## Tech Stack

| Component | Stack | Architecture Pattern |
|-----------|-------|---------------------|
| `Sources/DesignSystem/` (spm) | Swift Package Manager, SwiftUI, iOS 17.0+, Swift 6.2 | Component + ViewModel (`Name.swift` + `Name+ViewModel.swift`, optional `+Variant`/`+Size`) |
| `Demo/` (demo app) | SwiftUI app, XcodeGen-generated Xcode project | Simple tab-based showcase (`MainTabView`, `TokensView`, `ComponentsView`, `SettingsView`) |

---

## Testing Strategy

| Component | Enabled Test Types |
|-----------|-------------------|
| `Sources/DesignSystem/` (spm) | Unit Tests, Snapshot Tests |
| `Demo/` (demo app) | None (showcase app only) |

---

## Third-Party Dependencies

| Category | Tool | Notes |
|----------|------|-------|
| Analytics | none | |
| Crash reporting | none | |
| Authentication | none | |
| Testing | swift-snapshot-testing 1.19.2 | Test-only dependency, added during migration |

---

## Infrastructure

| Item | Decision | Details |
|------|----------|---------|
| GitHub Project | Yes | Views: Roadmap, Board, Backlog |
| GitHub Actions CI | Yes | Components: spm (build/test on push+PR), Demo app (manual TestFlight beta) |
| Fastlane | Yes | Components: spm (`test` lane), Demo app (`beta` lane) |
| API Hosting | N/A | No API component |
| Promo Web Hosting | N/A | No promo web component |

### Fastlane Details

| Field | Value |
|-------|-------|
| Bundle ID | com.marekloose.DesignSystemDemo |
| Apple Developer Team ID | 9JVYUSJU3D |
| App Store Connect App ID | Open Question — not yet created/confirmed |
| Xcode scheme | DesignSystemDemo |
| TestFlight internal group | "Internal Testers" (default, not yet confirmed to exist in App Store Connect) |
| Crash reporting tool | none |

---

## Migration Notes

> What was restructured (old path → new path), what was auto-detected vs. confirmed by the
> user, and anything that could not be migrated automatically and needs manual follow-up.

| Old Path | New Path | Notes |
|----------|----------|-------|
| `Package.swift` (swift-tools 5.3, iOS 14) | `Package.swift` (swift-tools 6.2, iOS 17) | Version bump confirmed by user; adopts Swift 6 language mode by default — not yet fully concurrency-audited |
| `Demo/DesignSystemDemo.xcodeproj` (hand-created, no `project.yml`) | Same location, now XcodeGen-managed via `Demo/project.yml` | No folder move — user confirmed `Demo/` already matches convention closely enough; kept as a single target (not split into the standard Default/Custom demo scaffold) since a real, working demo app already existed |
| No `Tests/` folder | `Tests/DesignSystemTests/`, `Tests/DesignSystemSnapshotTests/` | New — package had zero test coverage before migration |
| No `fastlane/`, `.github/workflows/` | `fastlane/`, `.github/workflows/spm_ios_build_test.yml`, `.github/workflows/spm_ios_beta.yml` | New — no prior CI/CD existed to preserve |
| No `docs/` | `docs/product/`, `docs/architecture/` | New — reverse-engineered from the codebase in this migration |

**Not moved:** `Sources/`, root `Package.swift` — already at the conventional `spm` repo-root location, no restructuring needed.

**Manual follow-up needed:**
- GitHub Actions workflows assume a self-hosted macOS runner (standard Agentic CI convention) — confirm one is registered for `LooseMarek/DesignSystem`.
- `fastlane/Appfile`/CI secrets for App Store Connect API auth are not yet configured — `beta` lane will fail without them.
- No `LICENSE` file exists despite the README referencing MIT.

---

## ADRs

| # | Title | Decision | Origin |
|---|-------|----------|--------|
| ADR-000 | Migrate to Agentic Setup | Adopt XcodeGen + Fastlane + GitHub Actions + reverse-engineered docs without disrupting the existing package/Demo app | New |
| ADR-001 | Component + ViewModel Pattern | Each UI component pairs a SwiftUI view with a `+ViewModel` type; some add `+Variant`/`+Size` | Inherited |
| ADR-002 | Bump to Swift 6.2 / iOS 17 | Raise minimum toolchain and deployment target from Swift 5.3/iOS 14 | New |

---

## Notes

The package previously targeted iOS 14 / Swift 5.3 (lowered from a higher version in two
prior commits — reason not recorded). This migration raises it back to iOS 17 / Swift 6.2 per
explicit user confirmation; see ADR-002 and the Open Questions in `mvp-scope.md` regarding
Swift 6 strict concurrency risk in existing component code.
