import SwiftUI

extension DSText {
    public struct ViewModel {
        public let text: String
        public let font: Font
        public let color: Color?
        public let alignment: TextAlignment
        public let lineLimit: Int?
        
        public init(
            text: String,
            font: Font,
            color: Color? = nil,
            alignment: TextAlignment = .leading,
            lineLimit: Int? = nil
        ) {
            self.text = text
            self.font = font
            self.color = color
            self.alignment = alignment
            self.lineLimit = lineLimit
        }
    }
}
