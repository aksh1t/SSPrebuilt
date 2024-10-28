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
        checksum: "6b7e179a0ea1c8a4943e22a9ce745aee40eee62cbbe5fffc50169eb889d21858",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftCompilerPlugin",
        checksum: "ab336aacafd176c949f870bfb932337fe67cdd1a99003ef7f824247fbcf12714",
        dependencies: [
            "SwiftCompilerPluginMessageHandling_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftDiagnostics",
        checksum: "745b0c8572f39d396bc6a75d5037c8f57efcd1608ffe4c3114bf6b9b9784bff7",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftIDEUtils",
        checksum: "04db996441f4d85239513fafd26c7bc13136e654b893cf9f2a172616ca3a22b4",
        dependencies: [
            "SwiftSyntax_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftOperators",
        checksum: "38fef8bf352d762623da234ded800678ff32c3e5340c5b7feb1094acbb8b0b28",
        dependencies: [
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftParser",
        checksum: "888499f5a919314705ad817fedf23353e451b3847c2a968761fd3fffc1e3ba60",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftParserDiagnostics",
        checksum: "093db5171021ddaf16194989fede7a234c292cdca86a48a16d0544c766ba471a",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftRefactor",
        checksum: "adb8935e048b602363196cdbd253483e371b3bd17096c0b73f12f7d8b26e27d0",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntax",
        checksum: "5e78636b09883b90f89fda1c63d00bfe871728e7dc94433b03a8b888bb46eeb7",
        dependencies: [
            "_SwiftSyntaxCShims_Aggregation",
            "SwiftSyntax509_Aggregation",
            "SwiftSyntax510_Aggregation",
            "SwiftSyntax600_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxBuilder",
        checksum: "c8bdc1d2e0e261611494ba7a93cebf927033519781d87034050b830668b96e42",
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
        checksum: "6a8bae0fc9a61fa8086a7e00f465b89164f00100e7608d64e740dc4eedcca94a",
        dependencies: [
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxMacroExpansion",
        checksum: "f8158a8687a6c824bed25be1728c9737fdbccd655ba406b5bee76fff9d76adbe",
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
        checksum: "b7d33a89e1eba98d1b41b190358a6dc2a04b579694344d986af02e0069e4d263",
        dependencies: [
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxMacroExpansion_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
            "SwiftSyntaxMacrosGenericTestSupport_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxMacrosGenericTestSupport",
        checksum: "41a824cfb349d7591c24bbcbfeac52429e9ea423bc367e9adfb944835a2e94b4",
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
        checksum: "7c557bdaa2ccd46e8a747c255c00d71b60bfd2766d26d39ce670588eaf3ce271",
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
        checksum: "d94b93a7572e47670f28674cc409c7dd1243221c9b008275dff692d7c919b756",
        dependencies: [
            "SwiftSyntaxMacros_Aggregation",
            "SwiftCompilerPluginMessageHandling_Aggregation",
            "_SwiftLibraryPluginProviderCShims_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "_SwiftSyntaxGenericTestSupport",
        checksum: "be2030f0f155f593025c55112f0ca5494973687b3bd3bd11744d6b9934f066f1"
    ),
    prebuiltTarget(
        name: "_SwiftSyntaxCShims",
        checksum: "dd049af1e34cfb8270a96a7da9be2c8b5568e53399dc07d881dc8fc9da253b69"
    ),
    prebuiltTarget(
        name: "_SwiftLibraryPluginProviderCShims",
        checksum: "d1d45c5236f0f8536507df212a2bc90a16bcfb8c40c4d7a2e0d1c5a123ed4ede"
    ),
    prebuiltTarget(
        name: "SwiftSyntax600",
        checksum: "bfd085f20ef2fea84db4b20b21653d67a1dcdf27b628924abd40a935acfe5989"
    ),
    prebuiltTarget(
        name: "SwiftSyntax510",
        checksum: "76d1e6e1d26854c623cdeffc2c89be615be0cb04e08ce098bec708214e57c8d7"
    ),
    prebuiltTarget(
        name: "SwiftSyntax509",
        checksum: "530026213a8a850b802a07d79086c39db694afba8e5f798b11ecbe535f8c6856"
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