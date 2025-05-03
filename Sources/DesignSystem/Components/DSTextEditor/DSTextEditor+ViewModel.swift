import SwiftUI

extension DSTextEditor {
    public struct ViewModel {
        let text: Binding<String>
        let placeholder: String
        let height: CGFloat
        let backgroundColor: Color
        let cornerRadius: CGFloat
        
        public init(
            text: Binding<String>,
            placeholder: String = "",
            height: CGFloat = 100,
            backgroundColor: Color = .dsSurface,
            cornerRadius: CGFloat = .dsCornerRadiusMd
        ) {
            self.text = text
            self.placeholder = placeholder
            self.height = height
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
        }
    }
}
