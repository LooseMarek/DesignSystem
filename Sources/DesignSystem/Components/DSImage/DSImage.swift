import SwiftUI

// MARK: - DSImage
public struct DSImage: View {
    let viewModel: ViewModel
    
    public init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        viewModel.image
            .resizable()
            .aspectRatio(contentMode: viewModel.contentMode)
            .frame(
                width: viewModel.size.value.width,
                height: viewModel.size.value.height
            )
            .background(viewModel.backgroundColor)
            .cornerRadius(viewModel.cornerRadius)
    }
}

// MARK: - Preview
struct DSImage_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: .dsSpacingMd) {
            DSImage(.init(
                image: Image(systemName: "airplane"),
                size: .small,
                contentMode: .fit,
                backgroundColor: .dsSurface,
                cornerRadius: .dsCornerRadiusMd
            ))
            
            DSImage(.init(
                image: Image(systemName: "airplane"),
                size: .medium,
                contentMode: .fit,
                backgroundColor: .dsSurface,
                cornerRadius: .dsCornerRadiusMd
            ))
            
            DSImage(.init(
                image: Image(systemName: "airplane"),
                size: .large,
                contentMode: .fit,
                backgroundColor: .dsSurface,
                cornerRadius: .dsCornerRadiusMd
            ))
            
            DSImage(.init(
                image: Image(systemName: "airplane"),
                size: .custom(CGSize(width: 200, height: 100)),
                contentMode: .fit,
                backgroundColor: .dsSurface,
                cornerRadius: .dsCornerRadiusMd
            ))
        }
        .padding()
        .background(Color.dsBackground)
    }
} 
