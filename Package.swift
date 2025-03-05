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
            url: "https://github.com/ggml-org/llama.cpp/releases/download/b4829/llama-b4829-xcframework.zip",
            checksum: "a65b66a60c21d1c551bec9bb374190f3725f8f6b5466292b46556a7e264e12f6"
        )
    ]
)
