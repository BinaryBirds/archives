// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "mail",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "Mail", targets: ["Mail"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.50.0"),
        .package(url: "https://github.com/binarybirds/mail-kit.git", from: "0.0.1"),
    ],
    targets: [
        .target(name: "Mail", dependencies: [
             .product(name: "Vapor", package: "vapor"),
             .product(name: "MailKit", package: "mail-kit"),
        ]),
        .testTarget(name: "MailTests", dependencies: ["Mail"]),
    ]
)
