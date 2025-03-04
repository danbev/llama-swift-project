// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyLlamaPackage",
    platforms: [
        .macOS("13.3")
    ],
    targets: [
        .executableTarget(
            name: "MyLlamaPackage",
            dependencies: [
                "LlamaFramework"
            ]),
        .binaryTarget(
            name: "LlamaFramework",
            // Local testing
            //path: "../../llama.cpp/llama-xcframework.zip"
            path: "../../llama.cpp/build-apple/llama.xcframework"

            // GitHub release testing
            /*
            url: "https://github.com/ggml-org/llama.cpp/releases/download/bxxxx/llama-bxxxx-xcframework.zip",
            // Check sum can be genenerated using:
            // swift package compute-checksum llama-xcframework.zip
            checksum: "<checksum>"
            */
        )
        

    ]
)
