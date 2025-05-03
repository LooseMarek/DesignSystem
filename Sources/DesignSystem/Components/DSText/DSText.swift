import SwiftUI

// MARK: - DSText
public struct DSText: View {
    let viewModel: ViewModel
    
    public init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Text(viewModel.text)
            .font(viewModel.font)
            .foregroundColor(viewModel.color ?? .dsText)
            .multilineTextAlignment(viewModel.alignment)
            .lineLimit(viewModel.lineLimit)
    }
}

// MARK: - Preview
struct DSText_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: .dsSpacingMd) {
            DSText(.init(
                text: "Large Title",
                font: .dsLargeTitle,
                color: nil,
                alignment: .leading,
                lineLimit: nil
            ))
            
            DSText(.init(
                text: "Headline",
                font: .dsHeadline,
                color: .dsAccent,
                alignment: .leading,
                lineLimit: nil
            ))
            
            DSText(.init(
                text: "Body text with a line limit of 2. This should be truncated after two lines.",
                font: .dsBody,
                color: nil,
                alignment: .leading,
                lineLimit: 2
            ))
        }
        .padding()
        .background(Color.dsBackground)
    }
} 
