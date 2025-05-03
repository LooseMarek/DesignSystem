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
                if let image = viewModel.image {
                    DSImage(image)
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: viewModel.variant.foregroundColor))
                } else {
                    Text(viewModel.title)
                        .font(viewModel.size.font)
                        .fontWeight(.medium)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, viewModel.size.verticalPadding)
            .foregroundColor(viewModel.variant.foregroundColor)
            .background(viewModel.variant.backgroundColor)
            .cornerRadius(.dsCornerRadiusMd)
            .opacity(viewModel.isEnabled ? 1 : 0.5)
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
                size: .large
            ))
            
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
        }
        .padding()
        .background(Color.dsBackground)
    }
}
