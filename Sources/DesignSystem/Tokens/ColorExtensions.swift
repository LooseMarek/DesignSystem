import SwiftUI

public class DSColorOverrides {
    nonisolated(unsafe) public static var dsBackground: Color = Color(hex: "1C1E2D")!
    nonisolated(unsafe) public static var dsSurface: Color = Color(hex: "252736")!
    nonisolated(unsafe) public static var dsPrimary: Color = Color(hex: "20E1DC")!
    nonisolated(unsafe) public static var dsAccent: Color = Color(hex: "FF7B5C")!
    nonisolated(unsafe) public static var dsText: Color = Color.white
    nonisolated(unsafe) public static var dsTextSecondary: Color = Color(hex: "8F90A6")!
    nonisolated(unsafe) public static var dsBorder: Color = Color(hex: "2F3142")!
    nonisolated(unsafe) public static var dsError: Color = Color(hex: "FF4D4D")!
}

public extension Color {
    static var dsBackground: Color { DSColorOverrides.dsBackground }
    static var dsSurface: Color { DSColorOverrides.dsSurface }
    static var dsPrimary: Color { DSColorOverrides.dsPrimary }
    static var dsAccent: Color { DSColorOverrides.dsAccent }
    static var dsText: Color { DSColorOverrides.dsText }
    static var dsTextSecondary: Color { DSColorOverrides.dsTextSecondary }
    static var dsBorder: Color { DSColorOverrides.dsBorder }
    static var dsError: Color { DSColorOverrides.dsError }
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
