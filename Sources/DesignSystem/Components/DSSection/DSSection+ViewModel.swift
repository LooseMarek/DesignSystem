import SwiftUI

@available(iOS 15.0, *)
extension DSSection {
    public struct ViewModel {
        let headerText: String
        let content: Content
        
        public init(
            headerText: String,
            @ViewBuilder _ content: () -> Content
        ) {
            self.headerText = headerText
            self.content = content()
        }
    }
}
