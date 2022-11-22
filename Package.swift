// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Glorifier",
    platforms: [
        .macOS(.v12), .iOS(.v15),
    ],
    products: [
        .library(
            name: "Glorifier",
            targets: ["Glorifier"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Glorifier",
            dependencies: []),
    ])
