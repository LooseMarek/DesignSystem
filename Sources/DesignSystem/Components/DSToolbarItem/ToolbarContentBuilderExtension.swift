import SwiftUI

extension ToolbarContentBuilder {
    @MainActor
    @ToolbarContentBuilder
    public static func add(action: @escaping () -> Void) -> some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            DSButton(
                .init(
                    title: "",
                    action: action,
                    variant: .tertiary,
                    size: .small,
                    isEnabled: true,
                    isLoading: false,
                    image: .init(
                        image: Image(systemName: "plus"),
                        size: .small,
                        contentMode: .fit
                    )
                )
            )
        }
    }
    
    @MainActor
    @ToolbarContentBuilder
    public static func export(action: @escaping () -> Void) -> some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            DSButton(
                .init(
                    title: "",
                    action: action,
                    variant: .tertiary,
                    size: .small,
                    isEnabled: true,
                    isLoading: false,
                    image: .init(
                        image: Image(systemName: "square.and.arrow.up"),
                        size: .small,
                        contentMode: .fit
                    )
                )
            )
        }
    }
    
    @MainActor
    @ToolbarContentBuilder
    public static func delete(action: @escaping () -> Void) -> some ToolbarContent {
        ToolbarItem(placement: .destructiveAction) {
            DSButton(
                .init(
                    title: "",
                    action: action,
                    variant: .tertiary,
                    size: .small,
                    isEnabled: true,
                    isLoading: false,
                    image: .init(
                        image: Image(systemName: "trash"),
                        size: .small,
                        contentMode: .fit
                    )
                )
            )
        }
    }

    @MainActor
    @ToolbarContentBuilder
    public static func cancel(action: @escaping () -> Void) -> some ToolbarContent {
        ToolbarItem(placement: .cancellationAction) {
            DSButton(
                .init(
                    title: "Cancel",
                    action: action,
                    variant: .tertiary,
                    size: .medium,
                    isEnabled: true,
                    isLoading: false
                )
            )
        }
    }
    
    @MainActor
    @ToolbarContentBuilder
    public static func confirm(
        title: String,
        isEnabled: Bool,
        action: @escaping () -> Void
    ) -> some ToolbarContent {
        ToolbarItem(placement: .confirmationAction) {
            DSButton(
                .init(
                    title: title,
                    action: action,
                    variant: .tertiary,
                    size: .medium,
                    isEnabled: isEnabled,
                    isLoading: false
                )
            )
        }
    }
    
    @MainActor
    @ToolbarContentBuilder
    public static func primary(
        title: String,
        isEnabled: Bool,
        action: @escaping () -> Void
    ) -> some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            DSButton(
                .init(
                    title: title,
                    action: action,
                    variant: .tertiary,
                    size: .medium,
                    isEnabled: isEnabled,
                    isLoading: false
                )
            )
        }
    }
}

