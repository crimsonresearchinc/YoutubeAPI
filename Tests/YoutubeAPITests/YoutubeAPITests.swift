import XCTest
@testable import YoutubeAPI

final class YoutubeAPITests: XCTestCase {
    func testBool() throws {
        let stringValue = String(true)
        XCTAssertEqual(stringValue, "true")
    }
}
