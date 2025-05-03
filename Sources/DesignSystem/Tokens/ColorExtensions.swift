import SwiftUI

public extension Color {
    static let dsBackground = Color(hex: "1C1E2D")!
    static let dsSurface = Color(hex: "252736")!
    static let dsPrimary = Color(hex: "20E1DC")!
    static let dsAccent = Color(hex: "FF7B5C")!
    static let dsText = Color.white
    static let dsTextSecondary = Color(hex: "8F90A6")!
    static let dsBorder = Color(hex: "2F3142")!
    static let dsError = Color(hex: "FF4D4D")!
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
