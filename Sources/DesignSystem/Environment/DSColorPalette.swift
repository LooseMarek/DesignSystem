import SwiftUI

public struct DSColorPalette: Sendable {
    public var dsBackground: Color
    public var dsSurface: Color
    public var dsPrimary: Color
    public var dsAccent: Color
    public var dsText: Color
    public var dsTextSecondary: Color
    public var dsBorder: Color
    public var dsError: Color

    public init(
        dsBackground: Color = Color(hex: "1C1E2D")!,
        dsSurface: Color = Color(hex: "252736")!,
        dsPrimary: Color = Color(hex: "20E1DC")!,
        dsAccent: Color = Color(hex: "FF7B5C")!,
        dsText: Color = Color.white,
        dsTextSecondary: Color = Color(hex: "8F90A6")!,
        dsBorder: Color = Color(hex: "2F3142")!,
        dsError: Color = Color(hex: "FF4D4D")!
    ) {
        self.dsBackground = dsBackground
        self.dsSurface = dsSurface
        self.dsPrimary = dsPrimary
        self.dsAccent = dsAccent
        self.dsText = dsText
        self.dsTextSecondary = dsTextSecondary
        self.dsBorder = dsBorder
        self.dsError = dsError
    }
}

private struct DSColorPaletteKey: EnvironmentKey {
    static let defaultValue: DSColorPalette = DSColorPalette()
}

extension EnvironmentValues {
    var colorPalette: DSColorPalette {
        get { self[DSColorPaletteKey.self] }
        set { self[DSColorPaletteKey.self] = newValue }
    }
}

public extension View {
    func colorPalette(_ palette: DSColorPalette) -> some View {
        environment(\.colorPalette, palette)
    }
}
