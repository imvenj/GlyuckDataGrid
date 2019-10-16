// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GlyuckDataGrid",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "GlyuckDataGrid",
            targets: ["GlyuckDataGrid"]),
    ],
    targets: [
        .target(
            name: "GlyuckDataGrid",
            path: "Source"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
