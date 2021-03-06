// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyLocalReceiptValidator",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftyLocalReceiptValidator",
            targets: ["SwiftyLocalReceiptValidator"])
    ],
    dependencies: [
        .package(name: "OpenSSL", url: "https://github.com/codinn/OpenSSL.git", .branch("master")),
        .package(name: "openssl-apple", url: "https://github.com/codinn/openssl-apple.git", .branch("master")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "pkcs7_union_accessors",
            dependencies: ["openssl-apple"],
            path: "Sources/pkcs7_union_accessors",
            publicHeadersPath: "./"),
        .target(
            name: "SwiftyLocalReceiptValidator",
            dependencies: ["pkcs7_union_accessors", "OpenSSL", "openssl-apple"],
            path: "Sources/SwiftyLocalReceiptValidator")
    ]
)
