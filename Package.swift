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
            url: "https://github.com/Conviva/conviva-ios-replay/raw/0.0.1/Framework/ConvivaReplay.xcframework.zip",
            checksum: "490ea450a9c9eee6f64de57bc12cf8dc034286e8d9ecca3627e3d4954a9b753a"),
    ]
)
