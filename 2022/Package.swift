// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode",
    products: [
        .library(name: "Utils", targets: ["Utils"]),
        .executable(name: "Day1", targets: ["Day1"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.0.3"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
    ],
    targets: [
        .target(name: "Utils"),
        .executableTarget(
            name: "Day1",
            dependencies: [
                "Utils",
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ],
            swiftSettings: [.unsafeFlags(["-O"])]
        )
    ]
)
