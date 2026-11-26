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
        "_FirebaseAppCheckInterop",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
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
        "_GoogleDataTransport"
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
        "_GoogleDataTransport"
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
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_AppCheckCore.xcframework.zip",
      checksum: "870243b8f24ec28f34ba037fca4e5e7a3b8238936f0ff04df1a7ecf4a77f1260"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FBLPromises.xcframework.zip",
      checksum: "3805bb9b2aa8e4da288bc84bc16f76bb66de9fcf545fa773d42d02c4fe7f4190"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseABTesting.xcframework.zip",
      checksum: "0301221e4d1f21146a6e6a2072ab3ec9feeb0094b50f4ade4865444d9f15d7a1"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "a941a8416318c0e395864094d1f23991b059f7f027ca2e1739df58df05c84a02"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "913fab6bd9c8d44c86743633bc15da1333544583658d6a49f72ee5f82254ae8a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "35a4c6c98dd5110c1dcfe4c0beccdc077df7a0ae0aae4c569e01551c0f641b4b"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCore.xcframework.zip",
      checksum: "7b74e3526b2ee518188383d0ef237d7990f194f6e6d0b7ba95b513c4094f7356"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "0a3ee9851cf7a6eb30540f7a064bfd78157529e9a4bce1557b76214b3ca002b8"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "8c152c95f8550ca0dc47713232feb804641e06f3e24ec024410f3ceea64ff2d5"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "57a89fefb1707dcec505b451131d70855f4119eace30b8d1d98544134e0bd9ee"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseInstallations.xcframework.zip",
      checksum: "37519864b9eefaa7ce462e8d1e295129c49bbbb26ea2040bb8d870e89e7aff83"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseMessaging.xcframework.zip",
      checksum: "fa6a0a55fdc27aedaba74ad0ffcef3e402d918c030e7d26301c2426c019f187a"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebasePerformance.xcframework.zip",
      checksum: "c2fc7170d3109a9fb5f79074a0dde08f14c78b00653d6624720cf2d5b7911073"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "62f422a3794c35e71f9fa2ba823b75c3e08f8f8741b5ac9265933f7fc26c5489"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "8c34b88ae20b48ff5a5011a57db069b44809d14255ade880cbeae4627cb4bf10"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseSessions.xcframework.zip",
      checksum: "66e6bdb25cc4d89c08d9a190f874950cc12c516225df0578f2eb4a97e3647775"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "4ef622f0439ad61f620ceffd594ad64b27d54c6fde598aa3b42dcbd47f4174ac"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "fd8b7fc1525bcf19c1894b844afdfe4dba236195fd2dd0417764d1ae088eb1e9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "1a37d736a4af59e7de69fc37c82484a60bcdbd8476d45b59afdb31551e72c46a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "df00aa3a53ba7896eb703e0ccf7767aad546ce0339c8d59cef85399fd2477184"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleDataTransport.xcframework.zip",
      checksum: "9bca16f0dad107e998c8677a08e6cbb6de858dc5c444e3ee4754cc60eb24dc81"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleUtilities.xcframework.zip",
      checksum: "d25ea23e4e36972d9ccb520bbc55b56e29ca1f832819f648ab2a4bc2a60a0aab"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_nanopb.xcframework.zip",
      checksum: "18eb18d999c11f05d3cc34be94c3d514f5e4a3292ab714e33524a0b4ed20720a"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/prnd-ios/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_RecaptchaInterop.xcframework.zip",
      checksum: "ee57128b843afe92e0857379e24893f5663be9224a2b4b47e8db4271db9bface"
    )
  ]
)
    