# DesignSystem

A comprehensive SwiftUI design system package that provides a set of reusable components, tokens, and modifiers for building consistent iOS applications.

## Requirements

- iOS 18.0+
- Swift 6.1+
- Xcode 15.0+

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/DesignSystem.git", from: "1.0.0")
]
```

Or add it through Xcode:
1. File > Add Packages...
2. Enter the package URL
3. Select your target and click "Add Package"

## Components

The Design System includes the following components:

### Basic Components
- `DSButton`: Customizable button component
- `DSText`: Text component with predefined styles
- `DSImage`: Image component with built-in styling
- `DSTextField`: Text input field with consistent styling
- `DSTextEditor`: Text editor component
- `DSToolbarItem`: Toolbar item component

### Layout Components
- `DSCard`: Card component for content grouping
- `DSSection`: Section component for content organization
- `DScrollView`: Custom scroll view with consistent styling
- `DSForm`: Form component for data input

### Interactive Components
- `DSToggle`: Toggle switch component

## Tokens

The package includes design tokens for consistent styling:

### Colors
- Predefined color palette accessible through `ColorExtensions`

### Typography
- Font styles and sizes through `FontExtensions`

### Spacing
- Consistent spacing values through `CGFloatExtensions`

## Usage

### Basic Component Usage

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

### Using Design Tokens

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

## Demo

The package includes a demo project that showcases all components and their usage. You can find it in the `Demo` directory.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details. 