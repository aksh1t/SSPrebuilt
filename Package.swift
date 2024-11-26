// swift-tools-version: 5.8

import PackageDescription
import Foundation

func prebuiltTarget(
    name: String,
    xcframeworkName: String? = nil,
    checksum: String,
    dependencies: [Target.Dependency] = []
) -> [Target] {
    let url = "https://github.com/aksh1t/SSPrebuilt/releases/download/600.0.0"
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
        checksum: "b99654bbe29f4e749aac2891202f204b512552dcc85522ff631d708a41f45f5d",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftCompilerPlugin",
        checksum: "8270ca5c7c9f986393b4b2a0bd5739e845342100e480d2ab79bc010b2b503c1e",
        dependencies: [
            "SwiftCompilerPluginMessageHandling_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftDiagnostics",
        checksum: "c3bd8ace7e92a0a7267ce678815b7ed83214cb015b19e4d3cebd7a3413cd415f",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftIDEUtils",
        checksum: "a9462cc3aa17c835d9eb62784f53ce42fe33b521660123eb6f9d378559bb3dff",
        dependencies: [
            "SwiftSyntax_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftOperators",
        checksum: "8d892317275e2933988109b5c7c47795489a8caedb4aa130f026d6c6e6602848",
        dependencies: [
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftParser",
        checksum: "91b3f6cc82f0ea22d5ae3b13b8af056a7f8ec1ed0c4e43337f312f74380b466b",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftParserDiagnostics",
        checksum: "6cf6fec8f9febb12eec1d7447fb7bc20ecc6dba4002c2b3bd19192920bf1ad4f",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftRefactor",
        checksum: "6ec33b1b103b321c07909c55983ee11535c03b40c3c571694bf5d9acda128f0f",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntax",
        checksum: "cfe2d365599044042b3d9cd5ab043d2ce402c8a7240b114f6b97093cac35483c",
        dependencies: [
            "_SwiftSyntaxCShims_Aggregation",
            "SwiftSyntax509_Aggregation",
            "SwiftSyntax510_Aggregation",
            "SwiftSyntax600_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxBuilder",
        checksum: "e5de97aa6cf74434b67cabe02e5832e3426a58ba34e8d330848b9a764111d6a7",
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
        checksum: "5cccdda6e34f7bffb41e7dec6e79a3a3f6b73a4d30b3bd250cdc835fc77f46bb",
        dependencies: [
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxMacroExpansion",
        checksum: "d7669d48165a7e5ad507f1c744372f88ab591f94891cfaad86dfee5e2b4fa77e",
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
        checksum: "f3681574aad9aa98b290671f309866447555396516d3834fa50c1b944e7babe8",
        dependencies: [
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxMacroExpansion_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
            "SwiftSyntaxMacrosGenericTestSupport_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxMacrosGenericTestSupport",
        checksum: "2fba4710e04d836fc539be9e1db442eaae70958e483defc5f1875c616c596b19",
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
        checksum: "088e3ec413dd38d3544d0d992714f7fa6d26f0c4a528e20c466ee2aa64fe4b04",
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
        checksum: "d4ad74506f7199e683021041639359cf23342147f052cecc96582dc787bc0bec",
        dependencies: [
            "SwiftSyntaxMacros_Aggregation",
            "SwiftCompilerPluginMessageHandling_Aggregation",
            "_SwiftLibraryPluginProviderCShims_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "_SwiftSyntaxGenericTestSupport",
        checksum: "4aab8c83f32b2b0a7fe2cca5a24af719703b357162a919b4f43032ba41da12af"
    ),
    prebuiltTarget(
        name: "_SwiftSyntaxCShims",
        checksum: "9792c1e00fd4b1d2866c859d3ef5b34229b83a205727afe8068f578bd89eaf4a"
    ),
    prebuiltTarget(
        name: "_SwiftLibraryPluginProviderCShims",
        checksum: "201f05a24cae9f345fdce6d6df0a4a1a03cf6d29b6f2ddde8ba53d513c6365ce"
    ),
    prebuiltTarget(
        name: "SwiftSyntax600",
        checksum: "b79917be26b98e8c3e13fbecd6e0a8e5b6d4680d78c802f7fba8717702cda9ab"
    ),
    prebuiltTarget(
        name: "SwiftSyntax510",
        checksum: "a25cf77df1935a5f5cb0f75afe2bfd6c89eb3c8974d5afc180bdc16f3ee16617"
    ),
    prebuiltTarget(
        name: "SwiftSyntax509",
        checksum: "d7c71e92787d12be7b1820e8da499e6634a3816b80d90d043feeb36a855206b6"
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