import SwiftLeedsDomain
@testable import SwiftLeedsKit
import XCTest

final class PointOfInterestInterceptorTests: XCTestCase {

    var state: PointOfInterestState!
    var dependencies: PointOfInterestMockDependencies!

    override func setUp() {
        super.setUp()
        state = PointOfInterestState()
        dependencies = PointOfInterestMockDependencies()
    }

    override func tearDown() {
        dependencies = nil
        state = nil
        super.tearDown()
    }

    func testFetchVenue() async throws {
        let veunue = SwiftLeedsDomain.PointOfInterest(
            id: try XCTUnwrap(UUID(uuidString: "D5B5B6C9-D1BF-4B33-B77D-29C5C1DDB560")),
            name: "Venue",
            url: try XCTUnwrap(URL(string: "https://domain.com/poi")),
            latitude: 0.1,
            longitude: -0.1
        )
        dependencies.fetchVenue.venue = .success(veunue)

        let expectedVenue = SwiftLeedsKit.Venue(
            id: try XCTUnwrap(UUID(uuidString: "D5B5B6C9-D1BF-4B33-B77D-29C5C1DDB560")),
            name: "Venue",
            latitude: 0.1,
            longitude: -0.1
        )

        let action = PointOfInterestAction.fetchVenue
        let expectedNewAction = PointOfInterestAction.setVenue(expectedVenue)

        let newAction = await pointOfInterestInterceptor(state: state, action: action, dependencies: dependencies)

        XCTAssertEqual(newAction, expectedNewAction)
    }

}
