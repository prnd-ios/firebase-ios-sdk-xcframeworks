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
      checksum: "9946e2c5cfc3ac13cee0f6a62cefdbe0fc077c8702d91678908b412a5d69d079"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FBLPromises.xcframework.zip",
      checksum: "164a296b2dc67b053a337c430144ec70af4d71a3ad1ddbeefd6d5e754674ddd1"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseABTesting.xcframework.zip",
      checksum: "e0d66e73d3684e01ac0b8fbc7187f2edec6831a5ac49235aeec5124c34b6d5ac"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "702d56cc40b95c5ed65fa70d4df09a27eaa1ed3494e7395dba6d83a374e2fc38"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "34d0be03e5d60a64e1f65aceebaee8ebb755c78912c5cfd0d0a5030381f8fdd5"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "f550216435579694c889536754d999c2bf1a0176a118042a27f2e4a43e78c1d1"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCore.xcframework.zip",
      checksum: "b06b6d44eacd1bdd15221797fd2067625b53ca55a15f17e4f6eac9336ea8f4c2"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "f8a2d49b5bb2f2e8e4aa2d9d27739d9d598a6b573cc64446202f0e0200c8411c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "c661b3565a4a3fd0b7cea974ed1840e620e4e71494c5a290a485e7f7ada5be3c"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "5801178d0fd4cc0f8d3ad4d09c17f904389a1243ed218e7fff3dfc254849cc6a"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseInstallations.xcframework.zip",
      checksum: "568df7e8417899ce8e1c9a818c693b7116257dd219d90f30ee098001193cf3d3"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseMessaging.xcframework.zip",
      checksum: "87e54690491923b618622b53c7de02e7295223fe5cf7bbe9449662508fa26850"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebasePerformance.xcframework.zip",
      checksum: "94a1d6d9d0f9bb5b8d485ec892f48cb31734dffc0c41978b5b979ae56217ba69"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "8f89dedbacb6fe9f444b23e6a1f2e306ac5deaf4410859b64879997df76d0b06"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "b5e13cb7c33ada189781ae25a1f70d1f772190356a7dab0b6820f1127d7937d3"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSessions.xcframework.zip",
      checksum: "7c8b5a14cec1bbb38acbd03bf3b028f74e9a47cefa339e683748ba10c5cad5c1"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "cd74231718888758d724a67dad8b7c81f1f3065e94f0bb5b9f046a16f68076d9"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "dbaa35e2e52aeafc7613e1dae93ad6f6e7e50c40031fd4ee5ee8eb38a5729704"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "51e0e7a550a3f806a75935b4c81e1d879f6b99d07d60acf9868f7c353a9245a1"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "a7403c377da1f44a43b7b762d559808a90a636656aa03d038a5f9fc54b4d58ce"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleDataTransport.xcframework.zip",
      checksum: "02e2a02e3e8ea0a6e550d877a4c7f956f26da0129ea0fed85aa586da33ad0300"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleUtilities.xcframework.zip",
      checksum: "ce957bb8e8aa5fa5de77636b3e51ae77a3fb9224e0216c41b151a06adfe428db"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_Promises.xcframework.zip",
      checksum: "8f16d15146429ab1139ba122d49a3c934c8b597f292f913e8045c8fbfe39ffa2"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_nanopb.xcframework.zip",
      checksum: "043f88fb5696aa4f35d4bd9a3c590d8f53568225e56a8fff871fc8b54de41639"
    )
  ]
)
    