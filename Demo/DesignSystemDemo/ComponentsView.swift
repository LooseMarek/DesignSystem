import SwiftUI
import DesignSystem

struct ComponentsView: View {
    var body: some View {
        NavigationView {
            DSScrollView(.init {
                DSSection(.init(
                    headerText: "Buttons"
                ) {
                    DSButtonDemo()
                })
                
                DSSection(.init(
                    headerText: "Text"
                ) {
                    DSTextDemo()
                })
                
                DSSection(.init(
                    headerText: "Input Fields"
                ) {
                    DSTextFieldDemo()
                    DSTextEditorDemo()
                })
                
                DSSection(.init(
                    headerText: "Controls"
                ) {
                    DSToggleDemo()
                })
                
                DSSection(.init(
                    headerText: "Images"
                ) {
                    DSImageDemo()
                })
            })
            .dsNavigation(title: "Components")
        }
    }
}

// MARK: - Component Demos

struct DSButtonDemo: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .dsSpacingMd) {
            DSText(.init(text: "Primary Buttons", font: .dsHeadline))
            HStack(spacing: .dsSpacingSm) {
                DSButton(.init(title: "Primary", action: {}, variant: .primary, size: .large))
                DSButton(.init(title: "Secondary", action: {}, variant: .secondary, size: .large))
            }
            DSText(.init(text: "Disabled State", font: .dsHeadline))
            HStack(spacing: .dsSpacingSm) {
                DSButton(.init(title: "Primary", action: {}, variant: .primary, size: .large, isEnabled: false))
                DSButton(.init(title: "Secondary", action: {}, variant: .secondary, size: .large, isEnabled: false))
            }
            DSText(.init(text: "Loading State", font: .dsHeadline))
            DSButton(.init(title: "Loading", action: {}, variant: .primary, size: .large, isLoading: true))
        }
    }
}

struct DSTextDemo: View {
    var body: some View {
        HStack(spacing: .zero) {
            VStack(alignment: .leading, spacing: .dsSpacingSm) {
                DSText(.init(text: "Large Title", font: .dsLargeTitle))
                DSText(.init(text: "Title", font: .dsTitle))
                DSText(.init(text: "Headline", font: .dsHeadline))
                DSText(.init(text: "Body", font: .dsBody))
                DSText(.init(text: "Caption", font: .dsCaption))
            }
            Spacer()
        }
    }
}

struct DSTextFieldDemo: View {
    @State private var text = ""
    @State private var secureText = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: .dsSpacingMd) {
            DSTextField(.init(title: "Standard Text Field", text: $text, placeholder: "Enter text"))
            DSTextField(.init(title: "Secure Field", text: $secureText, placeholder: "Enter password", isSecure: true))
            DSTextField(.init(title: "Disabled Field", text: $text, placeholder: "Disabled", isRequired: false, isSecure: false, isError: false, errorMessage: nil))
                .disabled(true)
        }
    }
}

struct DSTextEditorDemo: View {
    @State private var text = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: .dsSpacingMd) {
            DSTextEditor(.init(text: $text, placeholder: "Enter your text here..."))
        }
    }
}

struct DSToggleDemo: View {
    @State private var isOn = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: .dsSpacingMd) {
            DSToggle(.init(title: "Toggle Switch", isOn: $isOn, variant: .primary))
            DSToggle(.init(title: "Disabled Toggle", isOn: $isOn, variant: .secondary))
                .disabled(true)
        }
    }
}

struct DSImageDemo: View {
    var body: some View {
        VStack(spacing: .dsSpacingMd) {
            DSImage(.init(image: Image(systemName: "photo"), size: .large, contentMode: .fit, backgroundColor: .dsSurface, cornerRadius: .dsCornerRadiusMd))
        }
    }
}
