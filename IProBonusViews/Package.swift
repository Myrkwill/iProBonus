// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IProBonusViews",
    platforms: [
        .macOS(.v11), .iOS(.v13)
    ],
    products: [
        .library(
            name: "IProBonusViews",
            targets: ["IProBonusViews"]
        ),
    ],
    targets: [
        .target(
            name: "IProBonusViews",
            dependencies: []
        )
    ]
)
