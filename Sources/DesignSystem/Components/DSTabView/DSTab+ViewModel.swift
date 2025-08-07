import SwiftUI

@available(iOS 15.0, *)
extension DSTab {
    public struct ViewModel {
        let content: Content

        public init(
            @ViewBuilder _ content: () -> Content
        ) {
            self.content = content()
        }
    }
}
