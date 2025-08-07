import SwiftUI

@available(iOS 16.0, *)
public struct DSNavigationModifier: ViewModifier {
    let title: String
    let variant: Variant
    
    public func body(content: Content) -> some View {
        switch variant {
        case .primary:
            if #available(iOS 26.0, *) {
                content
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle(title)
                    .toolbarBackground(.visible, for: .navigationBar)
                    .background(Color.dsBackground)
            } else {
                content
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle(title)
                    .toolbarBackground(Color.dsSurface, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                    .background(Color.dsBackground)
            }
        case .secondary:
            content
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(title)
                .background(Color.dsBackground)
        }
    }
}

@available(iOS 16.0, *)
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
