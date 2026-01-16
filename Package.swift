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
      checksum: "2392b88ffbf6831eeb0c4906a8738e7ba36f04b2dd09118b373ad5e1187bdade"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FBLPromises.xcframework.zip",
      checksum: "c556b20d77d347e8f7c3aec1062e0754adddb0b7a5772e63e516385028dfa86d"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseABTesting.xcframework.zip",
      checksum: "298299f1f2a4f2372039ea464803ff257e8110b942c9977b2517803214bd374b"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "7248d5060afa38f86405015b278b2e7c802699facc531d54e97dc645dbc28a7d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "c6fa25188c9dd6c4e7f0585c2690c39ef07f5336fcb2d5cc8d8d4b2ff1c259c8"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "2ebde89616484cc4d87a425cacc2e861cb013852e91144043d8e21ccb1f7c430"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCore.xcframework.zip",
      checksum: "d212c9eb5a08cb2198047164dae5c61c2240c0071c28312f6466856c61b61c60"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "119be2b43411432952a079c1653acbd6f459ffad198ca864ee96938cf6287d46"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "b3e9c942f1b442394b57180c2432a153800edadf91cde73fc88a323579e00d07"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "4b9fb6388165baf93a175df8f90284f93aa8a9f0aaa96044452b8b0b40737e3d"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseInstallations.xcframework.zip",
      checksum: "3557691b8bd4d0101711d89d26de2bd04e12791f7e4539b4e998e45127836361"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseMessaging.xcframework.zip",
      checksum: "2b8bb00e550bc1a63b970e7b8613fb7049123f0ef094758e71308a304399be08"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebasePerformance.xcframework.zip",
      checksum: "fb96450c6964dd5513140e6c8d6f479b12a86aeb0695598f105fe287f48690ab"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "e4f94a4ebf95a3cf97346665a52968a737df5e1a264d059e7eab63bb924e59e0"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "6d2c411af17a614e7c93107cb8d01a11077e64411e7355dd2dc724364c04e414"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSessions.xcframework.zip",
      checksum: "8f3091a9b16b6237a8cdc085fe1c0c921a722040d1e99e024af175d98d65516c"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "b39093458b5955f7168683cacd746a8b86f521a0e0353e5801804df8c4ae36e5"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "1148a2bf53d8a20387241fb071017bf1e01bcc2cdad8661221d0536adceaba0d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "375a70f5cb8cd4b878595bdd2ef113ddf087a35709908daf8ba5588a359397c8"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "93300e55fb5c3de7cd32f9ff8c7ab5eb5df68a7fb642606e6c107998fe22d02b"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleDataTransport.xcframework.zip",
      checksum: "db7eb9aed8b6443acc011535284dcfe6b87b1f4700979addd78b73a2225e6697"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleUtilities.xcframework.zip",
      checksum: "7bc9edcf19b6a66acb06ede9d14396469c49d1e2bc6199dadd2235e73a4a9aa0"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_nanopb.xcframework.zip",
      checksum: "561e64777740dbac587bf591e465dc116fea47edeb69e1c411f12175d0895e5f"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_Promises.xcframework.zip",
      checksum: "de172307c71367627ba96b6b5b0f96cb777ffed9944a4c5812994dfce1f447dc"
    )
  ]
)
    