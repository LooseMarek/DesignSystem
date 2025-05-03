import SwiftUI

struct DSConfirmationAlertModifier: ViewModifier {
    var title: String
    var message: String
    var confirmButtonTitle: String
    @Binding var isPresented: Bool
    var confirmAction: () -> Void
    
    func body(content: Content) -> some View {
        content
            .alert(title, isPresented: $isPresented) {
                DSButton(
                    .init(
                        title: "Cancel",
                        action: { isPresented = false },
                        variant: .tertiary,
                        size: .medium,
                        isEnabled: true,
                        isLoading: false
                    )
                )
                DSButton(
                    .init(
                        title: confirmButtonTitle,
                        action: { confirmAction() },
                        variant: .tertiary,
                        size: .medium,
                        isEnabled: true,
                        isLoading: false
                    )
                )
            } message: {
                DSText(
                    .init(
                        text: message,
                        font: .dsBody,
                        color: .dsText,
                        alignment: .leading,
                        lineLimit: nil
                    )
                )
            }
    }
}

extension View {
    public func dsConfirmationAlert(
        title: String,
        message: String,
        confirmButtonTitle: String,
        isPresented: Binding<Bool>,
        confirmAction: @escaping () -> Void
    ) -> some View {
        modifier(DSConfirmationAlertModifier(
            title: title,
            message: message,
            confirmButtonTitle: confirmButtonTitle,
            isPresented: isPresented,
            confirmAction: confirmAction
        ))
    }
}
