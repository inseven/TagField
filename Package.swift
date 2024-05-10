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
        .package(url: "https://github.com/inseven/licensable", from: "0.0.13"),
        .package(url: "https://github.com/saramah/HashRainbow", branch: "main"),
    ],
    targets: [
        .target(
            name: "TagField",
            dependencies: [
                .product(name: "HashRainbow", package: "HashRainbow"),
                .product(name: "Licensable", package: "licensable"),
            ],
            resources: [
                .process("Resources"),
            ]),
        .testTarget(
            name: "TagFieldTests",
            dependencies: ["TagField"]),
    ]
)
