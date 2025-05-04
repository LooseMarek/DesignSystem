import SwiftUI
import DesignSystem

struct TokensView: View {
    var body: some View {
        NavigationView {
            DSScroll(.init {
                DSSection(.init(
                    headerText: "Colors"
                ) {
                    ColorTokensDemo()
                })
                
                DSSection(.init(
                    headerText: "Typography"
                ) {
                    TypographyTokensDemo()
                })
                
                DSSection(.init(
                    headerText: "Spacing"
                ) {
                    SpacingTokensDemo()
                })
            })
            .dsNavigation(title: "Design Tokens")
        }
    }
}

struct ColorTokensDemo: View {
    let colorTokens: [(String, Color)] = [
        ("dsBackground", .dsBackground),
        ("dsSurface", .dsSurface),
        ("dsPrimary", .dsPrimary),
        ("dsAccent", .dsAccent),
        ("dsText", .dsText),
        ("dsTextSecondary", .dsTextSecondary),
        ("dsBorder", .dsBorder),
        ("dsError", .dsError)
    ]
    var body: some View {
        VStack(alignment: .leading, spacing: .dsSpacingSm) {
            ForEach(colorTokens, id: \.0) { name, color in
                HStack {
                    Text(name)
                        .foregroundColor(.dsText)
                    Spacer()
                    RoundedRectangle(cornerRadius: .dsCornerRadiusSm)
                        .fill(color)
                        .frame(width: 32, height: 32)
                        .overlay(RoundedRectangle(cornerRadius: .dsCornerRadiusSm).stroke(Color.dsBorder, lineWidth: 1))
                }
            }
        }
    }
}

struct TypographyTokensDemo: View {
    let fontTokens: [(String, Font)] = [
        ("dsLargeTitle", .dsLargeTitle),
        ("dsTitle", .dsTitle),
        ("dsTitle2", .dsTitle2),
        ("dsTitle3", .dsTitle3),
        ("dsHeadline", .dsHeadline),
        ("dsSubheadline", .dsSubheadline),
        ("dsBody", .dsBody),
        ("dsCallout", .dsCallout),
        ("dsCaption", .dsCaption),
        ("dsCaption2", .dsCaption2)
    ]
    var body: some View {
        HStack(spacing: .zero) {
            VStack(alignment: .leading, spacing: .dsSpacingSm) {
                ForEach(fontTokens, id: \.0) { name, font in
                    Text(name)
                        .font(font)
                        .foregroundColor(.dsText)
                }
            }
            Spacer()
        }
    }
}

struct SpacingTokensDemo: View {
    let spacingTokens: [(String, CGFloat)] = [
        ("dsSpacingXxs", .dsSpacingXxs),
        ("dsSpacingXs", .dsSpacingXs),
        ("dsSpacingSm", .dsSpacingSm),
        ("dsSpacingMd", .dsSpacingMd),
        ("dsSpacingLg", .dsSpacingLg),
        ("dsSpacingXl", .dsSpacingXl),
        ("dsSpacingXxl", .dsSpacingXxl)
    ]
    var body: some View {
        VStack(alignment: .leading, spacing: .dsSpacingSm) {
            ForEach(spacingTokens, id: \.0) { name, size in
                HStack {
                    Text(name)
                        .foregroundColor(.dsText)
                    Spacer()
                    VStack {
                        Text("\(Int(size))")
                            .padding(.dsSpacingXs)
                            .font(.dsCaption)
                            .foregroundColor(.dsTextSecondary)
                    }
                    .background(Color.dsBorder)
                    .cornerRadius(.dsCornerRadiusSm)
                }
            }
        }
    }
} 
