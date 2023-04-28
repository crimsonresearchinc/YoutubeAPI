import XCTest
@testable import YoutubeAPI
import WebServiceURLMock
import YoutubeModel

final class YoutubeAPITests: XCTestCase {
    func testBool() throws {
        let stringValue = String(true)
        XCTAssertEqual(stringValue, "true")
    }
}
