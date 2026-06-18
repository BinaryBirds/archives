// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "core-kit",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .tvOS(.v14),
        .watchOS(.v8),
    ],
    products: [
        .library(name: "CoreKit", targets: ["CoreKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/binarybirds/apple-kit", branch: "main"),
    ],
    targets: [
        .target(name: "CoreKit", dependencies: [
            .product(name: "AppleKit", package: "apple-kit"),
        ]),
        .testTarget(name: "CoreKitTests", dependencies: [
            .target(name: "CoreKit")
        ]),
    ]
)
