import SwiftUI

public struct DSForm<Content: View>: View {
    let viewModel: ViewModel
    
    public init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Form {
            viewModel.content
        }
        .scrollContentBackground(.hidden)
        .background(Color.dsBackground)
    }
}

// MARK: - Preview
struct DSForm_Previews: PreviewProvider {
    static var previews: some View {
        DSForm(
            .init {
                VStack(spacing: .dsSpacingMd) {
                    DSTextField(
                        .init(
                            title: "Email",
                            text: .constant(""),
                            placeholder: "Enter your email",
                            keyboardType: .emailAddress,
                            textContentType: .emailAddress,
                            isRequired: true
                        )
                    )
                    DSTextField(
                        .init(
                            title: "Password",
                            text: .constant(""),
                            placeholder: "Enter your password",
                            textContentType: .password,
                            isSecure: true
                        )
                    )
                    DSToggle(
                        .init(
                            title: "Remember me",
                            isOn: .constant(true),
                            variant: .primary
                        )
                    )
                }
            }
        )
    }
}
