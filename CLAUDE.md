# CLAUDE.md — DesignSystem

> This file is the source of truth for all agents working on this project.
> It defines the tech stack, conventions, repo structure, and agent context.
> All agents must read this file before starting any task.

---

## Project Overview

A SwiftUI design system package providing reusable components, tokens, and modifiers for building consistent iOS applications, plus a Demo app showcasing them.

---

## Platforms & Tech Stack

| Layer | Technology | Notes |
|-------|-----------|-------|
| Library | Swift Package Manager | Single-target package, module `DesignSystem`, iOS 17.0+, Swift 6.2 |
| UI | SwiftUI | Component + ViewModel convention (`Name.swift` + `Name+ViewModel.swift`, optional `+Variant`/`+Size`) |
| Demo app | Xcode project via XcodeGen | `Demo/project.yml` → `Demo/DesignSystemDemo.xcodeproj`, single target, consumes the package as a local dependency |
| Testing | XCTest + swift-snapshot-testing | Unit tests (`DesignSystemTests`) and snapshot tests (`DesignSystemSnapshotTests`) |
| CI/CD | GitHub Actions + Fastlane | `spm_ios_build_test.yml` (test on push/PR), `spm_ios_beta.yml` (manual TestFlight upload of Demo app) |

---

## Repository Structure

```
DesignSystem/
├── docs/               # Architecture, ADRs, product, and design docs
├── Sources/            # DesignSystem library source (components, tokens, modifiers)
├── Tests/              # DesignSystemTests (unit) + DesignSystemSnapshotTests
├── Demo/               # DesignSystemDemo app (project.yml + XcodeGen), showcases all components
├── fastlane/           # Fastlane lanes (test, beta)
└── Package.swift
```

---

## Architecture

**Pattern:** Component + ViewModel — see `./docs/architecture/`

**Key ADRs:** See `./docs/architecture/`

---

## Coding Conventions

### General
- Follow language-idiomatic Swift/SwiftUI style
- Keep functions small and focused
- New components follow the existing `Name.swift` + `Name+ViewModel.swift` (+ `+Variant`/`+Size` where relevant) convention

### Git
**Branch Naming:** `{type}/{issue-number}-{short-description}`
**Commit Style:** Conventional Commits (`feat:`, `fix:`, `test:`, `chore:`, etc.)
**Merge Strategy:** Always use **rebase and merge** when merging PRs into `master` to keep a flat, linear history. Do not use merge commits or squash.
**CI gate:** Always wait for CI to pass on the PR before merging into `master`. Never merge a branch with a failing or in-progress CI run.

---

## Testing Conventions

**Approach:** TDD — write failing tests before implementing

| Component | Test Types |
|-----------|-----------|
| spm (DesignSystem) | unit, snapshot |
| Demo app | none — showcase app only, not covered by automated tests |

---

## Fastlane & Ruby

**Use Homebrew Ruby, not system Ruby.** macOS ships Ruby 2.6 at `/usr/bin/ruby`, which is incompatible with the project's `Gemfile.lock`. Always use `/opt/homebrew/opt/ruby/bin/bundle` (or ensure Homebrew Ruby is first on `PATH`):
```
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
```

---

## Living Document

**Every task that encounters a non-obvious problem with a clear solution must update this file.** If an agent hits a recurring pitfall — a build configuration quirk, a platform gotcha, a tooling workaround — and identifies a definitive fix, add a concise note to the relevant section before closing the PR. This prevents future agents from re-discovering the same issues.

---

## Environment & Secrets

**Secret Management:** GitHub Secrets for CI/CD, `.env` files locally (not committed)
