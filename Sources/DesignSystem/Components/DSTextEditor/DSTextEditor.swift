import SwiftUI

@available(iOS 16.0, *)
public struct DSTextEditor: View {
    let viewModel: ViewModel
    
    public init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            if viewModel.$text.wrappedValue.isEmpty {
                Text(viewModel.placeholder)
                    .foregroundColor(.dsTextSecondary)
                    .padding(.dsSpacingMd)
            }
            TextEditor(text: viewModel.$text)
                .foregroundColor(.dsText)
                .padding(.vertical, .dsSpacingXs)
                .padding(.horizontal, .dsSpacingSm)
                .scrollContentBackground(.hidden)
                
        }
        .frame(height: viewModel.height)
        .background(Color.dsSurface)
        .cornerRadius(.dsCornerRadiusMd)
        .overlay(
            RoundedRectangle(cornerRadius: .dsCornerRadiusMd)
                .stroke(Color.dsBorder, lineWidth: 1)
        )
    }
}

// MARK: - Preview

@available(iOS 16.0, *)
struct DSTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: .dsSpacingMd) {
            DSTextEditor(
                .init(
                    text: .constant(""),
                    placeholder: "Enter your text here..."
                )
            )
            DSTextEditor(
                .init(
                    text: .constant("Some text"),
                    placeholder: "Enter your text here...",
                    height: 150
                )
            )
        }
        .padding(.dsSpacingMd)
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color.dsBackground)
    }
}
