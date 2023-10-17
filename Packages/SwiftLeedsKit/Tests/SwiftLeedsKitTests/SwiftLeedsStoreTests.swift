@testable import SwiftLeedsKit
import XCTest

final class SwiftLeedsStoreTests: XCTestCase {

    func testInitialStateOfStore() {
        let store = SwiftLeedsStore()

        XCTAssertEqual(store.conferences, ConferenceState())
        XCTAssertEqual(store.pointsOfInterest, PointOfInterestState())
        XCTAssertEqual(store.sponsors, SponsorState())
    }

}
