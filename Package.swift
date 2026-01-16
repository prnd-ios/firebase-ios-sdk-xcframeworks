// swift-tools-version:5.3
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
      checksum: "b76a1fb98e0cf3aa18925923ccaa5fc6aba5b3896b51ebb943b959cb0a85850d"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FBLPromises.xcframework.zip",
      checksum: "589a7f1191f4226cb42710d67bcbd4c3f570e2e1bdd4486f7caef955bc768782"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseABTesting.xcframework.zip",
      checksum: "565d59a8f7a791c0511a88576e4b50685422b54841742ae44d6b0109c409b282"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "7441caa9fd7f9acbec2b3937b88b57f939d9ecce0dc1373ad8fff172b1d5d565"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "c85e069f736332d8aef34c66678b66f218a6914c27b00b51947653783d44bd2b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "cdf52b1fc5846aacdcc3bb1ffa6b0eaf97fa5b48f524cc9b8f11c633eec6cb88"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCore.xcframework.zip",
      checksum: "4f6d02667a1e10aa26395cbf57dab5e4370bf2718a136575742218ac38d5a498"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "3835ee1d435e0f495e2cf98b8734dadd202fdb0b78bae51ceca7173c84c0df02"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "41581d601e9a8b18404378e970a842d6c55cf681e7a715554a8627a7cb7d71ac"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "b90108a85d17587ae2485321e3246833ce419ee0e907ab218525ae383b69b60a"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseInstallations.xcframework.zip",
      checksum: "8c7e160894f798c0ee65579bd3e1de6dcc7e476eb2a858e89d07fa6cb61d1185"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseMessaging.xcframework.zip",
      checksum: "7de069541ad8e3945fac7b257d99b5aef7dd983a46df36c046eb3f064eb76334"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebasePerformance.xcframework.zip",
      checksum: "d05748d25bb569e49fb6aa2fd7bb15abe22cdbd611fa52277776bd95b79a08b6"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "2fc5be86311e93df0f8bd6ebc21cb6744ea91340db536af99fa1f7be3fed0a46"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "2e791915e85524c233a2e94a7add0b459c54d475b6a02fa6cdd8fc2830fa2744"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSessions.xcframework.zip",
      checksum: "84a3c0ebcbd7eb61a6e40a8529cae41bcb4d5824070c5977a7d0d1de276aa106"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "73a1c223c15b2a14e75381154056df674009b5324a73afafc23b9d40d056db48"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "d8f36fa7b471a46a766400b450f0164ebc89ab55146cfa34ada5f419c9a7af33"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "aec321e2465f00c9ec17994b0176b57f73e243da811d2465a7cc101324dd1306"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "b32154c4e4a1fdd4026e6d5ebaf478718244aabdf39a312048a5d9a07a21d0ae"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleDataTransport.xcframework.zip",
      checksum: "3ad9cfa80eca7f804af8eefb89da2e554e75c6765441e202de05105f040655ca"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleUtilities.xcframework.zip",
      checksum: "3a63c9e7cb364ffeceb3acaaea6de1cacf9d6e03e241d32e0db2d0f3da24b8d3"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_Promises.xcframework.zip",
      checksum: "fab66cee8a2daf1b162525f26a0a1b5034c5fed0d03a2475a876ef74c4d03d65"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_nanopb.xcframework.zip",
      checksum: "fed031ca0bc61626fc4685599b00bb6c364c52be7f249235bad6235fb780e0da"
    )
  ]
)
    