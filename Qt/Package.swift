// swift-tools-version: 6.0
import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "Qt",
    platforms: [
        .macOS(.v14),
    ],
    products: [
        .library(
            name: "QtCore",
            targets: ["QtCore"]
        ),
        .library(
            name: "QtCorePrivate",
            targets: ["QtCorePrivate", "QtCorePrivateWithoutPrefix"]
        ),
        .library(
            name: "QtQml",
            targets: ["QtQml"]
        ),
        .library(
            name: "QtGui",
            targets: ["QtGui"]
        ),
        .library(
            name: "QtTest",
            targets: ["QtTest"]
        ),
        .library(name: "QmlImports", targets: ["QmlImports"])

    ],
    targets: [
        .binaryTarget(
            name: "QtCoreBinary",
            path: "lib/Frameworks/QtCore.xcframework"
        ),
        .binaryTarget(
            name: "QtGuiBinary",
            path: "lib/Frameworks/QtGui.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickBinary",
            path: "lib/Frameworks/QtQuick.xcframework"
        ),
        .binaryTarget(
            name: "QtTestBinary",
            path: "lib/Frameworks/QtTest.xcframework"
        ),
        .target(
            name: "QtCore",
            dependencies: ["QtCoreBinary"],
            path: "lib",
            exclude: ["Frameworks"],
            sources: ["_spmQtCore.cpp"],
            publicHeadersPath: "Frameworks/QtCore.xcframework/macos-arm64/QtCore.framework/Headers"
        ),
        .target(
            name: "QtCorePrivate",
            dependencies: ["QtCore", "QtCoreBinary"],
            path: "lib",
            exclude: ["Frameworks"],
            sources: ["_spmQtCorePrivate.cpp"],
            publicHeadersPath: "Frameworks/QtCore.xcframework/macos-arm64/QtCore.framework/Headers/6.11.1"
        ),
        .target(
            name: "QtCorePrivateWithoutPrefix",
            dependencies: ["QtCore", "QtCoreBinary"],
            path: "lib",
            exclude: ["Frameworks"],
            sources: ["_spmQtCorePrivateWithoutPrefix.cpp"],
            publicHeadersPath: "Frameworks/QtCore.xcframework/macos-arm64/QtCore.framework/Headers/6.11.1/QtCore"
        ),
        .target(
            name: "QtQml",
            dependencies: ["QtQmlBinary", "QtQmlIntegration"],
            path: "lib",
            exclude: ["Frameworks"],
            sources: ["_spmQtQml.cpp"],
            publicHeadersPath: "Frameworks/QtQml.xcframework/macos-arm64/QtQml.framework/Headers"
        ),
        .target(
            name: "QtGui",
            dependencies: ["QtGuiBinary"],
            path: "lib",
            exclude: ["Frameworks"],
            sources: ["_spmQtGui.cpp"],
            publicHeadersPath: "Frameworks/QtGui.xcframework/macos-arm64/QtGui.framework/Headers"
        ),
        .target(
            name: "QtTest",
            dependencies: ["QtTestBinary"],
            path: "lib",
            exclude: ["Frameworks"],
            sources: ["_spmQtTest.cpp"],
            publicHeadersPath: "Frameworks/QtTest.xcframework/macos-arm64/QtTest.framework/Headers"
        ),
        .target(
            name: "QtQmlIntegration",
            path: "include",
            sources: ["_spmQtQmlIntegration.cpp"],
            publicHeadersPath: "."
        ),
        .binaryTarget(
            name: "QtConcurrentBinary",
            path: "lib/Frameworks/QtConcurrent.xcframework"
        ),
        .binaryTarget(
            name: "QtLabsAnimationBinary",
            path: "lib/Frameworks/QtLabsAnimation.xcframework"
        ),
        .binaryTarget(
            name: "QtLabsFolderListModelBinary",
            path: "lib/Frameworks/QtLabsFolderListModel.xcframework"
        ),
        .binaryTarget(
            name: "QtLabsPlatformBinary",
            path: "lib/Frameworks/QtLabsPlatform.xcframework"
        ),
        .binaryTarget(
            name: "QtLabsQmlModelsBinary",
            path: "lib/Frameworks/QtLabsQmlModels.xcframework"
        ),
        .binaryTarget(
            name: "QtLabsSettingsBinary",
            path: "lib/Frameworks/QtLabsSettings.xcframework"
        ),
        .binaryTarget(
            name: "QtLabsSharedImageBinary",
            path: "lib/Frameworks/QtLabsSharedImage.xcframework"
        ),
        .binaryTarget(
            name: "QtLabsStyleKitBinary",
            path: "lib/Frameworks/QtLabsStyleKit.xcframework"
        ),
        .binaryTarget(
            name: "QtLabsStyleKitImplBinary",
            path: "lib/Frameworks/QtLabsStyleKitImpl.xcframework"
        ),
        .binaryTarget(
            name: "QtLabsSynchronizerBinary",
            path: "lib/Frameworks/QtLabsSynchronizer.xcframework"
        ),
        .binaryTarget(
            name: "QtLabsWavefrontMeshBinary",
            path: "lib/Frameworks/QtLabsWavefrontMesh.xcframework"
        ),
        .binaryTarget(
            name: "QtNetworkBinary",
            path: "lib/Frameworks/QtNetwork.xcframework"
        ),
        .binaryTarget(
            name: "QtOpenGLBinary",
            path: "lib/Frameworks/QtOpenGL.xcframework"
        ),
        .binaryTarget(
            name: "QtQmlBinary",
            path: "lib/Frameworks/QtQml.xcframework"
        ),
        .binaryTarget(
            name: "QtQmlCompilerBinary",
            path: "lib/Frameworks/QtQmlCompiler.xcframework"
        ),
        .binaryTarget(
            name: "QtQmlCoreBinary",
            path: "lib/Frameworks/QtQmlCore.xcframework"
        ),
        .binaryTarget(
            name: "QtQmlMetaBinary",
            path: "lib/Frameworks/QtQmlMeta.xcframework"
        ),
        .binaryTarget(
            name: "QtQmlModelsBinary",
            path: "lib/Frameworks/QtQmlModels.xcframework"
        ),
        .binaryTarget(
            name: "QtQmlNetworkBinary",
            path: "lib/Frameworks/QtQmlNetwork.xcframework"
        ),
        .binaryTarget(
            name: "QtQmlWorkerScriptBinary",
            path: "lib/Frameworks/QtQmlWorkerScript.xcframework"
        ),
        .binaryTarget(
            name: "QtQmlXmlListModelBinary",
            path: "lib/Frameworks/QtQmlXmlListModel.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickControls2Binary",
            path: "lib/Frameworks/QtQuickControls2.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickControls2BasicBinary",
            path: "lib/Frameworks/QtQuickControls2Basic.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickControls2BasicStyleImplBinary",
            path: "lib/Frameworks/QtQuickControls2BasicStyleImpl.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickControls2FluentWinUI3StyleImplBinary",
            path: "lib/Frameworks/QtQuickControls2FluentWinUI3StyleImpl.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickControls2FusionBinary",
            path: "lib/Frameworks/QtQuickControls2Fusion.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickControls2FusionStyleImplBinary",
            path: "lib/Frameworks/QtQuickControls2FusionStyleImpl.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickControls2IOSStyleImplBinary",
            path: "lib/Frameworks/QtQuickControls2IOSStyleImpl.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickControls2ImagineBinary",
            path: "lib/Frameworks/QtQuickControls2Imagine.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickControls2ImagineStyleImplBinary",
            path: "lib/Frameworks/QtQuickControls2ImagineStyleImpl.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickControls2ImplBinary",
            path: "lib/Frameworks/QtQuickControls2Impl.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickControls2MacOSStyleImplBinary",
            path: "lib/Frameworks/QtQuickControls2MacOSStyleImpl.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickControls2MaterialBinary",
            path: "lib/Frameworks/QtQuickControls2Material.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickControls2MaterialStyleImplBinary",
            path: "lib/Frameworks/QtQuickControls2MaterialStyleImpl.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickControls2UniversalBinary",
            path: "lib/Frameworks/QtQuickControls2Universal.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickControls2UniversalStyleImplBinary",
            path: "lib/Frameworks/QtQuickControls2UniversalStyleImpl.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickDialogs2Binary",
            path: "lib/Frameworks/QtQuickDialogs2.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickDialogs2QuickImplBinary",
            path: "lib/Frameworks/QtQuickDialogs2QuickImpl.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickDialogs2UtilsBinary",
            path: "lib/Frameworks/QtQuickDialogs2Utils.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickEffectsBinary",
            path: "lib/Frameworks/QtQuickEffects.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickLayoutsBinary",
            path: "lib/Frameworks/QtQuickLayouts.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickParticlesBinary",
            path: "lib/Frameworks/QtQuickParticles.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickShapesBinary",
            path: "lib/Frameworks/QtQuickShapes.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickShapesDesignHelpersBinary",
            path: "lib/Frameworks/QtQuickShapesDesignHelpers.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickTemplates2Binary",
            path: "lib/Frameworks/QtQuickTemplates2.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickTestBinary",
            path: "lib/Frameworks/QtQuickTest.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickVectorImageBinary",
            path: "lib/Frameworks/QtQuickVectorImage.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickVectorImageGeneratorBinary",
            path: "lib/Frameworks/QtQuickVectorImageGenerator.xcframework"
        ),
        .binaryTarget(
            name: "QtQuickVectorImageHelpersBinary",
            path: "lib/Frameworks/QtQuickVectorImageHelpers.xcframework"
        ),
        .binaryTarget(
            name: "QtShaderToolsBinary",
            path: "lib/Frameworks/QtShaderTools.xcframework"
        ),
        .binaryTarget(
            name: "QtSvgBinary",
            path: "lib/Frameworks/QtSvg.xcframework"
        ),
        .binaryTarget(
            name: "QtXmlBinary",
            path: "lib/Frameworks/QtXml.xcframework"
        ),
        .target(
            name: "QmlImports",
            dependencies: [
                "QtConcurrentBinary",
                "QtCoreBinary",
                "QtGuiBinary",
                "QtLabsAnimationBinary",
                "QtLabsFolderListModelBinary",
                "QtLabsPlatformBinary",
                "QtLabsQmlModelsBinary",
                "QtLabsSettingsBinary",
                "QtLabsSharedImageBinary",
                "QtLabsStyleKitBinary",
                "QtLabsStyleKitImplBinary",
                "QtLabsSynchronizerBinary",
                "QtLabsWavefrontMeshBinary",
                "QtNetworkBinary",
                "QtOpenGLBinary",
                "QtQmlBinary",
                "QtQmlCompilerBinary",
                "QtQmlCoreBinary",
                "QtQmlMetaBinary",
                "QtQmlModelsBinary",
                "QtQmlNetworkBinary",
                "QtQmlWorkerScriptBinary",
                "QtQmlXmlListModelBinary",
                "QtQuickBinary",
                "QtQuickControls2Binary",
                "QtQuickControls2BasicBinary",
                "QtQuickControls2BasicStyleImplBinary",
                "QtQuickControls2FluentWinUI3StyleImplBinary",
                "QtQuickControls2FusionBinary",
                "QtQuickControls2FusionStyleImplBinary",
                "QtQuickControls2IOSStyleImplBinary",
                "QtQuickControls2ImagineBinary",
                "QtQuickControls2ImagineStyleImplBinary",
                "QtQuickControls2ImplBinary",
                "QtQuickControls2MacOSStyleImplBinary",
                "QtQuickControls2MaterialBinary",
                "QtQuickControls2MaterialStyleImplBinary",
                "QtQuickControls2UniversalBinary",
                "QtQuickControls2UniversalStyleImplBinary",
                "QtQuickDialogs2Binary",
                "QtQuickDialogs2QuickImplBinary",
                "QtQuickDialogs2UtilsBinary",
                "QtQuickEffectsBinary",
                "QtQuickLayoutsBinary",
                "QtQuickParticlesBinary",
                "QtQuickShapesBinary",
                "QtQuickShapesDesignHelpersBinary",
                "QtQuickTemplates2Binary",
                "QtQuickTestBinary",
                "QtQuickVectorImageBinary",
                "QtQuickVectorImageGeneratorBinary",
                "QtQuickVectorImageHelpersBinary",
                "QtShaderToolsBinary",
                "QtSvgBinary",
                "QtTestBinary",
                "QtXmlBinary"
            ],
            path: "./",
            exclude: [ "lib", "include" ],
            sources: [ "bundle.swift" ],
            resources: [
                .copy("qml"),
                .copy("plugins")
            ]
        )
    ],
    cxxLanguageStandard: .cxx17
)
