import SwiftUI

public extension Color {
    static var dsBackground: Color {
        @Environment(\.colorPalette) var palette
        return palette.dsBackground
    }
    static var dsSurface: Color {
        @Environment(\.colorPalette) var palette
        return palette.dsSurface
    }
    static var dsPrimary: Color {
        @Environment(\.colorPalette) var palette
        return palette.dsPrimary
    }
    static var dsAccent: Color {
        @Environment(\.colorPalette) var palette
        return palette.dsAccent
    }
    static var dsText: Color {
        @Environment(\.colorPalette) var palette
        return palette.dsText
    }
    static var dsTextSecondary: Color {
        @Environment(\.colorPalette) var palette
        return palette.dsTextSecondary
    }
    static var dsBorder: Color {
        @Environment(\.colorPalette) var palette
        return palette.dsBorder
    }
    static var dsError: Color {
        @Environment(\.colorPalette) var palette
        return palette.dsError
    }
}

public extension Color {
    init?(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let r, g, b: Double
        switch hex.count {
        case 3: // RGB (12-bit)
            r = Double((int >> 8) & 0xF) / 15.0
            g = Double((int >> 4) & 0xF) / 15.0
            b = Double(int & 0xF) / 15.0
        case 6: // RGB (24-bit)
            r = Double((int >> 16) & 0xFF) / 255.0
            g = Double((int >> 8) & 0xFF) / 255.0
            b = Double(int & 0xFF) / 255.0
        default:
            return nil
        }
        
        self.init(red: r, green: g, blue: b)
    }
} 
