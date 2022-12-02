// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let days = 1...2

let package = Package(
    name: "AdventOfCode",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [.library(name: "Utils", targets: ["Utils"])] + dayExecutables(days: days),
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.0.3"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
        .package(url: "https://github.com/pointfreeco/swift-parsing", from: "0.7.0"),
    ],
    targets: [
        .target(name: "Utils"),
        .testTarget(
            name: "AdventOfCodeTests",
            dependencies: ["Utils"] + dayDependencies(days: days)
        ),
    ] + dayTargets(days: days)
)

func dayDependencies(days: ClosedRange<Int>) -> [PackageDescription.Target.Dependency] {
    days.map { .byName(name: "Day\($0)") }
}

func dayExecutables(days: ClosedRange<Int>) -> [PackageDescription.Product] {
    days.map { dayNumber in
        .executable(name: "Day\(dayNumber)", targets: ["Day\(dayNumber)"])
    }
}

func dayTargets(days: ClosedRange<Int>) -> [PackageDescription.Target] {
    days.map { dayNumber in
        .executableTarget(
            name: "Day\(dayNumber)",
            dependencies: [
                "Utils",
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Collections", package: "swift-collections"),
                .product(name: "Parsing", package: "swift-parsing"),
            ]
        )
    }
}
