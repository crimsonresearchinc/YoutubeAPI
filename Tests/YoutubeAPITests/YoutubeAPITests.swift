import XCTest
@testable import YoutubeAPI
import WebServiceURLMock

final class YoutubeAPITests: XCTestCase {
    func testBool() throws {
        let stringValue = String(true)
        XCTAssertEqual(stringValue, "true")
    }
}
