// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "UnityNoticeBoard",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "UnityNoticeBoard",
            targets: ["UnityNoticeBoardWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/onesdkspm/AOUnityWebBridge.git", from: "2.0.2"),
        .package(url: "https://github.com/onesdkspm/BTSimpleHTTPNetworking.git", from: "2.0.2"),
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.0"),
        .package(url: "https://github.com/onesdkspm/BTSDKUIKitCore.git", from: "1.0.0"),
    ],
    targets: [
        // ========== Wrapper Target（统一管理系统依赖）==========
        .target(
            name: "UnityNoticeBoardWrapper",
            dependencies: [
                .byName(name: "UnityNoticeBoard"),
                .product(name: "AOUnityWebBridge", package: "AOUnityWebBridge"),
                .product(name: "BTSimpleHTTPNetworking", package: "BTSimpleHTTPNetworking"),
                .product(name: "UnityBridge", package: "UnityBridge"),
                .product(name: "BTSDKUIKitCore", package: "BTSDKUIKitCore"),
            ],
            path: "UnityNoticeBoardWrapper",
            linkerSettings: [
                // iOS 系统框架
                
                // 系统库
            ]
        ),
        
        // ========== Binary Frameworks ==========
        .binaryTarget(
            name: "UnityNoticeBoard",
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityNoticeBoard/2.0.2/UnityNoticeBoard.xcframework.zip",
            checksum: "e4183b88b1d3cec192d55cc8a275d3f03a844e56e8222df069d943fdf40ea75f"
        )
    ]
)
