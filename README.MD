## Example Swift project
This repo contains an example Swift project that demonstrates how to use the
Swift Package Manager with llama.cpp. 

### Prerequisites
This requires that the local llama.cpp has a new Package.swift file in the root
of the project:
```swift
 // swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "llama",
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15),
        .tvOS(.v14),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "llama", targets: ["llama"])
    ],
    targets: [
        .binaryTarget(
            name: "llama",
            // The following can be used for local testing.
            path: "build-apple/llama.xcframework"
        )
    ]
)
```

### building
```console
$ swift build
Building for debugging...
[1/1] Write swift-version--58304C5D6DBC2206.txt
Build complete! (0.06s)
```

### Running
```console
$ swift run
Building for debugging...
[1/1] Write swift-version--58304C5D6DBC2206.txt
Build complete! (0.06s)
Testing llama integration
Llama context params initialized:
n_ctx: 512
n_threads: 4
start: 15817954819679
```
