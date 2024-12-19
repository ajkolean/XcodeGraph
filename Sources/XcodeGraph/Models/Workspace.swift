import Foundation
import Path

public struct Workspace: Equatable, Codable {
    // MARK: - Attributes

    /// Path to where the manifest / root directory of this workspace is located
    public var path: AbsolutePath
    /// Path to where the `.xcworkspace` will be generated
    public var xcWorkspacePath: AbsolutePath
    public var name: String
    public var projects: [AbsolutePath]
    public var schemes: [Scheme]
    public var ideTemplateMacros: IDETemplateMacros?
    public var additionalFiles: [FileElement]
    public var generationOptions: GenerationOptions

    // MARK: - Init

    public init(
        path: AbsolutePath,
        xcWorkspacePath: AbsolutePath,
        name: String,
        projects: [AbsolutePath],
        schemes: [Scheme] = [],
        generationOptions: GenerationOptions = .init(
            enableAutomaticXcodeSchemes: false,
            autogeneratedWorkspaceSchemes: .enabled(
                codeCoverageMode: .disabled,
                testingOptions: [],
                testLanguage: nil,
                testRegion: nil,
                testScreenCaptureFormat: nil
            ),
            lastXcodeUpgradeCheck: nil,
            renderMarkdownReadme: false
        ),
        ideTemplateMacros: IDETemplateMacros? = nil,
        additionalFiles: [FileElement] = []
    ) {
        self.path = path
        self.xcWorkspacePath = xcWorkspacePath
        self.name = name
        self.projects = projects
        self.schemes = schemes
        self.generationOptions = generationOptions
        self.ideTemplateMacros = ideTemplateMacros
        self.additionalFiles = additionalFiles
    }
}

extension Workspace {
    public func with(name: String) -> Workspace {
        var copy = self
        copy.name = name
        return copy
    }

    public func adding(files: [AbsolutePath]) -> Workspace {
        Workspace(
            path: path,
            xcWorkspacePath: xcWorkspacePath,
            name: name,
            projects: projects,
            schemes: schemes,
            generationOptions: generationOptions,
            ideTemplateMacros: ideTemplateMacros,
            additionalFiles: additionalFiles + files.map { .file(path: $0) }
        )
    }

    public func replacing(projects: [AbsolutePath]) -> Workspace {
        Workspace(
            path: path,
            xcWorkspacePath: xcWorkspacePath,
            name: name,
            projects: projects,
            schemes: schemes,
            generationOptions: generationOptions,
            ideTemplateMacros: ideTemplateMacros,
            additionalFiles: additionalFiles
        )
    }

    public func merging(projects otherProjects: [AbsolutePath]) -> Workspace {
        Workspace(
            path: path,
            xcWorkspacePath: xcWorkspacePath,
            name: name,
            projects: Array(Set(projects + otherProjects)),
            schemes: schemes,
            generationOptions: generationOptions,
            ideTemplateMacros: ideTemplateMacros,
            additionalFiles: additionalFiles
        )
    }

    public func codeCoverageTargets(projects: [Project]) -> [TargetReference] {
        switch codeCoverageMode {
        case .all, .disabled: return []
        case let .targets(targets): return targets
        case .relevant:
            let allSchemes = schemes + projects.flatMap(\.schemes)
            var resultTargets = Set<TargetReference>()

            allSchemes.forEach { scheme in
                // try to add code coverage targets only if code coverage is enabled
                guard let testAction = scheme.testAction, testAction.coverage else { return }

                let schemeCoverageTargets = testAction.codeCoverageTargets

                // having empty `codeCoverageTargets` means that we should gather code coverage for all build targets
                if schemeCoverageTargets.isEmpty, let buildAction = scheme.buildAction {
                    resultTargets.formUnion(buildAction.targets)
                } else {
                    resultTargets.formUnion(schemeCoverageTargets)
                }
            }

            // if we find no schemes that gather code coverage data, there are no relevant targets,
            // so we disable code coverage
            if resultTargets.isEmpty {
                return []
            }

            return Array(resultTargets)
        }
    }
}

extension Workspace {
    public var codeCoverageMode: GenerationOptions.AutogeneratedWorkspaceSchemes.CodeCoverageMode {
        switch generationOptions.autogeneratedWorkspaceSchemes {
        case let .enabled(codeCoverageMode, _, _, _, _):
            return codeCoverageMode
        case .disabled:
            return .disabled
        }
    }

    public var testingOptions: TestingOptions {
        switch generationOptions.autogeneratedWorkspaceSchemes {
        case let .enabled(_, testingOptions, _, _, _):
            return testingOptions
        case .disabled:
            return []
        }
    }
}

#if DEBUG
    extension Workspace {
        static func test(
            path: AbsolutePath = try! AbsolutePath(validating: "/"), // swiftlint:disable:this force_try
            xcWorkspacePath: AbsolutePath = try! AbsolutePath(validating: "/"), // swiftlint:disable:this force_try
            name: String = "test",
            projects: [AbsolutePath] = [],
            schemes: [Scheme] = [],
            ideTemplateMacros: IDETemplateMacros? = nil,
            additionalFiles: [FileElement] = [],
            generationOptions: GenerationOptions = .test()
        ) -> Workspace {
            Workspace(
                path: path,
                xcWorkspacePath: xcWorkspacePath,
                name: name,
                projects: projects,
                schemes: schemes,
                generationOptions: generationOptions,
                ideTemplateMacros: ideTemplateMacros,
                additionalFiles: additionalFiles
            )
        }
    }

    extension Workspace.GenerationOptions {
        static func test(
            enableAutomaticXcodeSchemes: Bool? = false,
            autogeneratedWorkspaceSchemes: AutogeneratedWorkspaceSchemes = .enabled(
                codeCoverageMode: .disabled,
                testingOptions: [],
                testLanguage: nil,
                testRegion: nil,
                testScreenCaptureFormat: nil
            ),
            lastXcodeUpgradeCheck: Version? = nil
        ) -> Self {
            .init(
                enableAutomaticXcodeSchemes: enableAutomaticXcodeSchemes,
                autogeneratedWorkspaceSchemes: autogeneratedWorkspaceSchemes,
                lastXcodeUpgradeCheck: lastXcodeUpgradeCheck,
                renderMarkdownReadme: false
            )
        }
    }
#endif
