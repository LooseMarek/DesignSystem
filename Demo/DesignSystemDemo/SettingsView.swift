import SwiftUI
import DesignSystem

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationView {
            DSForm(.init {
                DSSection(.init(
                    headerText: "Appearance"
                ) {
                    DSToggle(.init(title: "Dark Mode", isOn: $isDarkMode, variant: .primary))
                })
                
                DSSection(.init(
                    headerText: "About"
                ) {
                    HStack {
                        DSText(.init(text: "Version", font: .dsBody))
                        Spacer()
                        DSText(.init(text: "1.0.0", font: .dsBody, color: .dsTextSecondary))
                    }
                    HStack {
                        DSText(.init(text: "Design System Version", font: .dsBody))
                        Spacer()
                        DSText(.init(text: "1.0.0", font: .dsBody, color: .dsTextSecondary))
                    }
                })
            })
            .dsNavigation(title: "Settings")
        }
    }
} 
