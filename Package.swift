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
      checksum: "7628decb1b5fbb4a97c609321071c18b330e336065c8f20c29454927c951cf7d"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FBLPromises.xcframework.zip",
      checksum: "3cb57a5ad9d97cd02cb13415c9dc4b89758cd4ccdd1765460bd678f87d0ae065"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseABTesting.xcframework.zip",
      checksum: "c5030c7579408605583597e7dfefb8acea60e524803878b713706cf932846b79"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "6a334d2fb6cbe02446995b156223d064c1b25e4c979f7727866db43ac3ea38d0"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "277111409d2737074bd9598a8a360dc63c51e52fae3e89fdb252ac3d9da4c26f"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "d8d5ba92b4eda81da802b14912d4d2fe0c2ff5f8e82f0e0ad8f15a6920cffee0"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCore.xcframework.zip",
      checksum: "cb99ed646394e0bcd50b4df93e1794f8f363d446a19d2d9828c9a8cfea38eed1"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "28d943bf175a4d7fab5cdef04628fe23911c5f585236fd88fb697b7818623795"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "fa99b0c96ccafa6cfeb4d721102cfaf158291631ca5108e490e1c9acec8649a9"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "85df5963ef55c7d9ab251478c1ecdf90d911f2ae03f5dd534cf1e2c00c7c72f7"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseInstallations.xcframework.zip",
      checksum: "15d1b22866422a8040b6ba8989362e9fe19b75bf7ab9be69fddf023c1537ff07"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseMessaging.xcframework.zip",
      checksum: "20b2826810c43da1e23d30934b938ccc16a59e759cbf9e505168a433b3bcca3c"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebasePerformance.xcframework.zip",
      checksum: "5bf45a693a29a04a3581a175270559f534cc98ddafd2786ffa2c6dccada8c428"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "99e1d510950348c745c08d8477e2f085eebf705b914de027e5d1b0b873c85b02"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "3445d647e82ecba76ee84a63190631a86cfbfb8a2ad2d478794afbb8d0abb095"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSessions.xcframework.zip",
      checksum: "8f9fc2b0ca240ebb6694dd9eacb0f9d105fb51aa2403466dd3d23cb9574823af"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "99917e53bdb964aab380aa2723b3d2741d49411342219e8d72eaf8147869f9e1"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "3214575709d78ce981aa3e1ebb32d5aad57796b67b588c52d145c6fbe0974749"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "56c87fca247e1de2d28852b669812591462e3430c924b5f0ebee2c9e2ad7c1c3"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "888ce6a92ddffbacb8ef212ca04e65b7abb3d5318b65214cc68c4525391a8fba"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleDataTransport.xcframework.zip",
      checksum: "f4bfc1cd8166832be9b45fddcc4b8f4ef0e041389830e89e356e3dbed31eff25"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleUtilities.xcframework.zip",
      checksum: "7d1caf0bbc2d7762d3216bce908a9abf13a7a627b1cd500647845feae9d5420e"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_Promises.xcframework.zip",
      checksum: "884627a581a5461c9ee42d58f906e9915efd2f0ae75a2f136488be6552c843c2"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_nanopb.xcframework.zip",
      checksum: "2271f9ff379edec56c3fbd3b10627cc4d4c2bb4b130f771a28dfd8b975dcb817"
    )
  ]
)
    