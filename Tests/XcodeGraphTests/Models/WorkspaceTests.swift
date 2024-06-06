import Foundation
import XCTest
import Path

@testable import XcodeGraph

final class WorkspaceTests: XCTestCase {
    func test_codable() {
        // Given
        let subject = Workspace.test(
            path: try! AbsolutePath(validating: "/path/to/workspace"),
            name: "name"
        )

        // Then
        XCTAssertCodable(subject)
    }
}
