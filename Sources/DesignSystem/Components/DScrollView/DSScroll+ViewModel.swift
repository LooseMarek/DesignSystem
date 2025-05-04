import SwiftUI

extension DSScroll {
    public struct ViewModel {
        let content: Content
        
        public init(@ViewBuilder _ content: () -> Content) {
            self.content = content()
        }
    }
}
