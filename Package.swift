// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "CommonSwift",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "CommonSwift",
            targets: ["CommonSwift"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/attaswift/BigInt.git", exact: "5.0.0")
    ],
    targets: [
        .target(
            name: "CommonSwift",
            dependencies: [
                .byName(name: "BigInt")
            ]
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
