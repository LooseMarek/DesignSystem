import SwiftUI

public struct DSTab<Content: View>: View {
    let viewModel: ViewModel
    
    public init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
        UITabBar.appearance().backgroundColor = UIColor(Color.dsSurface)
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.dsTextSecondary)
    }
    
    public var body: some View {
        TabView {
            viewModel.content
        }
        .tint(.dsPrimary)
    }
}

// MARK: - Preview
struct DSTab_Previews: PreviewProvider {
    static var previews: some View {
        DSTab(
            .init {
                DSTabItem(
                    labelText: "Components",
                    labelIcon: "square.grid.2x2"
                ) {
                    Text("Components")
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                        .background(Color.dsBackground)
                }
                DSTabItem(
                    labelText: "Tokens",
                    labelIcon: "paintpalette"
                ) {
                    Text("Tokens")
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                        .background(Color.dsBackground)
                }
            }
        )
    }
}
