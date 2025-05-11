import SwiftUI

extension DSButton {
    public struct ViewModel {
        public let title: String?
        public let action: () -> Void
        public let variant: Variant
        public let size: Size
        public let minWidth: CGFloat?
        public let maxWidth: CGFloat?
        public let isEnabled: Bool
        public let isLoading: Bool
        public let image: DSImage.ViewModel?
        
        public init(
            title: String? = nil,
            action: @escaping () -> Void,
            variant: Variant,
            size: Size,
            minWidth: CGFloat? = nil,
            maxWidth: CGFloat? = nil,
            isEnabled: Bool = true,
            isLoading: Bool = false,
            image: DSImage.ViewModel? = nil
        ) {
            self.title = title
            self.action = action
            self.variant = variant
            self.size = size
            self.minWidth = minWidth
            self.maxWidth = maxWidth
            self.isEnabled = isEnabled
            self.isLoading = isLoading
            self.image = image
        }
    }
}
