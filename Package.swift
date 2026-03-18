// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConvivaReplay",
    platforms: [
        .iOS(.v15)
    ],
 
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ConvivaReplay",
            targets: ["ConvivaReplay"])
    ],
   dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "ConvivaReplay",
            path: "Framework/ConvivaReplay.xcframework.zip")
    ]
)
