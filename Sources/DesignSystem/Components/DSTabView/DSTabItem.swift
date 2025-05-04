import SwiftUI

public struct DSTabItem<ItemContent: View>: View {
    let labelText: String
    let labelIcon: String
    let content: ItemContent
    
    public init(
        labelText: String,
        labelIcon: String,
        @ViewBuilder _ content: () -> ItemContent
    ) {
        self.labelText = labelText
        self.labelIcon = labelIcon
        self.content = content()
    }
    
    public var body: some View {
        content
            .tabItem {
                VStack {
                    Image(systemName: labelIcon)
                    Text(labelText)
                }
            }
    }
}
