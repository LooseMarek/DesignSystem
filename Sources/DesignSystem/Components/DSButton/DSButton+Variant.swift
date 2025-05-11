import SwiftUI

extension DSButton {
    public enum Variant {
        case primary
        case secondary
        case tertiary
        case destructive
        case fab
        
        public var backgroundColor: Color {
            switch self {
            case .primary: return .dsPrimary
            case .secondary: return .dsSurface
            case .tertiary: return .clear
            case .destructive: return .dsError
            case .fab: return .dsSurface
            }
        }
        
        public var foregroundColor: Color {
            switch self {
            case .primary: return .dsText
            case .secondary: return .dsText
            case .tertiary: return .dsPrimary
            case .destructive: return .dsBackground
            case .fab: return .dsPrimary
            }
        }
    }
}
