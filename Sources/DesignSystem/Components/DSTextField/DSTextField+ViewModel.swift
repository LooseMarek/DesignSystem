import SwiftUI

extension DSTextField {
    public struct ViewModel {
        public let title: String
        @Binding public var text: String
        public let placeholder: String
        public let keyboardType: UIKeyboardType
        public let textContentType: UITextContentType?
        public let isRequired: Bool
        public let isSecure: Bool
        public let isError: Bool
        public let errorMessage: String?
        
        public init(
            title: String,
            text: Binding<String>,
            placeholder: String,
            keyboardType: UIKeyboardType = .default,
            textContentType: UITextContentType? = nil,
            isRequired: Bool = false,
            isSecure: Bool = false,
            isError: Bool = false,
            errorMessage: String? = nil
        ) {
            self.title = title
            self._text = text
            self.placeholder = placeholder
            self.keyboardType = keyboardType
            self.textContentType = textContentType
            self.isRequired = isRequired
            self.isSecure = isSecure
            self.isError = isError
            self.errorMessage = errorMessage
        }
    }
}
