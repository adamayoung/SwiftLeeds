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

    func testSetCurrentScheduleSetsSchedule() {
        let schedule = Schedule(conferenceID: UUID(), timeSlots: [])

        XCTAssertNil(state.schedule)

        let action = ConferenceAction.setCurrentSchedule(schedule)
        let newState = conferenceReducer(state: state, action: action)

        XCTAssertEqual(newState.schedule, schedule)
    }

    func testSetSpeakersSetsSpeakers() throws {
        let speakers = [
            Speaker(
                id: UUID(),
                name: "Speaer 1",
                biography: "Bio 1",
                profileImageURL: try XCTUnwrap(URL(string: "https://domain.com/image1")),
                twitterHandle: "twitter1"
            ),
            Speaker(
                id: UUID(),
                name: "Speaer 2",
                biography: "Bio 2",
                profileImageURL: try XCTUnwrap(URL(string: "https://domain.com/image2")),
                twitterHandle: "twitter2"
            )
        ]

        XCTAssertTrue(state.speakers.isEmpty)

        let action = ConferenceAction.setSpeakers(speakers)
        let newState = conferenceReducer(state: state, action: action)

        XCTAssertEqual(newState.speakers, speakers)
    }

}
