// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "MyTargetSDK",
	platforms:
	[
        .iOS("12.4")
	],
	products:
	[
		.library(
			name: "MyTargetSDK",
            type: .dynamic,
			targets: ["MyTargetSDKLib"])
	],
	dependencies:
	[
		.package(name: "MyTrackerSDK",
				 url: "https://github.com/myTrackerSDK/mytracker-ios-spm.git",
				 .upToNextMinor(from: "3.0.3")),
        .package(name: "digital_gov_rus_cert_support",
                 url: "https://github.com/Dmitry-Dmitriev/digital.gov.rus.cert.support.git",
                 .upToNextMajor(from: "1.0.0"))
	],
	targets:
	[
		.target(name: "MyTargetSDKLib",
                dependencies: ["MyTargetSDK", "MyTrackerSDK", "digital_gov_rus_cert_support"],
				path: "MyTargetPackageWrapper",
				linkerSettings: [
					.linkedFramework("SystemConfiguration"),
					.linkedFramework("CoreTelephony"),
					.linkedFramework("StoreKit"),
					.linkedFramework("AdSupport"),
					.linkedFramework("CoreGraphics"),
					.linkedFramework("AVFoundation"),
					.linkedFramework("CoreMedia"),
					.linkedFramework("SafariServices")
				]
		),
		.binaryTarget(name: "MyTargetSDK",
					  path: "Binary/MyTargetSDK.xcframework")
	]
)
