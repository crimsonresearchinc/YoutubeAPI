// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YoutubeAPI",
    defaultLocalization: "en",
    platforms: [.iOS(.v15), .tvOS(.v15), .macOS(.v12), .watchOS(.v8), .macCatalyst(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "YoutubeAPI", targets: ["YoutubeAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/wmalloc/YoutubeModel.git", branch: "main"),
        .package(url: "https://github.com/wmalloc/WebService.git", .upToNextMajor(from: "0.6.1")),
        .package(url: "https://github.com/lukepistrol/SwiftLintPlugin.git", .upToNextMajor(from: "0.2.2")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "YoutubeAPI", dependencies: ["YoutubeModel",
                                               .product(name: "WebService", package: "WebService"),
                                               .product(name: "WebServiceCombine", package: "WebService"),
                                               .product(name: "WebServiceConcurrency", package: "WebService")],
            plugins: [.plugin(name: "SwiftLint", package: "SwiftLintPlugin")]),
        .testTarget(
            name: "YoutubeAPITests", dependencies: ["YoutubeAPI"]),
    ]
)
