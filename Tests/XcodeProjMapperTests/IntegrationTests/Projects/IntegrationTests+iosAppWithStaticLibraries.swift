import Foundation
import InlineSnapshotTesting
import Path
import Testing
import XcodeGraph
import XcodeProj
import XcodeProjMapper

extension IntegrationTests {
    @Test("Maps an iOS app with transitive static libraries into the correct graph")
    func iosAppWithStaticLibraries() throws {
        try assertGraph {
            .iosAppWithStaticLibraries
        } name: {
            """
            - "iOSAppWithTransistiveStaticLibraries"

            """
        } dependencies: {
            """
            ▿ 4 key/value pairs
              ▿ (2 elements)
                ▿ key: target 'ATests'
                  ▿ target: (3 elements)
                    - name: "ATests"
                    - path: /Fixtures/ios_app_with_static_libraries/Modules/A
                    - status: LinkingStatus.required
                ▿ value: 2 members
                  ▿ library 'libC.a'
                    ▿ library: (5 elements)
                      - path: /Fixtures/ios_app_with_static_libraries/Modules/C/prebuilt/C/libC.a
                      - publicHeaders: /Fixtures/ios_app_with_static_libraries/Modules/C/prebuilt/C
                      - linking: BinaryLinking.static
                      - architectures: 0 elements
                      - swiftModuleMap: Optional<AbsolutePath>.none
                  ▿ target 'A'
                    ▿ target: (3 elements)
                      - name: "A"
                      - path: /Fixtures/ios_app_with_static_libraries/Modules/A
                      - status: LinkingStatus.required
              ▿ (2 elements)
                ▿ key: target 'App'
                  ▿ target: (3 elements)
                    - name: "App"
                    - path: /Fixtures/ios_app_with_static_libraries
                    - status: LinkingStatus.required
                ▿ value: 1 member
                  ▿ library 'libC.a'
                    ▿ library: (5 elements)
                      - path: /Fixtures/ios_app_with_static_libraries/Modules/C/prebuilt/C/libC.a
                      - publicHeaders: /Fixtures/ios_app_with_static_libraries/Modules/C/prebuilt/C
                      - linking: BinaryLinking.static
                      - architectures: 0 elements
                      - swiftModuleMap: Optional<AbsolutePath>.none
              ▿ (2 elements)
                ▿ key: target 'AppTests'
                  ▿ target: (3 elements)
                    - name: "AppTests"
                    - path: /Fixtures/ios_app_with_static_libraries
                    - status: LinkingStatus.required
                ▿ value: 1 member
                  ▿ target 'App'
                    ▿ target: (3 elements)
                      - name: "App"
                      - path: /Fixtures/ios_app_with_static_libraries
                      - status: LinkingStatus.required
              ▿ (2 elements)
                ▿ key: target 'BTests'
                  ▿ target: (3 elements)
                    - name: "BTests"
                    - path: /Fixtures/ios_app_with_static_libraries/Modules/B
                    - status: LinkingStatus.required
                ▿ value: 1 member
                  ▿ target 'B'
                    ▿ target: (3 elements)
                      - name: "B"
                      - path: /Fixtures/ios_app_with_static_libraries/Modules/B
                      - status: LinkingStatus.required

            """
        } dependencyConditions: {
            """
            - 0 key/value pairs

            """
        } packages: {
            """
            - 0 key/value pairs

            """
        } workspace: {
            """
            ▿ Workspace
              - additionalFiles: 0 elements
              ▿ generationOptions: GenerationOptions
                ▿ autogeneratedWorkspaceSchemes: AutogeneratedWorkspaceSchemes
                  ▿ enabled: (5 elements)
                    - codeCoverageMode: CodeCoverageMode.disabled
                    ▿ testingOptions: TestingOptions
                      - rawValue: 0
                    - testLanguage: Optional<String>.none
                    - testRegion: Optional<String>.none
                    - testScreenCaptureFormat: Optional<ScreenCaptureFormat>.none
                ▿ enableAutomaticXcodeSchemes: Optional<Bool>
                  - some: false
                - lastXcodeUpgradeCheck: Optional<Version>.none
                - renderMarkdownReadme: false
              - ideTemplateMacros: Optional<IDETemplateMacros>.none
              - name: "iOSAppWithTransistiveStaticLibraries"
              - path: /Fixtures/ios_app_with_static_libraries
              ▿ projects: 3 elements
                - /Fixtures/ios_app_with_static_libraries/iOSAppWithTransistiveStaticLibraries.xcodeproj
                - /Fixtures/ios_app_with_static_libraries/Modules/A/A.xcodeproj
                - /Fixtures/ios_app_with_static_libraries/Modules/B/B.xcodeproj
              - schemes: 0 elements
              - xcWorkspacePath: /Fixtures/ios_app_with_static_libraries/iOSAppWithTransistiveStaticLibraries.xcworkspace

            """
        } projects: {
            """
            ▿ 3 key/value pairs
              ▿ (2 elements)
                - key: /Fixtures/ios_app_with_static_libraries/Modules/A/A.xcodeproj
                ▿ value: A
                  - path: /Fixtures/ios_app_with_static_libraries/Modules/A
                  - sourceRootPath: /Fixtures/ios_app_with_static_libraries/Modules/A
                  - xcodeProjPath: /Fixtures/ios_app_with_static_libraries/Modules/A
                  - name: "A"
                  - organizationName: Optional<String>.none
                  - classPrefix: Optional<String>.none
                  ▿ defaultKnownRegions: Optional<Array<String>>
                    ▿ some: 2 elements
                      - "Base"
                      - "en"
                  ▿ developmentRegion: Optional<String>
                    - some: "en"
                  ▿ options: Options
                    - automaticSchemesOptions: AutomaticSchemesOptions.disabled
                    - disableBundleAccessors: false
                    - disableShowEnvironmentVarsInScriptPhases: false
                    - disableSynthesizedResourceAccessors: false
                    ▿ textSettings: TextSettings
                      - indentWidth: Optional<UInt>.none
                      - tabWidth: Optional<UInt>.none
                      - usesTabs: Optional<Bool>.none
                      - wrapsLines: Optional<Bool>.none
                  ▿ targets: 2 key/value pairs
                    ▿ (2 elements)
                      - key: "A"
                      ▿ value: Target
                        ▿ additionalFiles: 2 elements
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Modules/A/Tests/ATests.swift
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Modules/C/prebuilt/C/libC.a
                        - buildRules: 0 elements
                        - bundleId: "io.tuist.A"
                        ▿ copyFiles: 2 elements
                          ▿ CopyFilesAction
                            - destination: Destination.productsDirectory
                            - files: 0 elements
                            - name: "Dependencies"
                            - subpath: Optional<String>.none
                          ▿ CopyFilesAction
                            - destination: Destination.frameworks
                            - files: 0 elements
                            - name: "Embed Frameworks"
                            - subpath: Optional<String>.none
                        - coreDataModels: 0 elements
                        - dependencies: 0 elements
                        ▿ deploymentTargets: DeploymentTargets
                          - iOS: Optional<String>.none
                          - macOS: Optional<String>.none
                          - tvOS: Optional<String>.none
                          - visionOS: Optional<String>.none
                          - watchOS: Optional<String>.none
                        - destinations: 0 members
                        - entitlements: Optional<Entitlements>.none
                        - environmentVariables: 0 key/value pairs
                        ▿ filesGroup: ProjectGroup
                          ▿ group: (1 element)
                            - name: "MainGroup"
                        - headers: Optional<Headers>.none
                        - infoPlist: Optional<InfoPlist>.none
                        - launchArguments: 0 elements
                        - mergeable: false
                        - mergedBinaryType: MergedBinaryType.disabled
                        ▿ metadata: TargetMetadata
                          - tags: 0 members
                        - name: "A"
                        - onDemandResourcesTags: Optional<OnDemandResourcesTags>.none
                        - playgrounds: 0 elements
                        - product: static library
                        - productName: "A"
                        - prune: false
                        - rawScriptBuildPhases: 0 elements
                        ▿ resources: ResourceFileElements
                          - privacyManifest: Optional<PrivacyManifest>.none
                          - resources: 0 elements
                        - scripts: 0 elements
                        - settings: Optional<Settings>.none
                        ▿ sources: 1 element
                          ▿ SourceFile
                            - codeGen: Optional<FileCodeGen>.none
                            - compilationCondition: Optional<PlatformCondition>.none
                            - compilerFlags: Optional<String>.none
                            - contentHash: Optional<String>.none
                            - path: /Fixtures/ios_app_with_static_libraries/Modules/A/Sources/A.swift
                        - type: TargetType.local
                    ▿ (2 elements)
                      - key: "ATests"
                      ▿ value: Target
                        ▿ additionalFiles: 1 element
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Modules/A/Sources/A.swift
                        - buildRules: 0 elements
                        - bundleId: "io.tuist.ATests"
                        ▿ copyFiles: 1 element
                          ▿ CopyFilesAction
                            - destination: Destination.frameworks
                            - files: 0 elements
                            - name: "Embed Frameworks"
                            - subpath: Optional<String>.none
                        - coreDataModels: 0 elements
                        ▿ dependencies: 2 elements
                          ▿ TargetDependency
                            ▿ target: (3 elements)
                              - name: "A"
                              - status: LinkingStatus.required
                              - condition: Optional<PlatformCondition>.none
                          ▿ TargetDependency
                            ▿ library: (4 elements)
                              - path: /Fixtures/ios_app_with_static_libraries/Modules/C/prebuilt/C/libC.a
                              - publicHeaders: /Fixtures/ios_app_with_static_libraries/Modules/C/prebuilt/C
                              - swiftModuleMap: Optional<AbsolutePath>.none
                              - condition: Optional<PlatformCondition>.none
                        ▿ deploymentTargets: DeploymentTargets
                          - iOS: Optional<String>.none
                          - macOS: Optional<String>.none
                          - tvOS: Optional<String>.none
                          - visionOS: Optional<String>.none
                          - watchOS: Optional<String>.none
                        - destinations: 0 members
                        - entitlements: Optional<Entitlements>.none
                        - environmentVariables: 0 key/value pairs
                        ▿ filesGroup: ProjectGroup
                          ▿ group: (1 element)
                            - name: "MainGroup"
                        - headers: Optional<Headers>.none
                        - infoPlist: Optional<InfoPlist>.none
                        - launchArguments: 0 elements
                        - mergeable: false
                        - mergedBinaryType: MergedBinaryType.disabled
                        ▿ metadata: TargetMetadata
                          - tags: 0 members
                        - name: "ATests"
                        - onDemandResourcesTags: Optional<OnDemandResourcesTags>.none
                        - playgrounds: 0 elements
                        - product: unit tests
                        - productName: "ATests"
                        - prune: false
                        - rawScriptBuildPhases: 0 elements
                        ▿ resources: ResourceFileElements
                          - privacyManifest: Optional<PrivacyManifest>.none
                          - resources: 0 elements
                        - scripts: 0 elements
                        - settings: Optional<Settings>.none
                        ▿ sources: 1 element
                          ▿ SourceFile
                            - codeGen: Optional<FileCodeGen>.none
                            - compilationCondition: Optional<PlatformCondition>.none
                            - compilerFlags: Optional<String>.none
                            - contentHash: Optional<String>.none
                            - path: /Fixtures/ios_app_with_static_libraries/Modules/A/Tests/ATests.swift
                        - type: TargetType.local
                  - packages: 0 elements
                  - schemes: 0 elements
                  ▿ settings: Settings
                    - base: 0 key/value pairs
                    - baseDebug: 0 key/value pairs
                    - configurations: 0 key/value pairs
                    ▿ defaultSettings: DefaultSettings
                      ▿ recommended: (1 element)
                        - excluding: 0 members
                  ▿ filesGroup: ProjectGroup
                    ▿ group: (1 element)
                      - name: "Project"
                  - additionalFiles: 0 elements
                  - ideTemplateMacros: Optional<IDETemplateMacros>.none
                  - resourceSynthesizers: 0 elements
                  - lastUpgradeCheck: Optional<Version>.none
                  - type: local project
              ▿ (2 elements)
                - key: /Fixtures/ios_app_with_static_libraries/Modules/B/B.xcodeproj
                ▿ value: B
                  - path: /Fixtures/ios_app_with_static_libraries/Modules/B
                  - sourceRootPath: /Fixtures/ios_app_with_static_libraries/Modules/B
                  - xcodeProjPath: /Fixtures/ios_app_with_static_libraries/Modules/B
                  - name: "B"
                  - organizationName: Optional<String>.none
                  - classPrefix: Optional<String>.none
                  ▿ defaultKnownRegions: Optional<Array<String>>
                    ▿ some: 2 elements
                      - "Base"
                      - "en"
                  ▿ developmentRegion: Optional<String>
                    - some: "en"
                  ▿ options: Options
                    - automaticSchemesOptions: AutomaticSchemesOptions.disabled
                    - disableBundleAccessors: false
                    - disableShowEnvironmentVarsInScriptPhases: false
                    - disableSynthesizedResourceAccessors: false
                    ▿ textSettings: TextSettings
                      - indentWidth: Optional<UInt>.none
                      - tabWidth: Optional<UInt>.none
                      - usesTabs: Optional<Bool>.none
                      - wrapsLines: Optional<Bool>.none
                  ▿ targets: 2 key/value pairs
                    ▿ (2 elements)
                      - key: "B"
                      ▿ value: Target
                        ▿ additionalFiles: 3 elements
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Modules/B/Info.plist
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Modules/B/Tests.plist
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Modules/B/Tests/BTests.swift
                        - buildRules: 0 elements
                        - bundleId: "io.tuist.B"
                        ▿ copyFiles: 1 element
                          ▿ CopyFilesAction
                            - destination: Destination.frameworks
                            - files: 0 elements
                            - name: "Embed Frameworks"
                            - subpath: Optional<String>.none
                        - coreDataModels: 0 elements
                        - dependencies: 0 elements
                        ▿ deploymentTargets: DeploymentTargets
                          - iOS: Optional<String>.none
                          - macOS: Optional<String>.none
                          - tvOS: Optional<String>.none
                          - visionOS: Optional<String>.none
                          - watchOS: Optional<String>.none
                        - destinations: 0 members
                        - entitlements: Optional<Entitlements>.none
                        - environmentVariables: 0 key/value pairs
                        ▿ filesGroup: ProjectGroup
                          ▿ group: (1 element)
                            - name: "MainGroup"
                        - headers: Optional<Headers>.none
                        - infoPlist: Optional<InfoPlist>.none
                        - launchArguments: 0 elements
                        - mergeable: false
                        - mergedBinaryType: MergedBinaryType.disabled
                        ▿ metadata: TargetMetadata
                          - tags: 0 members
                        - name: "B"
                        - onDemandResourcesTags: Optional<OnDemandResourcesTags>.none
                        - playgrounds: 0 elements
                        - product: static library
                        - productName: "B"
                        - prune: false
                        - rawScriptBuildPhases: 0 elements
                        ▿ resources: ResourceFileElements
                          - privacyManifest: Optional<PrivacyManifest>.none
                          - resources: 0 elements
                        - scripts: 0 elements
                        - settings: Optional<Settings>.none
                        ▿ sources: 1 element
                          ▿ SourceFile
                            - codeGen: Optional<FileCodeGen>.none
                            - compilationCondition: Optional<PlatformCondition>.none
                            - compilerFlags: Optional<String>.none
                            - contentHash: Optional<String>.none
                            - path: /Fixtures/ios_app_with_static_libraries/Modules/B/Sources/B.swift
                        - type: TargetType.local
                    ▿ (2 elements)
                      - key: "BTests"
                      ▿ value: Target
                        ▿ additionalFiles: 3 elements
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Modules/B/Info.plist
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Modules/B/Sources/B.swift
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Modules/B/Tests.plist
                        - buildRules: 0 elements
                        - bundleId: "io.tuist.BTests"
                        ▿ copyFiles: 1 element
                          ▿ CopyFilesAction
                            - destination: Destination.frameworks
                            - files: 0 elements
                            - name: "Embed Frameworks"
                            - subpath: Optional<String>.none
                        - coreDataModels: 0 elements
                        ▿ dependencies: 1 element
                          ▿ TargetDependency
                            ▿ target: (3 elements)
                              - name: "B"
                              - status: LinkingStatus.required
                              - condition: Optional<PlatformCondition>.none
                        ▿ deploymentTargets: DeploymentTargets
                          - iOS: Optional<String>.none
                          - macOS: Optional<String>.none
                          - tvOS: Optional<String>.none
                          - visionOS: Optional<String>.none
                          - watchOS: Optional<String>.none
                        - destinations: 0 members
                        - entitlements: Optional<Entitlements>.none
                        - environmentVariables: 0 key/value pairs
                        ▿ filesGroup: ProjectGroup
                          ▿ group: (1 element)
                            - name: "MainGroup"
                        - headers: Optional<Headers>.none
                        - infoPlist: Optional<InfoPlist>.none
                        - launchArguments: 0 elements
                        - mergeable: false
                        - mergedBinaryType: MergedBinaryType.disabled
                        ▿ metadata: TargetMetadata
                          - tags: 0 members
                        - name: "BTests"
                        - onDemandResourcesTags: Optional<OnDemandResourcesTags>.none
                        - playgrounds: 0 elements
                        - product: unit tests
                        - productName: "BTests"
                        - prune: false
                        - rawScriptBuildPhases: 0 elements
                        ▿ resources: ResourceFileElements
                          - privacyManifest: Optional<PrivacyManifest>.none
                          - resources: 0 elements
                        - scripts: 0 elements
                        - settings: Optional<Settings>.none
                        ▿ sources: 1 element
                          ▿ SourceFile
                            - codeGen: Optional<FileCodeGen>.none
                            - compilationCondition: Optional<PlatformCondition>.none
                            - compilerFlags: Optional<String>.none
                            - contentHash: Optional<String>.none
                            - path: /Fixtures/ios_app_with_static_libraries/Modules/B/Tests/BTests.swift
                        - type: TargetType.local
                  - packages: 0 elements
                  - schemes: 0 elements
                  ▿ settings: Settings
                    - base: 0 key/value pairs
                    - baseDebug: 0 key/value pairs
                    - configurations: 0 key/value pairs
                    ▿ defaultSettings: DefaultSettings
                      ▿ recommended: (1 element)
                        - excluding: 0 members
                  ▿ filesGroup: ProjectGroup
                    ▿ group: (1 element)
                      - name: "Project"
                  - additionalFiles: 0 elements
                  - ideTemplateMacros: Optional<IDETemplateMacros>.none
                  - resourceSynthesizers: 0 elements
                  - lastUpgradeCheck: Optional<Version>.none
                  - type: local project
              ▿ (2 elements)
                - key: /Fixtures/ios_app_with_static_libraries/iOSAppWithTransistiveStaticLibraries.xcodeproj
                ▿ value: iOSAppWithTransistiveStaticLibraries
                  - path: /Fixtures/ios_app_with_static_libraries
                  - sourceRootPath: /Fixtures/ios_app_with_static_libraries
                  - xcodeProjPath: /Fixtures/ios_app_with_static_libraries
                  - name: "iOSAppWithTransistiveStaticLibraries"
                  - organizationName: Optional<String>.none
                  - classPrefix: Optional<String>.none
                  ▿ defaultKnownRegions: Optional<Array<String>>
                    ▿ some: 2 elements
                      - "Base"
                      - "en"
                  ▿ developmentRegion: Optional<String>
                    - some: "en"
                  ▿ options: Options
                    - automaticSchemesOptions: AutomaticSchemesOptions.disabled
                    - disableBundleAccessors: false
                    - disableShowEnvironmentVarsInScriptPhases: false
                    - disableSynthesizedResourceAccessors: false
                    ▿ textSettings: TextSettings
                      - indentWidth: Optional<UInt>.none
                      - tabWidth: Optional<UInt>.none
                      - usesTabs: Optional<Bool>.none
                      - wrapsLines: Optional<Bool>.none
                  ▿ targets: 2 key/value pairs
                    ▿ (2 elements)
                      - key: "App"
                      ▿ value: Target
                        ▿ additionalFiles: 3 elements
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Info.plist
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Tests.plist
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Tests/AppTests.swift
                        - buildRules: 0 elements
                        - bundleId: "io.tuist.App"
                        ▿ copyFiles: 1 element
                          ▿ CopyFilesAction
                            - destination: Destination.frameworks
                            - files: 0 elements
                            - name: "Embed Frameworks"
                            - subpath: Optional<String>.none
                        - coreDataModels: 0 elements
                        ▿ dependencies: 1 element
                          ▿ TargetDependency
                            ▿ library: (4 elements)
                              - path: /Fixtures/ios_app_with_static_libraries/Modules/C/prebuilt/C/libC.a
                              - publicHeaders: /Fixtures/ios_app_with_static_libraries/Modules/C/prebuilt/C
                              - swiftModuleMap: Optional<AbsolutePath>.none
                              - condition: Optional<PlatformCondition>.none
                        ▿ deploymentTargets: DeploymentTargets
                          - iOS: Optional<String>.none
                          - macOS: Optional<String>.none
                          - tvOS: Optional<String>.none
                          - visionOS: Optional<String>.none
                          - watchOS: Optional<String>.none
                        - destinations: 0 members
                        - entitlements: Optional<Entitlements>.none
                        - environmentVariables: 0 key/value pairs
                        ▿ filesGroup: ProjectGroup
                          ▿ group: (1 element)
                            - name: "MainGroup"
                        - headers: Optional<Headers>.none
                        - infoPlist: Optional<InfoPlist>.none
                        - launchArguments: 0 elements
                        - mergeable: false
                        - mergedBinaryType: MergedBinaryType.disabled
                        ▿ metadata: TargetMetadata
                          - tags: 0 members
                        - name: "App"
                        - onDemandResourcesTags: Optional<OnDemandResourcesTags>.none
                        - playgrounds: 0 elements
                        - product: application
                        - productName: "App"
                        - prune: false
                        - rawScriptBuildPhases: 0 elements
                        ▿ resources: ResourceFileElements
                          - privacyManifest: Optional<PrivacyManifest>.none
                          - resources: 0 elements
                        - scripts: 0 elements
                        - settings: Optional<Settings>.none
                        ▿ sources: 1 element
                          ▿ SourceFile
                            - codeGen: Optional<FileCodeGen>.none
                            - compilationCondition: Optional<PlatformCondition>.none
                            - compilerFlags: Optional<String>.none
                            - contentHash: Optional<String>.none
                            - path: /Fixtures/ios_app_with_static_libraries/Sources/AppDelegate.swift
                        - type: TargetType.local
                    ▿ (2 elements)
                      - key: "AppTests"
                      ▿ value: Target
                        ▿ additionalFiles: 4 elements
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Info.plist
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Modules/C/prebuilt/C/libC.a
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Sources/AppDelegate.swift
                          ▿ FileElement
                            ▿ file: (1 element)
                              - path: /Fixtures/ios_app_with_static_libraries/Tests.plist
                        - buildRules: 0 elements
                        - bundleId: "io.tuist.AppTests"
                        ▿ copyFiles: 1 element
                          ▿ CopyFilesAction
                            - destination: Destination.frameworks
                            - files: 0 elements
                            - name: "Embed Frameworks"
                            - subpath: Optional<String>.none
                        - coreDataModels: 0 elements
                        ▿ dependencies: 1 element
                          ▿ TargetDependency
                            ▿ target: (3 elements)
                              - name: "App"
                              - status: LinkingStatus.required
                              - condition: Optional<PlatformCondition>.none
                        ▿ deploymentTargets: DeploymentTargets
                          - iOS: Optional<String>.none
                          - macOS: Optional<String>.none
                          - tvOS: Optional<String>.none
                          - visionOS: Optional<String>.none
                          - watchOS: Optional<String>.none
                        - destinations: 0 members
                        - entitlements: Optional<Entitlements>.none
                        - environmentVariables: 0 key/value pairs
                        ▿ filesGroup: ProjectGroup
                          ▿ group: (1 element)
                            - name: "MainGroup"
                        - headers: Optional<Headers>.none
                        - infoPlist: Optional<InfoPlist>.none
                        - launchArguments: 0 elements
                        - mergeable: false
                        - mergedBinaryType: MergedBinaryType.disabled
                        ▿ metadata: TargetMetadata
                          - tags: 0 members
                        - name: "AppTests"
                        - onDemandResourcesTags: Optional<OnDemandResourcesTags>.none
                        - playgrounds: 0 elements
                        - product: unit tests
                        - productName: "AppTests"
                        - prune: false
                        - rawScriptBuildPhases: 0 elements
                        ▿ resources: ResourceFileElements
                          - privacyManifest: Optional<PrivacyManifest>.none
                          - resources: 0 elements
                        - scripts: 0 elements
                        - settings: Optional<Settings>.none
                        ▿ sources: 1 element
                          ▿ SourceFile
                            - codeGen: Optional<FileCodeGen>.none
                            - compilationCondition: Optional<PlatformCondition>.none
                            - compilerFlags: Optional<String>.none
                            - contentHash: Optional<String>.none
                            - path: /Fixtures/ios_app_with_static_libraries/Tests/AppTests.swift
                        - type: TargetType.local
                  - packages: 0 elements
                  - schemes: 0 elements
                  ▿ settings: Settings
                    - base: 0 key/value pairs
                    - baseDebug: 0 key/value pairs
                    - configurations: 0 key/value pairs
                    ▿ defaultSettings: DefaultSettings
                      ▿ recommended: (1 element)
                        - excluding: 0 members
                  ▿ filesGroup: ProjectGroup
                    ▿ group: (1 element)
                      - name: "Project"
                  - additionalFiles: 0 elements
                  - ideTemplateMacros: Optional<IDETemplateMacros>.none
                  - resourceSynthesizers: 0 elements
                  - lastUpgradeCheck: Optional<Version>.none
                  - type: local project

            """
        }
    }
}