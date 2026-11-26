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
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        .target(name: "_GoogleAdsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseCrashlytics",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_Promises"
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
        "_FirebaseMessaging",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseCoreExtension",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_FirebaseSharedSwift",
        "_GoogleDataTransport",
        "_Promises"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_AppCheckCore.xcframework.zip",
      checksum: "5bca2744e52671404cbbab9d1b00ccb26c5ba0413301fea4c457c4b962e33a67"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FBLPromises.xcframework.zip",
      checksum: "7496009d42763f0433e4fa28d7353881b908f15441f81aa04b014e828393aef8"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseABTesting.xcframework.zip",
      checksum: "8ceb2cae7ad8015b0b90ba698d3e5547dc2211c174deac23470a683b3e1bff16"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "ef82dbbac797635159759f4378645d256770cd000ec753bbc7d2e58a65186825"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "fef4990ac011c04729312c6727c69f5240fab12cccf1461d99323da6deab4b94"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "31a79aa6990da551b966e49c754e55fb28f213a06d808fe4233bbce7dfd60ce8"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCore.xcframework.zip",
      checksum: "0e5fef58c22d59f3c2ce0bcda2839aec9d6339a16f501c26e87f9bc8f09b047c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "5301284d55032b2cf3d6813e530318a75ec8706ee3568dd471d04abedfd4dc42"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "dceea1571db17f3f6c59d150f4e96d0007ab56b722aa043d5f55a436a29c7c82"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "3559d395917aef4d7838d2ba5c0eeb36ea7218b3e53c4c5f8fb25b7adcc64b94"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseInstallations.xcframework.zip",
      checksum: "63c7cf56d2031b21d3934b2db1f1ff6f51826ddff6e2ccfc5566d9fdbd71c4ed"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseMessaging.xcframework.zip",
      checksum: "3c21f5ef8b5b94ca1d28ae6b36bc9f7cf3c51a5808f7f8ad37ecd2855e504b26"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebasePerformance.xcframework.zip",
      checksum: "91d5612d48ef0b6644308287cdd44faecaad20e6f96bf0c97ecf9d410e7726e9"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "8b5a54261dc8847c7abcfdc91a405bead17271dbf5689d020ce4fe6e19d9aa60"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "cbc1d00ab06c23b69d211779c5b2afc317ca0d8e0bf0f5758a2a0933ebc3a4d2"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSessions.xcframework.zip",
      checksum: "dc201d16a0e6ff3bb4d5798eebe0b94779b771b73e76c3c8fac8e030eaaee659"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "3d9a4b4db7447bb26690262c7708d0e0d99ef882bd0e5275e54de79e07b188cb"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "9435b71da9d1f8cb75c93698c6717642d1a03c150842e60904ecde46735d71d1"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "c5f2bc179ec7dc81fc7e9495896a27a10eec25ffe12d3fa40463676f81a56584"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "63d4406e4fb4d7ac57ae355e8aa442ec4f51b1163b62eabba3b5810014d42aeb"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleDataTransport.xcframework.zip",
      checksum: "0a73ab26e8df47b420003e09035c6894fc86a4baaa4c985cd4059d88b351cce0"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleUtilities.xcframework.zip",
      checksum: "803739974f0e4cf730150237606a11694b2c70cc7942a78bc1ffa57ecde50141"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_nanopb.xcframework.zip",
      checksum: "0908b89d1cb4cb63131f134e84b147c936c0e58b2d614b02b14644f07d8117f5"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_Promises.xcframework.zip",
      checksum: "ff37d987e03cce9ba3c7c7ea2e57463495700c3c8af39ec4dccfbebae1be4e79"
    )
  ]
)
    