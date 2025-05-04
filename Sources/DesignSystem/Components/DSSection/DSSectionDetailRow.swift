import SwiftUI

public struct DSSectionDetailRow: View {
    let title: String
    let value: String
    
    public init(
        title: String,
        value: String
    ) {
        self.title = title
        self.value = value
    }
    
    public var body: some View {
        HStack {
            DSText(
                .init(
                    text: title,
                    font: .dsSubheadline,
                    color: .dsTextSecondary,
                    alignment: .leading,
                    lineLimit: nil
                )
            )
            Spacer()
            DSText(
                .init(
                    text: value,
                    font: .dsBody,
                    color: .dsText,
                    alignment: .trailing,
                    lineLimit: nil
                )
            )
        }
    }
}
