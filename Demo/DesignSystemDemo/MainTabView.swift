//
//  MainTabView.swift
//  DesignSystemDemo
//
//  Created by Marek Loose on 04/05/2025.
//

import SwiftUI
import DesignSystem

struct MainTabView: View {
    var body: some View {
        DSTab(
            .init {
                DSTabItem(
                    labelText: "Components",
                    labelIcon: "square.grid.2x2"
                ) {
                    ComponentsView()
                }
                DSTabItem(
                    labelText: "Tokens",
                    labelIcon: "paintpalette"
                ) {
                    TokensView()
                }
                DSTabItem(
                    labelText: "Settings",
                    labelIcon: "gear"
                ) {
                    SettingsView()
                }
            }
        )
    }
}
