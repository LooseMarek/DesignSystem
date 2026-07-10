# ADR-001 — Component + ViewModel Pattern

**Date:** 2026-07-10
**Status:** Accepted
**Author:** Architect
**Deciders:** (inherited from pre-existing codebase, documented retroactively)

---

## Context

Every component in `Sources/DesignSystem/Components/` (DSButton, DSText, DSCard, DSTabView,
etc.) follows the same file-splitting convention: a `Name.swift` SwiftUI view paired with a
`Name+ViewModel.swift` type holding its configuration/state, and — for components with
multiple visual forms — additional `Name+Variant.swift` or `Name+Size.swift` extensions
(e.g. `DSButton+Variant.swift`, `DSButton+Size.swift`). This predates the migration; it was not
decided during this migration pass, only documented here for the first time.

---

## Decision

New components added to this package should follow the same convention: a view file, a
`+ViewModel` file for its configuration, and `+Variant`/`+Size` extension files if the
component needs multiple visual forms.

---

## Options Considered

### Option 1: Component + ViewModel (chosen, inherited)

**Description:** Each component is a SwiftUI `View` plus a plain `ViewModel` struct holding
its configuration, kept in separate files.

**Pros:**
- Clear separation between a component's visual definition and its configuration surface
- Consistent, predictable file layout across all 11 existing components

**Cons:**
- Not a full state-management architecture (no binding/store pattern) — fine for a stateless
  component library, would need reconsideration if components ever need internal state

---

### Option 2: Single-file components *(not used)*

**Description:** Keep view + configuration in one file per component.

**Pros:**
- Fewer files

**Cons:**
- Was not the pattern already in use; rejected implicitly by every existing component

---

## Rationale

This is the pattern already present in 100% of existing components; it is documented here
rather than re-decided.

---

## Consequences

**Positive:**
- Predictable structure makes it easy to scaffold new components by copying an existing one

**Negative / Trade-offs:**
- None identified beyond the file-count overhead of a multi-file-per-component convention

**Risks:**
- None identified

---

## Related

| Type | Reference |
|------|-----------|
| Supersedes | — |
| Related ADRs | ADR-000 |
| Related issues | — |
