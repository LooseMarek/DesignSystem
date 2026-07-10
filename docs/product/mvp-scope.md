# MVP Scope — DesignSystem

**Version:** 1.0
**Date:** 2026-07-10
**Author:** Product Owner (reverse-engineered by migrate-existing-project)
**Status:** Draft

> This document was reverse-engineered from an existing codebase, not written before
> development started. It describes the product **as it exists today**, not as originally
> envisioned. Sections the exploration could not determine with confidence are flagged in
> Open Questions rather than guessed.

---

## Vision

A reusable SwiftUI design system package that gives Marek's own iOS apps a consistent set of
UI components, design tokens, and modifiers, so new apps don't have to rebuild the same
buttons, cards, and typography from scratch.

---

## Problem Statement

Building multiple personal iOS apps means repeatedly rebuilding the same UI primitives
(buttons, text fields, cards, tab views) and re-deriving the same color/typography/spacing
decisions in every project. This package centralizes that work into one dependency that any
of the author's apps can pull in via SPM.

---

## Target User

| Attribute | Detail |
|-----------|--------|
| Primary persona | Marek Loose, building his own iOS apps |
| Platform | iOS (17.0+) |
| Technical proficiency | Expert (author is the sole consumer/maintainer) |
| Key pain point | Rebuilding the same SwiftUI components and design tokens in every new app |
| Motivation to use this app | Faster, more consistent UI across personal projects via a single shared dependency |

---

## Value Proposition

A single `import DesignSystem` gives a consuming app a matched set of components, colors,
fonts, and spacing tokens, plus dark-mode-aware dynamic colors, instead of re-implementing UI
primitives per project.

---

## MVP Goals

1. Provide a complete-enough set of basic/layout/interactive SwiftUI components to build a
   typical app screen without custom UI code.
2. Ship consistent, dynamic (light/dark aware) design tokens for color, typography, and
   spacing.
3. Be consumable as a standard SPM dependency by other iOS projects, with a Demo app that
   documents and visually verifies every component.

---

## Success Metrics

| Metric | Target | Timeframe |
|--------|--------|-----------|
| Adopted as a dependency in other personal apps | ≥ 1 consuming app | Open Question — not confirmed from the codebase |
| Snapshot test coverage of components | Grows alongside new components | Ongoing |

---

## In Scope (MVP)

- [x] `DSButton` — customizable button component (with size and variant options)
- [x] `DSText` — text component with predefined typography styles
- [x] `DSImage` — image component with built-in styling
- [x] `DSTextField` — text input field with consistent styling
- [x] `DSTextEditor` — multi-line text editor component
- [x] `DSToolbarItem` — toolbar item component
- [x] `DSCard` — card component for grouping content
- [x] `DSSection` — section component for organizing content
- [x] `DScrollView` — custom scroll view with consistent styling
- [x] `DSToggle` — toggle switch component
- [x] `DSTabView` — tab view component
- [x] Design tokens: colors (`ColorExtensions`, dynamic/light-dark aware via `DSColorOverrides`), typography (`FontExtensions`), spacing (`CGFloatExtensions`)
- [x] Reusable modifiers: confirmation alert, shadow, navigation (with variant), generic view modifiers
- [x] Demo app (`Demo/DesignSystemDemo`) showcasing tokens and components (tabs for tokens, components, settings)

---

## Out of Scope (Post-MVP)

- macOS support (package currently declares iOS-only platforms)
- Automated UI tests for the Demo app
- Public/third-party consumers — this is currently a personal-use package (README references
  a generic install snippet but the GitHub org is the author's own)

---

## Constraints

| Constraint | Detail |
|------------|--------|
| Timeline | Ongoing personal project, no fixed deadline |
| Platform | iOS 17.0+, Swift 6.2 |
| Monetisation | N/A — internal dependency, not distributed/sold |
| Dependencies | swift-snapshot-testing (test-only) |
| Known risks | Swift 6 language mode (adopted in this migration) may surface strict-concurrency warnings/errors in existing component code over time — not yet fully audited |

---

## Open Questions

- [ ] Is this package intended to ever be a public/third-party-consumable library, or is it
  purely for the author's own apps? The README's generic install instructions suggest the
  former was once considered, but no evidence in the code confirms external consumers exist.
- [ ] The README claims an MIT License but no `LICENSE` file exists in the repo — is MIT the
  actual intent?
- [ ] No macOS target exists despite `swift build` (host) failing without one — is macOS
  support ever planned, or should local development docs simply note to always build/test via
  an iOS destination?

---

## Approval

| Role | Name | Date | Status |
|------|------|------|--------|
| Product Owner | Marek Loose | 2026-07-10 | Draft |
| Architect | Marek Loose | 2026-07-10 | Draft |
