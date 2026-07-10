import SnapshotTesting
import SwiftUI
import XCTest
@testable import DesignSystem

@MainActor
final class DesignSystemSnapshotTests: XCTestCase {

    // MARK: - Light mode

    func testDefaultState() {
        snapshot(ExampleView())
    }

    func testAlternateState() {
        snapshot(ExampleView(isActive: true))
    }

    // MARK: - Dark mode

    func testDefaultState_dark() {
        snapshot(ExampleView(), colorScheme: .dark)
    }

    func testAlternateState_dark() {
        snapshot(ExampleView(isActive: true), colorScheme: .dark)
    }

    // MARK: - Snapshot helper

    private func snapshot(
        _ view: some View,
        colorScheme: ColorScheme = .light,
        function: String = #function
    ) {
        let wrappedView = view.preferredColorScheme(colorScheme)

#if canImport(AppKit)
        let hosting = NSHostingView(rootView: wrappedView.frame(width: 200))
        hosting.appearance = NSAppearance(named: colorScheme == .dark ? .darkAqua : .aqua)
        hosting.frame = NSRect(x: 0, y: 0, width: 200, height: 80)
        assertSnapshot(of: hosting, as: .image, named: "macOS", testName: function)
#elseif canImport(UIKit)
        let controller = UIHostingController(rootView: wrappedView)
        controller.overrideUserInterfaceStyle = colorScheme == .dark ? .dark : .light
        controller.view.frame = CGRect(x: 0, y: 0, width: 200, height: 80)
        assertSnapshot(of: controller.view, as: .image, named: "iOS", testName: function)
#endif
    }
}

private struct ExampleView: View {
    var isActive: Bool = false

    var body: some View {
        Rectangle()
            .fill(isActive ? Color.green : Color.blue)
            .frame(width: 200, height: 80)
    }
}
