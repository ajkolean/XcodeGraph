import Foundation
import Path

/// Represents errors that may occur during project or dependency mapping processes.
enum MappingError: Error, LocalizedError, Equatable {

    // MARK: - Project Mapping Errors

    /// The provided path does not exist.
    case pathNotFound(path: String)

    /// The provided project type is unknown.
    case unknownProjectType(path: String)

    /// No projects were found in the Xcode project file.
    case noProjectsFound

    /// The main files group is missing for a target.
    case missingFilesGroup(targetName: String)

    /// The merged binary type for a target is missing.
    case missingMergedBinaryType

    /// The repository URL is missing from the package reference.
    case missingRepositoryURL(packageName: String)

    /// A generic mapping error with a message.
    case generic(String)

    // MARK: - Target Mapping Errors

    /// The bundle identifier is missing from the build settings of a target.
    case missingBundleIdentifier(targetName: String)

    /// The specified target could not be found.
    case targetNotFound(targetName: String, path: AbsolutePath)

    // MARK: - Dependency Mapping Errors

    /// A required framework dependency was not found.
    case frameworkNotFound(name: String, path: AbsolutePath)

    /// An unknown dependency type was encountered.
    case unknownDependencyType(name: String)

    // MARK: - Error Descriptions

    /// A localized description of the error.
    var errorDescription: String? {
        switch self {

        // Project Mapping Cases
        case .pathNotFound(let path):
            return "The specified path does not exist: \(path)"
        case .unknownProjectType(let path):
            return "The project type for the path '\(path)' could not be determined."
        case .noProjectsFound:
            return "No Xcode projects were found."
        case .missingFilesGroup(let targetName):
            return "The files group is missing for the target '\(targetName)'."
        case .missingMergedBinaryType:
            return "The merged binary type is missing for the target."
        case .missingRepositoryURL(let packageName):
            return "The repository URL is missing for the package '\(packageName)'."
        case .generic(let message):
            return message

        // Target Mapping Cases
        case .missingBundleIdentifier(let targetName):
            return "The bundle identifier is missing for the target '\(targetName)'."
        case .targetNotFound(let targetName, let path):
            return "The target '\(targetName)' could not be found in the project at path: \(path.pathString)."

        // Dependency Mapping Cases
        case .frameworkNotFound(let name, let path):
            return "The required framework '\(name)' was not found at path: \(path.pathString)."
        case .unknownDependencyType(let name):
            return "An unknown dependency type '\(name)' was encountered."
        }
    }
}