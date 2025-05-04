import SwiftUI
import DesignSystem

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationView {
            DSScroll(.init {
                DSSection(.init(
                    headerText: "Appearance"
                ) {
                    DSToggle(.init(title: "Dark Mode", isOn: $isDarkMode, variant: .primary))
                })
                
                DSSection(.init(
                    headerText: "About"
                ) {
                    VStack(alignment: .leading, spacing: .dsSpacingMd) {
                        DSSectionDetailRow(title: "Version", value: "1.0.0")
                        DSSectionDetailRow(title: "Design System Version", value: "1.0.0")
                    }
                })
            })
            .dsNavigation(title: "Settings")
        }
    }
} 
