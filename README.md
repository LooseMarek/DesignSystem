# DesignSystem

> A SwiftUI design system package providing reusable components, tokens, and modifiers for building consistent iOS applications, plus a Demo app showcasing them.

---

## Requirements

- iOS 17.0+
- Swift 6.2+
- Xcode 16.0+

---

## Getting Started

### Clone the repository

```bash
git clone https://github.com/LooseMarek/DesignSystem.git
cd DesignSystem
```

---

## Project Structure

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

## CI/CD

- **GitHub Actions:** `.github/workflows/spm_ios_build_test.yml` runs the package's unit + snapshot tests on every push/PR to `master`. `.github/workflows/spm_ios_beta.yml` uploads the Demo app to TestFlight on manual dispatch.
- **Fastlane:** `fastlane ios test` runs the package's test suite; `fastlane ios beta` builds and uploads the Demo app to TestFlight.

---

## Development

Refer to `CLAUDE.md` for agent workflow, coding conventions, and architecture decisions.

---

## Project Notes (preserved from previous README)

### Installation

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/LooseMarek/DesignSystem.git", from: "1.0.0")
]
```

Or add it through Xcode:
1. File > Add Packages...
2. Enter the package URL
3. Select your target and click "Add Package"

### Components

The Design System includes the following components:

#### Basic Components
- `DSButton`: Customizable button component
- `DSText`: Text component with predefined styles
- `DSImage`: Image component with built-in styling
- `DSTextField`: Text input field with consistent styling
- `DSTextEditor`: Text editor component
- `DSToolbarItem`: Toolbar item component

#### Layout Components
- `DSCard`: Card component for content grouping
- `DSSection`: Section component for content organization
- `DScrollView`: Custom scroll view with consistent styling

#### Interactive Components
- `DSToggle`: Toggle switch component
- `DSTabView`: Tab view component

### Tokens

The package includes design tokens for consistent styling:

#### Colors
- Predefined color palette accessible through `ColorExtensions`

#### Typography
- Font styles and sizes through `FontExtensions`

#### Spacing
- Consistent spacing values through `CGFloatExtensions`

### Usage

#### Basic Component Usage

```swift
import DesignSystem

struct ContentView: View {
    var body: some View {
        VStack {
            DSButton(title: "Click Me", action: {})
            DSText("Hello, World!")
            DSCard {
                Text("Card Content")
            }
        }
    }
}
```

#### Using Design Tokens

```swift
import DesignSystem

struct StyledView: View {
    var body: some View {
        Text("Styled Text")
            .font(.dsBody)
            .foregroundColor(.dsPrimary)
            .padding(.dsMedium)
    }
}
```

### Demo

The package includes a demo project that showcases all components and their usage. You can find it in the `Demo` directory.

### Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

## License

This project is licensed under the MIT License. **Open question:** no `LICENSE` file exists in the repo yet despite this being a public repo that references MIT — add one to make the license binding, or correct this section if MIT isn't actually intended.
