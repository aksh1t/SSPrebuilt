// swift-tools-version: 5.8

import PackageDescription
import Foundation

func prebuiltTarget(
    name: String,
    xcframeworkName: String? = nil,
    checksum: String
    dependencies: [Target.Dependency] = []
) -> [Target] {
    let url = "https://github.com/godyume/SSPrebuilt/releases/download/600.0.0"
    return [
        .binaryTarget(
            name: name,
            url: "\(url)/\(xcframeworkName ?? name).xcframework.zip",
            checksum: checksum
        ),
        .target(
            name: "\(name)_Aggregation",
            dependencies: [
                .target(name: name),
            ] + dependencies
        ),
    ]
}

let targets: [[Target]] = [
    prebuiltTarget(
        name: "SwiftBasicFormat",
        checksum: "e24b141c6e484fa59e16798061880668f003b708b7774e1151048a8ff9c83ab9",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftCompilerPlugin",
        checksum: "623cf022cdc9b859ac1a60e34d4f465d28b13477ed38c3e8e5fccfd2a5b4710a",
        dependencies: [
            "SwiftCompilerPluginMessageHandling_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftDiagnostics",
        checksum: "2ab201ec54631097bc074af25145a3f91df027dddc4af29436a3dab793cf2e5a",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftIDEUtils",
        checksum: "741f4c826c1bae88dc6da2b19f30e15a2c8b6c678ca24eba6764c4cac238a222",
        dependencies: [
            "SwiftSyntax_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftOperators",
        checksum: "a976643881d9f9db1ab562f4ca28185f55571199d27f2dc033ed135f4a85ff96",
        dependencies: [
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftParser",
        checksum: "9bf1603d6e85905d89ce8669dfbf43447d9311d48f1a3a9bba792049e3fdd1f1",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftParserDiagnostics",
        checksum: "d67d3b686bfeba13bbf6932409ecf6ff5b713ed5a60f5681bd3f8c24638ac608",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftRefactor",
        checksum: "b665dcd09b4598fb530aae5d0af78961a38f7aaf627f59ad06b8f0667949ee62",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntax",
        checksum: "842116cb4cc918e093e6f2dfdf93b9707df9d01f36c7d6e258b92ddbcac03e8c",
        dependencies: [
            "_SwiftSyntaxCShims_Aggregation",
            "SwiftSyntax509_Aggregation",
            "SwiftSyntax510_Aggregation",
            "SwiftSyntax600_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxBuilder",
        checksum: "11de507cd914068e03462061faa98407d44b1587afc01b027c21162dc5e0fe8b",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftParserDiagnostics_Aggregation",
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxMacros",
        checksum: "bc476dcd6a31cb5bc68a1afc9b415dfd89e7a1bc75a007743908cceeae16ebb8",
        dependencies: [
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxMacroExpansion",
        checksum: "5e8455c77ff320e435430bbcd43f44f8ca98ba6d9f863bab84e31e04a0c39be6",
        dependencies: [
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftOperators_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxMacrosTestSupport",
        checksum: "07694fac8fd1d08fba546a50fa60da016cbf851adbad7d57f18cea579995a8a5",
        dependencies: [
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxMacroExpansion_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
            "SwiftSyntaxMacrosGenericTestSupport_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxMacrosGenericTestSupport",
        checksum: "bccfda508e07249be129093ce2a1c49faebb1ce127edae756aa70c20ebf0b40d",
        dependencies: [
            "_SwiftSyntaxGenericTestSupport_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftIDEUtils_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
            "SwiftSyntaxMacroExpansion_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftCompilerPluginMessageHandling",
        checksum: "aa6f01f43899cd4c10125f96d73bbfa7ff577adb3c995413b05266e34878c7e7",
        dependencies: [
            "_SwiftSyntaxCShims_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftOperators_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
            "SwiftSyntaxMacroExpansion_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftLibraryPluginProvider",
        checksum: "a7da53f9590c570ea633a1ef88a290d19ccc2ca34433054c53b457d4bc3dba2d",
        dependencies: [
            "SwiftSyntaxMacros_Aggregation",
            "SwiftCompilerPluginMessageHandling_Aggregation",
            "_SwiftLibraryPluginProviderCShims_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "_SwiftSyntaxGenericTestSupport",
        checksum: "86fdd927eb13e32912c8396a14d7c14e2bc3b380d76827f877aac4480c69e5c9"
    ),
    prebuiltTarget(
        name: "_SwiftSyntaxCShims",
        checksum: "85b5a7e155a217f4b4dfafd85d78b415e49e010ec96483c2bb2d5aaf44b38d3b"
    ),
    prebuiltTarget(
        name: "_SwiftLibraryPluginProviderCShims",
        checksum: "b37c77b7197dd2c01a36e255bc1daa1b6967fa382f8cd7dd4d62e7e565e4612f"
    ),
    prebuiltTarget(
        name: "SwiftSyntax600",
        checksum: "75d0522501217fc84090ab9efacdfadc51ba9106b88ad2178ce6af55d3f9b5b0"
    ),
    prebuiltTarget(
        name: "SwiftSyntax510",
        checksum: "9c1aeb62e615d4440397d54cccb4010610833fb45e003796eaccf558af68e691"
    ),
    prebuiltTarget(
        name: "SwiftSyntax509",
        checksum: "942a8a50f0ecffc805aed262b9d68928c2684e47f1f1e00ee87c94c29b25969e"
    ),
]

let package = Package(
    name: "swift-syntax",
    products: [
        .library(
            name: "SwiftBasicFormat",
            targets: [
                "SwiftBasicFormat_Aggregation",
            ]),
        .library(
            name: "SwiftCompilerPlugin",
            targets: [
                "SwiftCompilerPlugin_Aggregation",
            ]),
        .library(
            name: "SwiftDiagnostics",
            targets: [
                "SwiftDiagnostics_Aggregation",
            ]),
        .library(
            name: "SwiftIDEUtils",
            targets: [
                "SwiftIDEUtils_Aggregation",
            ]),
        .library(
            name: "SwiftOperators",
            targets: [
                "SwiftOperators_Aggregation",
            ]),
        .library(
            name: "SwiftParser",
            targets: [
                "SwiftParser_Aggregation",
            ]),
        .library(
            name: "SwiftParserDiagnostics",
            targets: [
                "SwiftParserDiagnostics_Aggregation",
            ]),
        .library(
            name: "SwiftRefactor",
            targets: [
                "SwiftRefactor_Aggregation",
            ]),
        .library(
            name: "SwiftSyntax",
            targets: [
                "SwiftSyntax_Aggregation",
            ]),
        .library(
            name: "SwiftSyntaxBuilder",
            targets: [
                "SwiftSyntaxBuilder_Aggregation",
            ]),
        .library(
            name: "SwiftSyntaxMacros",
            targets: [
                "SwiftSyntaxMacros_Aggregation",
            ]),
        .library(
            name: "SwiftSyntaxMacroExpansion",
            targets: [
                "SwiftSyntaxMacroExpansion_Aggregation",
            ]),
        .library(
            name: "SwiftSyntaxMacrosTestSupport",
            targets: [
                "SwiftSyntaxMacrosTestSupport_Aggregation",
            ]),
        .library(
            name: "SwiftSyntaxMacrosGenericTestSupport",
            targets: [
                "SwiftSyntaxMacrosGenericTestSupport_Aggregation",
            ]),
        .library(
            name: "_SwiftCompilerPluginMessageHandling",
            targets: [
                "SwiftCompilerPluginMessageHandling_Aggregation",
            ]),
        .library(
            name: "_SwiftLibraryPluginProvider",
            targets: [
                "SwiftLibraryPluginProvider_Aggregation",
            ]),
    ],
    dependencies: [

    ],
    targets: targets.flatMap { $0 }
)