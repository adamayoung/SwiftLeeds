@testable import SwiftLeedsData
import XCTest

final class LocationsResponseTests: XCTestCase {

    func testDecode() throws {
        let response = try JSONDecoder().decode(LocationsResponse.self, fromResource: "locations")

        XCTAssertEqual(response.data.count, 6)
    }

}
