// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyLlamaPackage",
    targets: [
        .executableTarget(
            name: "MyLlamaPackage",
            dependencies: [
                "LlamaFramework"
            ]),
        .binaryTarget(
            name: "LlamaFramework",
            url: "https://github.com/ggml-org/llama.cpp/releases/download/b4826/llama-b1-xcframework.zip",
            checksum: "08d9ff244b8c16d46e2947c683d32b758014e5fb8ac13bf4a637983b28ecb28f"
        )
    ]
)
