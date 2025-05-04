import SwiftUI

// MARK: - DSTextField
public struct DSTextField: View {
    let viewModel: ViewModel
    
    public init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: .dsSpacingXxs) {
            if !viewModel.title.isEmpty {
                Text(viewModel.title)
                    .font(.dsCaption)
                    .foregroundColor(.dsTextSecondary)
            }
            
            Group {
                ZStack(alignment: .topLeading) {
                    if viewModel.$text.wrappedValue.isEmpty {
                        Text(viewModel.placeholder)
                            .foregroundColor(.dsTextSecondary)
                    }
                    if viewModel.isSecure {
                        SecureField(
                            "",
                            text: viewModel.$text
                        )
                        .keyboardType(viewModel.keyboardType)
                        .textContentType(viewModel.textContentType)
                    } else {
                        TextField(
                            "",
                            text: viewModel.$text
                        )
                        .keyboardType(viewModel.keyboardType)
                        .textContentType(viewModel.textContentType)
                    }
                }
            }
            .textFieldStyle(PlainTextFieldStyle())
            .font(.dsBody)
            .padding(.dsSpacingMd)
            .background(Color.dsSurface)
            .foregroundColor(.dsText)
            .cornerRadius(.dsCornerRadiusMd)
            .overlay(
                RoundedRectangle(cornerRadius: .dsCornerRadiusMd)
                    .stroke(viewModel.isError ? Color.dsError : .dsBorder, lineWidth: 1)
            )
            
            if let errorMessage = viewModel.errorMessage, viewModel.isError {
                Text(errorMessage)
                    .font(.dsCaption)
                    .foregroundColor(.dsError)
            } else if viewModel.isRequired {
                Text("*This field is required")
                    .font(.dsCaption)
                    .foregroundColor(.dsTextSecondary)
            }
        }
    }
}

// MARK: - Preview
struct DSTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: .dsSpacingMd) {
            DSTextField(.init(
                title: "Email",
                text: .constant(""),
                placeholder: "Enter your email",
                keyboardType: .emailAddress,
                textContentType: .emailAddress,
                isRequired: true
            ))
            DSTextField(.init(
                title: "Password",
                text: .constant(""),
                placeholder: "Enter your password",
                textContentType: .password,
                isSecure: true,
                isError: true,
                errorMessage: "Password is required"
            ))
            DSTextField(.init(
                title: "Phone Number",
                text: .constant(""),
                placeholder: "Enter phone number",
                textContentType: .telephoneNumber
            ))
        }
        .padding(.dsSpacingMd)
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color.dsBackground)
    }
} 
