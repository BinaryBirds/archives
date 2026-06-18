// swift-tools-version:5.9
import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "swift-openapi-example",
    platforms: [
        .macOS(.v12),
    ],
    products: [
//        .library(name: "MyProjectMacros", targets: ["MyProjectMacros"]),
        .library(name: "MyProjectKit", targets: ["MyProjectKit"]),
        .library(name: "MyProjectClientKit", targets: ["MyProjectClientKit"]),
        .library(name: "MyProjectServerKit", targets: ["MyProjectServerKit"]),
        .library(name: "MyProjectAsyncHTTPClient", targets: ["MyProjectAsyncHTTPClient"]),
        .library(name: "MyProjectURLSessionClient", targets: ["MyProjectURLSessionClient"]),
        .executable(name: "MyProjectOpenAPIGenerator", targets: ["MyProjectOpenAPIGenerator"]),
        .executable(name: "MyProjectHummingbirdServer", targets: ["MyProjectHummingbirdServer"]),
        .executable(name: "MyProjectVaporServer", targets: ["MyProjectVaporServer"]),
        
    ],
    dependencies: [
//        .package(url: "https://github.com/apple/swift-syntax", branch: "main"),
//        .package(url: "https://github.com/apple/swift-syntax", from: "509.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-log", from: "1.5.0"),
        .package(url: "https://github.com/apple/swift-nio", from: "2.59.0"),
        .package(url: "https://github.com/apple/swift-openapi-generator", .upToNextMinor(from: "0.3.0")),
        .package(url: "https://github.com/apple/swift-openapi-runtime", .upToNextMinor(from: "0.3.0")),
        .package(url: "https://github.com/apple/swift-openapi-urlsession", .upToNextMinor(from: "0.3.0")),
        .package(url: "https://github.com/swift-server/swift-openapi-async-http-client", .upToNextMinor(from: "0.3.0")),
        .package(url: "https://github.com/swift-server/swift-openapi-hummingbird", .upToNextMinor(from: "0.3.0")),
        .package(url: "https://github.com/swift-server/swift-openapi-vapor", .upToNextMinor(from: "0.3.0")),
        .package(url: "https://github.com/hummingbird-project/hummingbird", from: "1.9.0"),
        .package(url: "https://github.com/hummingbird-project/hummingbird-fluent", from: "1.1.0"),
        .package(url: "https://github.com/vapor/vapor", from: "4.84.0"),
        .package(url: "https://github.com/vapor/fluent", from: "4.8.0"),
        .package(url: "https://github.com/vapor/fluent-kit", from: "1.45.0"),
        .package(url: "https://github.com/vapor/fluent-sqlite-driver", from: "4.5.0"),
        .package(url: "https://github.com/mattpolzin/OpenAPIKit", from: "3.0.0-rc.2"),
        .package(url: "https://github.com/jpsim/Yams", from: "5.0.0"),
        .package(url: "https://github.com/binarybirds/vapor-spec", from: "2.0.0"),
        .package(url: "https://github.com/feathercms/hummingbird-spec", from: "1.0.0"),
//        .package(url: "https://github.com/feathercms/hummingbird-db", branch: "main"),
//        .package(url: "https://github.com/feathercms/feather-database", branch: "main"),

    ],
    targets: [
        // MARK: - macros
//        .macro(
//            name: "MyProjectMacrosPlugin",
//            dependencies: [
//                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
//                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
//                .product(name: "SwiftSyntax", package: "swift-syntax"),
//                .product(name: "SwiftOperators", package: "swift-syntax"),
//                .product(name: "SwiftParser", package: "swift-syntax"),
//                .product(name: "SwiftParserDiagnostics", package: "swift-syntax"),
//            ]
//        ),
        // MARK: - executables
        .executableTarget(
            name: "MyProjectOpenAPIGenerator",
            dependencies: [
                .product(name: "OpenAPIKit30", package: "OpenAPIKit"),
                .product(name: "Yams", package: "Yams"),
            ]
        ),
        .executableTarget(
            name: "MyProjectHummingbirdServer",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Hummingbird", package: "hummingbird"),
                .product(name: "HummingbirdFluent", package: "hummingbird-fluent"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "OpenAPIHummingbird", package: "swift-openapi-hummingbird"),
//                .target(name: "MyProjectMacros"),
                .target(name: "MyProjectServerKit"),
            ],
            swiftSettings: [
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release)),
            ]
        ),
        .executableTarget(
            name: "MyProjectVaporServer",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "OpenAPIVapor", package: "swift-openapi-vapor"),
                .target(name: "MyProjectServerKit"),
            ],
            swiftSettings: [
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release)),
            ]
        ),
        // MARK: - libraries
//        .target(
//            name: "MyProjectMacros",
//            dependencies: [
//                "MyProjectMacrosPlugin"
//            ]
//        ),
        .target(
            name: "MyProjectKit",
            dependencies: [
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "Logging", package: "swift-log"),
                .product(name: "FluentKit", package: "fluent-kit"),
//                .target(name: "MyProjectMacros"),
            ]
        ),
        .target(
            name: "MyProjectClientKit",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .target(name: "MyProjectKit"),
            ],
            plugins: [
                .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator")
            ]
        ),
        .target(
            name: "MyProjectServerKit",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .target(name: "MyProjectKit"),
            ],
            plugins: [
                .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator")
            ]
        ),
        .target(
            name: "MyProjectAsyncHTTPClient",
            dependencies: [
                .product(name: "OpenAPIAsyncHTTPClient", package: "swift-openapi-async-http-client"),
                .target(name: "MyProjectClientKit"),
            ]
        ),
        .target(
            name: "MyProjectURLSessionClient",
            dependencies: [
                .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession"),
                .target(name: "MyProjectClientKit"),
            ]
        ),
        // MARK: - tests
//        .testTarget(
//            name: "MyProjectMacrosTests",
//            dependencies: [
//                "MyProjectMacrosPlugin"
//            ]
//        ),
        .testTarget(
            name: "MyProjectKitTests",
            dependencies: [
                .target(name: "MyProjectKit"),
            ]
        ),
        .testTarget(
            name: "MyProjectClientKitTests",
            dependencies: [
                .target(name: "MyProjectClientKit"),
            ]
        ),
        .testTarget(
            name: "MyProjectServerKitTests",
            dependencies: [
                .target(name: "MyProjectServerKit"),
            ]
        ),
        // MARK: - server tests
        .testTarget(
            name: "MyProjectHummingbirdServerTests",
            dependencies: [
                .product(name: "HummingbirdSpec", package: "hummingbird-spec"),
                .target(name: "MyProjectHummingbirdServer"),
            ]
        ),
        .testTarget(
            name: "MyProjectVaporServerTests",
            dependencies: [
                .product(name: "VaporSpec", package: "vapor-spec"),
                .target(name: "MyProjectVaporServer"),
            ]
        ),
        // MARK: - client tests
        .testTarget(
            name: "MyProjectAsyncHTTPClientTests",
            dependencies: [
                .target(name: "MyProjectAsyncHTTPClient"),
            ]
        ),
        .testTarget(
            name: "MyProjectURLSessionClientTests",
            dependencies: [
                .target(name: "MyProjectURLSessionClient"),
            ]
        ),
    ]
)
