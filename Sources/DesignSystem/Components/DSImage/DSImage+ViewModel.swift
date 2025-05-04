import SwiftUI

extension DSImage {
    public struct ViewModel {
        public let image: Image
        public let size: Size
        public let contentMode: ContentMode
        public let backgroundColor: Color
        public let cornerRadius: CGFloat
        
        public init(
            image: Image,
            size: Size,
            contentMode: ContentMode,
            backgroundColor: Color = .clear,
            cornerRadius: CGFloat = .zero
        ) {
            self.image = image
            self.size = size
            self.contentMode = contentMode
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
        }
    }
}
