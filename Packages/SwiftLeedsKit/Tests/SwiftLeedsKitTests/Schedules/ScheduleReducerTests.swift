@testable import SwiftLeedsKit
import XCTest

final class ScheduleReducerTests: XCTestCase {

    var state: ScheduleState!

    override func setUp() {
        super.setUp()
        state = ScheduleState()
    }

    override func tearDown() {
        state = nil
        super.tearDown()
    }

    func testSetScheduleForConferenceSetsSchedule() {
        let conferenceID = UUID()
        let schedule = Schedule(conferenceID: UUID(), timeSlots: [])

        XCTAssertTrue(state.schedules.isEmpty)

        let action = ScheduleAction.setSchedule(schedule, conferenceID: conferenceID)
        let newState = scheduleReducer(state: state, action: action)

        XCTAssertEqual(newState.schedules[conferenceID], schedule)
    }

    func testSetSpeakersSetsSpeakers() throws {
        let conferenceID = UUID()
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

        let action = ScheduleAction.setSpeakers(speakers, conferenceID: conferenceID)
        let newState = scheduleReducer(state: state, action: action)

        XCTAssertEqual(newState.speakers[conferenceID], speakers)
    }

}
