//
//  ContentView.swift
//  DesignSystemDemo
//
//  Created by Marek Loose on 03/05/2025.
//

import SwiftUI
import DesignSystem

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
