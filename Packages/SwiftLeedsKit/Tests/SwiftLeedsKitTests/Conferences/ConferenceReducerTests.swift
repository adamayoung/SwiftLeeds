@testable import SwiftLeedsKit
import XCTest

final class ConferenceReducerTests: XCTestCase {

    var state: ConferenceState!

    override func setUp() {
        super.setUp()
        state = ConferenceState()
    }

    override func tearDown() {
        state = nil
        super.tearDown()
    }

    func testSetCurrentConferencesSetsCurrentConference() {
        let conference = Conference(
            id: UUID(),
            name: "Conference 1",
            date: Date(timeIntervalSince1970: 1000),
            location: "Leeds"
        )

        XCTAssertNil(state.current)

        let action = ConferenceAction.setCurrentConference(conference)
        let newState = conferenceReducer(state: state, action: action)

        XCTAssertEqual(newState.current, conference)
    }

}
