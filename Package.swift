// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing",
            from: "1.19.2"),
    ],
    targets: [
        .target(
            name: "DesignSystem"),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"]),
        .testTarget(
            name: "DesignSystemSnapshotTests",
            dependencies: [
                "DesignSystem",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ],
            resources: [
                .process("__Snapshots__/"),
            ]),
    ]
)
