import SwiftUI

extension DSToggle {
    public enum Variant {
        case primary
        case secondary
        
        public var onColor: Color {
            switch self {
            case .primary: return .dsPrimary
            case .secondary: return .dsSurface
            }
        }
        
        public var offColor: Color {
            switch self {
            case .primary: return .dsSurface
            case .secondary: return .dsBackground
            }
        }
    }
}
