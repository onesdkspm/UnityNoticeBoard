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
        .package(url: "https://github.com/onesdkspm/AOUnityWebBridge.git", branch: "develop"),
        .package(url: "https://github.com/onesdkspm/BTSimpleHTTPNetworking.git", branch: "develop"),
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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityNoticeBoard/1.5.0-dev-1473188/UnityNoticeBoard.xcframework.zip",
            checksum: "c066a6e2b53056c05f8ebca4219b677849a839ce88c27acabb19ffa85c768dc8"
        )
    ]
)
