// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdaEmbedFramework",
    defaultLocalization: "en",
    platforms: [
      .iOS(.v10),
    ],
    products: [
        .library(
            name: "AdaEmbedFramework",
            type: .dynamic,
            targets: ["AdaEmbedFramework"]
        ),
    ],
    targets: [
        .target(
            name: "AdaEmbedFramework",
            dependencies: [],
            path: "EmbedFramework",
            exclude: [
              "Info.plist",
              "en.lproj/EmbedFrameworkView.xib",
              "AdaEmbed.html",
              "EmbedTest.html",
              "EmbedView.xib",
              "OfflineView.xib",
              "View.xib",
            ],
            resources: [
              .process("Assets.xcassets"),
              .process("AdaWebHostViewController.storyboard")
            ]
        ),
    ]
)

