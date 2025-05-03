import SwiftUI

public struct DSCard<Content: View>: View {
    
    let viewModel: ViewModel
    
    public init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        viewModel.content
            .padding(.dsSpacingMd)
            .background(Color.dsSurface)
            .cornerRadius(.dsCornerRadiusLg)
            .dsShadow(.small)
    }
}

// MARK: - Preview
struct DSCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: .dsSpacingMd) {
            DSCard(
                .init {
                    DSText(
                        .init(
                            text: "Simple Card",
                            font: .dsBody,
                            color: .dsText,
                            alignment: .leading,
                            lineLimit: nil
                        )
                    )
                }
            )
            DSCard(
                .init {
                    VStack(spacing: .dsSpacingMd) {
                        DSText(.init(
                            text: "Card with Multiple Elements",
                            font: .dsHeadline,
                            color: .dsText,
                            alignment: .leading,
                            lineLimit: nil
                        ))
                        
                        DSText(.init(
                            text: "This is a more complex card with multiple text elements.",
                            font: .dsBody,
                            color: .dsTextSecondary,
                            alignment: .leading,
                            lineLimit: nil
                        ))
                    }
                }
            )
        }
        .padding()
        .background(Color.dsBackground)
    }
}
