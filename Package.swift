// swift-tools-version: 5.8

import PackageDescription
import Foundation

func prebuiltTarget(
    name: String,
    xcframeworkName: String? = nil,
    checksum: String,
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
        checksum: "122c9542b497baf044f9b4d95db6a59712215d991b3c95a3b7165fa4e8005b4f",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftCompilerPlugin",
        checksum: "156de0a92574ae5ff4713633e918f48811069e1d1672f135867315d934c6e93f",
        dependencies: [
            "SwiftCompilerPluginMessageHandling_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftDiagnostics",
        checksum: "c6454cc1b1856b7bd4e65574f7dc37ed9bfc83e14db7aba0549e9a949896a834",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftIDEUtils",
        checksum: "541b554d1328a3e609bd1c8fcacdbe1623a6002aa667ea4a4e7fb044691e0c94",
        dependencies: [
            "SwiftSyntax_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftOperators",
        checksum: "7949aed236c0ffc060bc693445dc79179bcdb7d4d43acf3ecf0ccc5c9a3064f6",
        dependencies: [
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftParser",
        checksum: "41cd20429364de21278eac370b45600862c1d295e4639830ef3f516481100124",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftParserDiagnostics",
        checksum: "c0279cfd4c55ebc90545fcfd05b850401505a6ea874f91989257eec6ade913bd",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftRefactor",
        checksum: "a8e58ac8c83a871a75d3216e6de8753b8789cf5aec4354dd975bd832df454fa6",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntax",
        checksum: "7027ed71b4532f558f0a108e5efde46725fa860e5e0062246c6e14adbedf0b4e",
        dependencies: [
            "_SwiftSyntaxCShims_Aggregation",
            "SwiftSyntax509_Aggregation",
            "SwiftSyntax510_Aggregation",
            "SwiftSyntax600_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxBuilder",
        checksum: "ee1ff1dffdd5a33567bbb5d4b3af74669686dd7a8a7ca05c852421e0ea92563b",
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
        checksum: "4c185d340e8106f7ed26624296ece056b924c1705c2f7a0daa9c1c123770e168",
        dependencies: [
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxMacroExpansion",
        checksum: "24a7b831bcb2921661b6872b5c6d8f820e4dea5e55aeb6bb4598bc519fc5b568",
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
        checksum: "088c5e37aec60a4a94f52a843dc881be52132ae7b3b00d4fcec9b808e314e1c5",
        dependencies: [
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxMacroExpansion_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
            "SwiftSyntaxMacrosGenericTestSupport_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxMacrosGenericTestSupport",
        checksum: "16b7f15e775448a7941229dd14d3efdefb9ad2abcac2e4bdcdeb8e2dcec046c4",
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
        checksum: "0b963dbf5996d395de168bcaf91c95588ade483682f3b7d417a026297b1d6cac",
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
        checksum: "82ac03472af0f10d3febad9486b6a38f931dcd00c5846c002e4c791fa1319d5f",
        dependencies: [
            "SwiftSyntaxMacros_Aggregation",
            "SwiftCompilerPluginMessageHandling_Aggregation",
            "_SwiftLibraryPluginProviderCShims_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "_SwiftSyntaxGenericTestSupport",
        checksum: "bd8434ce08b0063bd7a45bcb5907e460a4382611269a299c72bcccf7c49aa9a5"
    ),
    prebuiltTarget(
        name: "_SwiftSyntaxCShims",
        checksum: "06e0a80590182d2ed0e3bf1f6c6d897f030eeabaf20462588ec26a78286068db"
    ),
    prebuiltTarget(
        name: "_SwiftLibraryPluginProviderCShims",
        checksum: "57d50fd9c5b6d6a0df4ee22df8eec5ccbcad4f55d2490aa94bc5cecf3487ffbe"
    ),
    prebuiltTarget(
        name: "SwiftSyntax600",
        checksum: "49b38f8e62cfadfdadc8a39cb43d19662ab0fddee0c9a4e4b0cbdf9608d3b784"
    ),
    prebuiltTarget(
        name: "SwiftSyntax510",
        checksum: "0d676cb6d9bcf3c1f9d32aa195bdd47f2baf0664da1b958e888aba1b10db9145"
    ),
    prebuiltTarget(
        name: "SwiftSyntax509",
        checksum: "d7f831b2a07f10ba4981022fa7f4e31e09d38d69f81e1cdb4311e1592d35cb5e"
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