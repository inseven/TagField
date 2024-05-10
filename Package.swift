// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "TagField",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "TagField",
            targets: ["TagField"]),
    ],
    dependencies: [
        .package(url: "git@github.com:saramah/HashRainbow.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "TagField",
            dependencies: [
                .product(name: "HashRainbow", package: "HashRainbow"),
            ]),
        .testTarget(
            name: "TagFieldTests",
            dependencies: ["TagField"]),
    ]
)
