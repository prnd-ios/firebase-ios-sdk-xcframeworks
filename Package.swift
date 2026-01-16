// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v15)],
  products: [
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAppCheck",
      targets: ["FirebaseAppCheckTarget"]
    ),
    .library(
      name: "FirebaseCrashlytics",
      targets: ["FirebaseCrashlyticsTarget"]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebasePerformance",
      targets: ["FirebasePerformanceTarget"]
    ),
    .library(
      name: "FirebaseRemoteConfig",
      targets: ["FirebaseRemoteConfigTarget"]
    )
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Firebase",
      publicHeadersPath: "./"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        .target(name: "_FBLPromises", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseAnalytics", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseCore", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseCoreInternal", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseInstallations", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleAdsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleAppMeasurement", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleAppMeasurementIdentitySupport", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleUtilities", condition: .when(platforms: [.iOS])),
        .target(name: "_nanopb", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppCheckCore", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseAppCheck", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseAppCheckInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseCoreExtension", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseCrashlytics", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseRemoteConfigInterop", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseSessions", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleDataTransport", condition: .when(platforms: [.iOS])),
        .target(name: "_Promises", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseCrashlytics",
      exclude: [
        "run",
        "upload-symbols"
      ]
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseMessaging", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleDataTransport", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseABTesting", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseCoreExtension", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseRemoteConfig", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseRemoteConfigInterop", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseSessions", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseSharedSwift", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleDataTransport", condition: .when(platforms: [.iOS])),
        .target(name: "_Promises", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseABTesting", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseRemoteConfig", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseRemoteConfigInterop", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseSharedSwift", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_AppCheckCore.xcframework.zip",
      checksum: "6bf5fd49f28dae73a25578a152cad768e82d974f34f4d7952d5052346830fc7d"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FBLPromises.xcframework.zip",
      checksum: "737326a1503e3651b94d0659f42a47d0d4dbd4b7cf86174f0021377e3ff92442"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseABTesting.xcframework.zip",
      checksum: "a4a7a8dcd63ee4a33ea49d3075153445ba95e86b4ed9c075ce077b36043101c4"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "9fa04c1cac46d7a2c4f0ddf526e5176478418f39322c08fe463cfe1a111dec78"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "1767b08007f1a2bd40fae639610f2c25ff2e3d8cc7bb842a76be2fccb28a049b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "5ff5116e94ba2712ccea2bc8bf25be341bda28cfd0da27d3443e2d923abfe2dd"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCore.xcframework.zip",
      checksum: "6475896d6fe6298dae75666395938dfd042d1209df6ae5e869187ec7bbb7e7a1"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "53ded981709e63dd09028988d37799886e57738089051f7cc61fd648f343f36c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "bdf19d24601bd337896adc0db7c85a4802542f99a46b9b43fa7ed4fc806f5699"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "8e3f8884075306c5585c88bf7b569f5d99efe4d0bfd98721354ac6e3d6196644"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseInstallations.xcframework.zip",
      checksum: "39bffa79ea1234519cadd499be43db15d7f1a8d49359155c0ac5aa20f520f947"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseMessaging.xcframework.zip",
      checksum: "aedcbc1eb72dee35ce2d91e9eba77e10b70976a02bac027ff18106fafd5dfde4"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebasePerformance.xcframework.zip",
      checksum: "07cb63312e1021e74d834255d76e44b60e2c5a4919c725724979f4e4cbaa97c4"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "198a838237006091f5ea14d51e24c803ad04d2622e4214e5b3098811104fbe11"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "c475147c9867e3c4fc1195aac765fa3a73fb6d89832b6b59f2195ac67e427c1a"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSessions.xcframework.zip",
      checksum: "86f36f5fe70bde4a52077f5df770c6c165ead8012f8a1bb77789b2f739a09600"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "9c44c0e666823ac8c64fd01ddf2f5e37625e394b549bc67edbc8a3d97c4fe25b"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "3f1e92b1f248518ac8a9dd865c2de5e76bc7a0a7c40c3ee120a07edbff633a37"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "c68096e051c3f8aaac735a4794247e76ae3a4fd1558963a709daf87ccddf79de"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "15fb46b7e40fc367595c00f9e01de1b2ffff3dc3c1f73f532ced1c13b2779196"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleDataTransport.xcframework.zip",
      checksum: "15093e48701978d769b9e98dbb276b3927324054884ce6576ae149b5a58fc0c0"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleUtilities.xcframework.zip",
      checksum: "58112bf08dc38c3a0f925505adf89602c3af453cf3e0c60e49657024968e094e"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_nanopb.xcframework.zip",
      checksum: "5c1371f6439348192f5c99feb4eec58bb23cf15f6075df169647d66f220044df"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_Promises.xcframework.zip",
      checksum: "97e36de48d6a9d265e1a9b4e33b98a2190373760f104f95504a85c5b604f5a08"
    )
  ]
)
    