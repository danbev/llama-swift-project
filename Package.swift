// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyLlamaPackage",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(path: "/Users/danbev/work/llama.cpp")
    ],
    targets: [
        .executableTarget(
            name: "MyLlamaPackage",
            dependencies: [
            .product(name: "llama", package: "llama.cpp")
            ])
    ]
)
