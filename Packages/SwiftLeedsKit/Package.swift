// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(

    name: "SwiftLeedsKit",

    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .watchOS(.v10),
        .tvOS(.v17)
    ],

    products: [
        .library(name: "SwiftLeedsKit", targets: ["SwiftLeedsKit"])
    ],

    targets: [
        .target(
            name: "SwiftLeedsKit",
            dependencies: [
                "SwiftLeedsDomain",
                "SwiftLeedsData",
                "Networking"
            ]
        ),
        .testTarget(name: "SwiftLeedsKitTests", dependencies: ["SwiftLeedsKit"]),

        .target(name: "SwiftLeedsDomain"),
        .testTarget(
            name: "SwiftLeedsDomainTests",
            dependencies: ["SwiftLeedsDomain"]
        ),

        .target(name: "SwiftLeedsData"),
        .testTarget(
            name: "SwiftLeedsDataTests",
            dependencies: ["SwiftLeedsData"],
            resources: [
                .process("Resources")
            ]
        ),

        .target(name: "Networking"),
        .testTarget(name: "NetworkingTests", dependencies: ["Networking"])
    ]

)
