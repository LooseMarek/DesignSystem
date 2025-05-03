import SwiftUI

public struct DSNavigationModifier: ViewModifier {
    let title: String
    let variant: Variant
    
    public func body(content: Content) -> some View {
        switch variant {
        case .primary:
            content
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(title)
                .toolbarBackground(Color.dsSurface, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .background(Color.dsBackground)
        case .secondary:
            content
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(title)
                .background(Color.dsBackground)
        }
    }
}

extension View {
    public func dsNavigation(
        title: String,
        variant: DSNavigationModifier.Variant = .primary
    ) -> some View {
        modifier(DSNavigationModifier(
            title: title,
            variant: variant
        ))
    }
}
