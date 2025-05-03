import SwiftUI

extension DSToggle {
    public struct ViewModel {
        public let title: String
        @Binding public var isOn: Bool
        public let variant: Variant
        
        public init(
            title: String,
            isOn: Binding<Bool>,
            variant: Variant
        ) {
            self.title = title
            self._isOn = isOn
            self.variant = variant
        }
    }
}
