// swift-tools-version: 5.1
import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]),
    ],
    targets: [
        .target(
            name: "DesignSystem"),
    ]
)
