import SwiftUI

public struct DSScroll<Content: View>: View {
    
    let viewModel: ViewModel
    
    public init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ScrollView {
            VStack(spacing: .dsSpacingMd) {
                viewModel.content
            }
            .padding(.dsSpacingMd)
        }
        .frame(maxWidth: .infinity)
        .background(Color.dsBackground)
    }
}

// MARK: - Preview
struct DSScroll_Previews: PreviewProvider {
    static var previews: some View {
        DSScroll(
            .init {
                VStack(spacing: .dsSpacingMd) {
                    DSText(
                        .init(
                            text: "Scrollable Content",
                            font: .dsHeadline,
                            color: .dsText,
                            alignment: .leading,
                            lineLimit: nil
                        )
                    )
                    
                    ForEach(0..<10) { index in
                        DSCard(
                            .init {
                                DSText(
                                    .init(
                                        text: "Card \(index + 1)",
                                        font: .dsBody,
                                        color: .dsText,
                                        alignment: .leading,
                                        lineLimit: nil
                                    )
                                )
                            }
                        )
                    }
                }
            }
        )
        .background(Color.dsBackground)
    }
}
