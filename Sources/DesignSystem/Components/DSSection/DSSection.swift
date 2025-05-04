import SwiftUI

public struct DSSection<Content: View>: View {
    let viewModel: ViewModel
    
    public init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Section {
            DSCard(
                .init {
                    viewModel.content
                        .frame(maxWidth: .infinity)
                }
            )
        } header: {
            HStack(spacing: .zero) {
                DSText(
                    .init(
                        text: viewModel.headerText.localizedCapitalized,
                        font: .dsHeadline,
                        color: .dsText,
                        alignment: .leading,
                        lineLimit: nil
                    )
                )
                .textCase(nil)
                Spacer()
            }
        }
        .listRowBackground(Color.dsSurface)
        .listRowInsets(EdgeInsets(
            top: .dsSpacingSm,
            leading: .dsSpacingMd,
            bottom: .dsSpacingSm,
            trailing: .dsSpacingMd
        ))
        .listRowSeparator(.hidden)
    }
}

// MARK: - Preview
struct DSSection_Previews: PreviewProvider {
    static var previews: some View {
        DSScrollView(.init {
            DSSection(
                .init(
                    headerText: "Section 1"
                ) {
                    HStack(spacing: .zero) {
                        DSText(
                            .init(
                                text: "Content for section 1",
                                font: .dsBody,
                                color: .dsText,
                                alignment: .leading,
                                lineLimit: nil
                            )
                        )
                        Spacer()
                    }
                }
            )
            DSSection(
                .init(
                    headerText: "Section 2"
                ) {
                    VStack(spacing: .dsSpacingMd) {
                        DSText(
                            .init(
                                text: "Multiple items in section 2",
                                font: .dsBody,
                                color: .dsText,
                                alignment: .leading,
                                lineLimit: nil
                            )
                        )
                        DSToggle(
                            .init(
                                title: "Toggle in section",
                                isOn: .constant(true),
                                variant: .primary
                            )
                        )
                    }
                }
            )
        })
    }
}
