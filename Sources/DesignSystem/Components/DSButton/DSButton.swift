import SwiftUI

// MARK: - DSButton
public struct DSButton: View {
    let viewModel: ViewModel
    
    public init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Button(action: viewModel.action) {
            HStack(spacing: .dsSpacingXs) {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(
                            CircularProgressViewStyle(
                                tint: viewModel.variant.foregroundColor
                            )
                        )
                } else {
                    if let image = viewModel.image {
                        DSImage(image)
                    }
                    if let text = viewModel.title {
                        DSText(
                            .init(
                                text: text,
                                font: viewModel.size.font,
                                color: viewModel.variant.foregroundColor
                            )
                        )
                    }
                }
            }
            .if(viewModel.variant == .fab) { view in
                view
                    .frame(
                        width: viewModel.size.fabSize,
                        height: viewModel.size.fabSize
                    )
                    .dsShadow(.large)
            }
            .if(viewModel.variant != .fab) { view in
                view
                    .frame(minWidth: viewModel.minWidth)
                    .frame(maxWidth: viewModel.maxWidth)
                    .padding(.vertical, viewModel.size.verticalPadding)
                    .padding(.horizontal, viewModel.size.horizontalPadding)
            }
            .foregroundColor(viewModel.variant.foregroundColor)
            .background(viewModel.variant.backgroundColor)
            .cornerRadius(viewModel.variant == .fab ? .dsCornerRadiusCircle : .dsCornerRadiusMd)
            .opacity(viewModel.isEnabled ? 1 : 0.5)
            .dsShadow(viewModel.variant == .fab ? .large : .small)

        }
        .disabled(!viewModel.isEnabled || viewModel.isLoading)
    }
}

// MARK: - Preview
struct DSButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: .dsSpacingMd) {
            DSButton(.init(
                title: "Primary Button",
                action: {},
                variant: .primary,
                size: .large,
                maxWidth: .infinity
            ))
            
            DSButton(
                .init(
                    title: "Primary Button",
                    action: {},
                    variant: .primary,
                    size: .large,
                    isEnabled: true,
                    isLoading: false,
                    image: .init(
                        image: Image(systemName: "plus"),
                        size: .small,
                        contentMode: .fit
                    )
                )
            )
            
            DSButton(.init(
                title: "Secondary Button",
                action: {},
                variant: .secondary,
                size: .medium
            ))
            
            DSButton(.init(
                title: "Tertiary Button",
                action: {},
                variant: .tertiary,
                size: .small
            ))
            
            DSButton(.init(
                title: "Loading Button",
                action: {},
                variant: .primary,
                size: .large,
                minWidth: 100,
                isLoading: true
            ))
            
            DSButton(.init(
                title: "Disabled Button",
                action: {},
                variant: .primary,
                size: .large,
                isEnabled: false
            ))
            
            DSButton(.init(
                title: "Destructive Button",
                action: {},
                variant: .destructive,
                size: .large
            ))
            HStack {
                DSButton(
                    .init(
                        action: {},
                        variant: .primary,
                        size: .small,
                        isEnabled: true,
                        isLoading: true,
                        image: .init(
                            image: Image(systemName: "plus"),
                            size: .small,
                            contentMode: .fit
                        )
                    )
                )
                DSButton(
                    .init(
                        action: {},
                        variant: .secondary,
                        size: .small,
                        isEnabled: true,
                        isLoading: true,
                        image: .init(
                            image: Image(systemName: "plus"),
                            size: .small,
                            contentMode: .fit
                        )
                    )
                )
                DSButton(
                    .init(
                        action: {},
                        variant: .tertiary,
                        size: .small,
                        isEnabled: true,
                        isLoading: true,
                        image: .init(
                            image: Image(systemName: "plus"),
                            size: .small,
                            contentMode: .fit
                        )
                    )
                )
            }
            HStack {
                DSButton(
                    .init(
                        action: {},
                        variant: .primary,
                        size: .small,
                        isEnabled: true,
                        isLoading: false,
                        image: .init(
                            image: Image(systemName: "plus"),
                            size: .small,
                            contentMode: .fit
                        )
                    )
                )
                DSButton(
                    .init(
                        action: {},
                        variant: .secondary,
                        size: .small,
                        isEnabled: true,
                        isLoading: false,
                        image: .init(
                            image: Image(systemName: "plus"),
                            size: .small,
                            contentMode: .fit
                        )
                    )
                )
                DSButton(
                    .init(
                        action: {},
                        variant: .tertiary,
                        size: .small,
                        isEnabled: true,
                        isLoading: false,
                        image: .init(
                            image: Image(systemName: "plus"),
                            size: .small,
                            contentMode: .fit
                        )
                    )
                )
            }
            HStack {
                DSButton(
                    .init(
                        action: {},
                        variant: .fab,
                        size: .small,
                        isEnabled: true,
                        isLoading: true,
                        image: .init(
                            image: Image(systemName: "plus"),
                            size: .small,
                            contentMode: .fit
                        )
                    )
                )
                DSButton(
                    .init(
                        action: {},
                        variant: .fab,
                        size: .medium,
                        isEnabled: true,
                        isLoading: true,
                        image: .init(
                            image: Image(systemName: "plus"),
                            size: .small,
                            contentMode: .fit
                        )
                    )
                )
                DSButton(
                    .init(
                        action: {},
                        variant: .fab,
                        size: .large,
                        isEnabled: true,
                        isLoading: true,
                        image: .init(
                            image: Image(systemName: "plus"),
                            size: .small,
                            contentMode: .fit
                        )
                    )
                )
                DSButton(
                    .init(
                        action: {},
                        variant: .fab,
                        size: .small,
                        isEnabled: true,
                        isLoading: false,
                        image: .init(
                            image: Image(systemName: "plus"),
                            size: .custom(
                                .init(
                                    width: 16,
                                    height: 16
                                )
                            ),
                            contentMode: .fit
                        )
                    )
                )
                DSButton(
                    .init(
                        action: {},
                        variant: .fab,
                        size: .medium,
                        isEnabled: true,
                        isLoading: false,
                        image: .init(
                            image: Image(systemName: "plus"),
                            size: .custom(
                                .init(
                                    width: 20,
                                    height: 20
                                )
                            ),
                            contentMode: .fit
                        )
                    )
                )
                DSButton(
                    .init(
                        action: {},
                        variant: .fab,
                        size: .large,
                        isEnabled: true,
                        isLoading: false,
                        image: .init(
                            image: Image(systemName: "plus"),
                            size: .small,
                            contentMode: .fit
                        )
                    )
                )
            }
        }
        .padding()
        .background(Color.dsBackground)
    }
}
