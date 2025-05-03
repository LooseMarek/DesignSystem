import SwiftUI

extension DSImage {
    public enum Size {
        case small
        case medium
        case large
        case custom(CGSize)
        
        public var value: CGSize {
            switch self {
            case .small: return CGSize(width: 24, height: 24)
            case .medium: return CGSize(width: 48, height: 48)
            case .large: return CGSize(width: 96, height: 96)
            case .custom(let size): return size
            }
        }
    }
}
