import SwiftUI

public struct DSTextEditor: View {
    let viewModel: ViewModel
    
    public init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: viewModel.text)
                .frame(height: viewModel.height)
                .background(viewModel.backgroundColor)
                .cornerRadius(.dsCornerRadiusMd)
            
            if viewModel.text.wrappedValue.isEmpty {
                Text(viewModel.placeholder)
                    .foregroundColor(.dsTextSecondary)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 8)
            }
        }
    }
}

// MARK: - Preview
struct DSTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: .dsSpacingMd) {
            DSTextEditor(.init(
                text: .constant(""),
                placeholder: "Enter your text here...",
                height: 100,
                backgroundColor: .dsSurface,
                cornerRadius: .dsCornerRadiusMd
            ))
            
            DSTextEditor(.init(
                text: .constant("Some text"),
                placeholder: "Enter your text here...",
                height: 150,
                backgroundColor: .dsSurface,
                cornerRadius: .dsCornerRadiusMd
            ))
        }
        .padding()
        .background(Color.dsBackground)
    }
}
