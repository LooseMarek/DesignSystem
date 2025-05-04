import SwiftUI

extension DSTextEditor {
    public struct ViewModel {
        @Binding var text: String
        let placeholder: String
        let height: CGFloat
        
        public init(
            text: Binding<String>,
            placeholder: String = "",
            height: CGFloat = 100
        ) {
            self._text = text
            self.placeholder = placeholder
            self.height = height
        }
    }
}
