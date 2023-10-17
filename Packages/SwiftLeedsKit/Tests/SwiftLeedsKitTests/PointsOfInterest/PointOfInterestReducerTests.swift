@testable import SwiftLeedsKit
import XCTest

final class PointOfInterestReducerTests: XCTestCase {

    var state: PointOfInterestState!

    override func setUp() {
        super.setUp()
        state = PointOfInterestState()
    }

    override func tearDown() {
        state = nil
        super.tearDown()
    }

    func testSetVenueSetsVenue() {
        let venue = Venue(
            id: UUID(),
            name: "Playhouse",
            latitude: 0.111,
            longitude: 0.222
        )

        XCTAssertNil(state.venue)

        let action = PointOfInterestAction.setVenue(venue)
        let newState = pointOfInterestReducer(state: state, action: action)

        XCTAssertEqual(newState.venue, venue)
    }

    func testSetPointsOfInterestSetsPointsOfInterest() throws {
        let pointsOfInterest = [
            PointsOfInterestGroup(
                id: UUID(),
                name: "Group 1",
                symbolName: "symbol.1",
                pointsOfInterest: [
                    PointOfInterest(
                        id: UUID(),
                        name: "PoI 1",
                        categoryName: "Group 1",
                        categorySymbolName: "symbol.1",
                        url: try XCTUnwrap(URL(string: "https://domain.com/image1")),
                        latitude: 0.1,
                        longitude: -0.1
                    )
                ]
            ),
            PointsOfInterestGroup(
                id: UUID(),
                name: "Group 2",
                symbolName: "symbol.2",
                pointsOfInterest: [
                    PointOfInterest(
                        id: UUID(),
                        name: "PoI 2",
                        categoryName: "Group 2",
                        categorySymbolName: "symbol.2",
                        url: try XCTUnwrap(URL(string: "https://domain.com/image2")),
                        latitude: 0.2,
                        longitude: -0.2
                    ),
                    PointOfInterest(
                        id: UUID(),
                        name: "PoI 3",
                        categoryName: "Group 3",
                        categorySymbolName: "symbol.3",
                        url: try XCTUnwrap(URL(string: "https://domain.com/image3")),
                        latitude: 0.3,
                        longitude: -0.3
                    )
                ]
            )
        ]

        XCTAssertTrue(state.all.isEmpty)

        let action = PointOfInterestAction.setPointsOfInterest(pointsOfInterest)
        let newState = pointOfInterestReducer(state: state, action: action)

        XCTAssertEqual(newState.all, pointsOfInterest)
    }

}
