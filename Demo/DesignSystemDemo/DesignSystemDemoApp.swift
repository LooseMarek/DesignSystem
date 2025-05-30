//
//  DesignSystemDemoApp.swift
//  DesignSystemDemo
//
//  Created by Marek Loose on 03/05/2025.
//

import SwiftUI
import DesignSystem

@main
struct DesignSystemDemoApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .preferredColorScheme(.dark)
        }
    }
}
