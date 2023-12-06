// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TgVoipWebrtc",
    platforms: [.macOS(.v10_13)],
    products: [
        .library(
            name: "TgVoipWebrtc",
            targets: ["TgVoipWebrtc"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "TgVoipWebrtc",
            dependencies: [],
            path: ".",
            exclude: ["LICENSE",
                      "README.md",
                      "tgcalls/platform/android",
                      "tgcalls/platform/tdesktop",
                      "tgcalls/platform/uwp",
                      "tgcalls/platform/fake",
                      "tgcalls/platform/darwin/iOS",
                      "tgcalls/platform/darwin/VideoCaptureView.mm",
                      "tgcalls/platform/darwin/VideoCaptureView.h",
                      "tgcalls/platform/darwin/GLVideoView.mm",
                      "tgcalls/platform/darwin/GLVideoView.h",
                      "tgcalls/platform/darwin/VideoMetalView.mm",
                      "tgcalls/platform/darwin/VideoMetalView.h",
                      "tgcalls/platform/darwin/VideoSampleBufferView.mm",
                      "tgcalls/platform/darwin/VideoSampleBufferView.h",
                      "tgcalls/platform/darwin/AudioDeviceModuleIOS.h",
                      "tgcalls/platform/darwin/VideoCameraCapturer.mm",
                      "tgcalls/platform/darwin/VideoCameraCapturer.h",
                      "tgcalls/platform/darwin/CustomExternalCapturer.mm",
                      "tgcalls/platform/darwin/CustomExternalCapturer.h",
                      "tgcalls/legacy/InstanceImplLegacy.h",
                      "tgcalls/legacy/InstanceImplLegacy.cpp"
                     ],
            publicHeadersPath: "macos/PublicHeaders",
            cxxSettings: [
                .headerSearchPath("."),
                .headerSearchPath("tgcalls"),
                .headerSearchPath("macos/PublicHeaders"),
                .unsafeFlags(["-I../../core-xprojects/webrtc/build/src",
                              "-I../../core-xprojects/webrtc/build/src/third_party/abseil-cpp",
                              "-I../../core-xprojects/webrtc/build/src/sdk/objc",
                              "-I../../core-xprojects/webrtc/build/src/sdk/objc/components/renderer/metal",
                              "-I../../core-xprojects/webrtc/build/src/sdk/objc/components/video_codec",
                              "-I../../core-xprojects/webrtc/build/src/sdk/objc/base",
                              "-I../../core-xprojects/webrtc/build/src/sdk/objc/api/video_codec",
                              "-I../../core-xprojects/webrtc/build/src/third_party/libyuv/include",
                              "-I../../core-xprojects/webrtc/build/src/sdk/objc/components/renderer/opengl",
                              "-I../../core-xprojects/openssl/build/openssl/include",
                              "-I../../core-xprojects/libopus/build/libopus/include",
                              "-I../../core-xprojects/ffmpeg/build/ffmpeg/include",
                              "-I../telegram-ios/third-party/rnnoise/PublicHeaders"]),
                
                .define("WEBRTC_POSIX", to: "1", nil),
                .define("WEBRTC_MAC", to: "1", nil),
                //NDEBUG FLAG MUST BE THE SAME AS WEBRTC BUILT OTHERWISE IT WILL CRASH SOMEWHERE , USE _DEBUG FOR DEBUG, NDEBUG FOR RELEASE
                .define("NDEBUG", to: "1", nil),
                .define("RTC_ENABLE_VP9", to: "1", nil),

                .define("WEBRTC_USE_BUILTIN_ISAC_FLOAT", to: "", nil),
                .define("ABSL_ALLOCATOR_NOTHROW", to: "1", nil),
                .define("BWE_TEST_LOGGING_COMPILE_TIME_ENABLE", to: "0", nil),
                .define("HAVE_NETINET_IN_H", to: "", nil),
                .define("HAVE_SCTP", to: "", nil),
                .define("HAVE_WEBRTC_VIDEO", to: "", nil),
                .define("NO_MAIN_THREAD_WRAPPING", to: "", nil),
                .define("RTC_DISABLE_TRACE_EVENTS", to: "", nil),
                .define("WEBRTC_APM_DEBUG_DUMP", to: "0", nil),
                .define("WEBRTC_ARCH_ARM64", to: "", nil),
                .define("WEBRTC_ENABLE_PROTOBUF", to: "0", nil),
                .define("WEBRTC_HAS_NEON", to: "", nil),
                .define("WEBRTC_HAVE_DCSCTP", to: "", nil),
                .define("WEBRTC_HAVE_SCTP", to: "", nil),
                .define("WEBRTC_INCLUDE_INTERNAL_AUDIO_DEVICE", to: "", nil),
                .define("WEBRTC_LIBRARY_IMPL", to: "", nil),
                .define("WEBRTC_NON_STATIC_TRACE_EVENT_HANDLERS", to: "1", nil),
                .define("WEBRTC_OPUS_SUPPORT_120MS_PTIME", to: "1", nil),
                .define("WEBRTC_OPUS_VARIABLE_COMPLEXITY", to: "0", nil),
                .define("WEBRTC_USE_H264", to: "", nil),
            ]),
    ],
    cxxLanguageStandard: .gnucxx20
)
