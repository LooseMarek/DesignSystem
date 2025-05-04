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
        TabView {
            ComponentsView()
                .tabItem {
                    Label("Components", systemImage: "square.grid.2x2")
                }
            
            TokensView()
                .tabItem {
                    Label("Tokens", systemImage: "paintpalette")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}
