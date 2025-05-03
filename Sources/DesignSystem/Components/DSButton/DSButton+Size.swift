import SwiftUI

extension DSButton {
    public enum Size {
        case small
        case medium
        case large
        
        public var verticalPadding: CGFloat {
            switch self {
            case .small: return .dsSpacingXs
            case .medium: return .dsSpacingSm
            case .large: return .dsSpacingMd
            }
        }
        
        public var horizontalPadding: CGFloat {
            switch self {
            case .small: return .dsSpacingSm
            case .medium: return .dsSpacingMd
            case .large: return .dsSpacingLg
            }
        }
        
        public var font: Font {
            switch self {
            case .small: return .dsCaption
            case .medium: return .dsBody
            case .large: return .dsHeadline
            }
        }
    }
}
