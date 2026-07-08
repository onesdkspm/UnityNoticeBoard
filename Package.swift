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
        .package(url: "https://github.com/onesdkspm/AOUnityWebBridge.git", from: "2.0.3"),
        .package(url: "https://github.com/onesdkspm/BTSimpleHTTPNetworking.git", from: "2.0.3"),
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.3"),
        .package(url: "https://github.com/onesdkspm/BTSDKUIKitCore.git", from: "2.0.3"),
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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityNoticeBoard/2.0.3-dev-1481473/UnityNoticeBoard.xcframework.zip",
            checksum: "13b89c2d048654c52d8b67de32b1c555680cb08eac372596a94617f64300befc"
        )
    ]
)
