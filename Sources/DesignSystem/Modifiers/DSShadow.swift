import SwiftUI

public struct DSShadow {
    public let color: Color
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat
    
    @MainActor
    public static let small = DSShadow(
        color: Color.black.opacity(0.1),
        radius: 4,
        x: 0,
        y: 2
    )
    
    @MainActor
    public static let medium = DSShadow(
        color: Color.black.opacity(0.15),
        radius: 8,
        x: 0,
        y: 4
    )
    
    @MainActor
    public static let large = DSShadow(
        color: Color.black.opacity(0.2),
        radius: 16,
        x: 0,
        y: 8
    )
}

// MARK: - View Modifiers

public struct DSShadowModifier: ViewModifier {
    let shadow: DSShadow
    
    public func body(content: Content) -> some View {
        content
            .shadow(
                color: shadow.color,
                radius: shadow.radius,
                x: shadow.x,
                y: shadow.y
            )
    }
}

extension View {
    public func dsShadow(_ shadow: DSShadow) -> some View {
        modifier(DSShadowModifier(shadow: shadow))
    }
}
