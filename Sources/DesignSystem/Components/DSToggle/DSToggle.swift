import SwiftUI

// MARK: - DSToggle
public struct DSToggle: View {
    let viewModel: ViewModel
    
    public init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Toggle(isOn: viewModel.$isOn) {
            DSText(.init(
                text: viewModel.title,
                font: .dsBody,
                color: .dsText,
                alignment: .leading,
                lineLimit: nil
            ))
        }
        .toggleStyle(SwitchToggleStyle(tint: viewModel.variant.onColor))
        .padding(.dsSpacingMd)
        .background(Color.dsBackground)
        .cornerRadius(.dsCornerRadiusMd)
    }
}

// MARK: - Preview
struct DSToggle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: .dsSpacingMd) {
            DSToggle(.init(
                title: "Primary Toggle",
                isOn: .constant(true),
                variant: .primary
            ))
            
            DSToggle(.init(
                title: "Secondary Toggle",
                isOn: .constant(false),
                variant: .secondary
            ))
        }
        .padding()
        .background(Color.dsBackground)
    }
} 
