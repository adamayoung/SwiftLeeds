@testable import SwiftLeedsKit
import XCTest

final class SponsorReducerTests: XCTestCase {

    var state: SponsorState!

    override func setUp() {
        super.setUp()
        state = SponsorState()
    }

    override func tearDown() {
        state = nil
        super.tearDown()
    }

    func testSetSponsorsSetsSponsors() throws {
        let sponsor1 = Sponsor(
            id: UUID(),
            name: "Sponsor 1",
            subtitle: "Subtitle 1",
            url: try XCTUnwrap(URL(string: "https://domain.com/sponsor1")),
            sponsorLevel: .platinum,
            imageURL: try XCTUnwrap(URL(string: "https://domain.com/sponsor/image1")),
            jobs: []
        )

        let sponsor2 = Sponsor(
            id: UUID(),
            name: "Sponsor 2",
            subtitle: "Subtitle 2",
            url: try XCTUnwrap(URL(string: "https://domain.com/sponsor2")),
            sponsorLevel: .silver,
            imageURL: try XCTUnwrap(URL(string: "https://domain.com/sponsor/image2")),
            jobs: []
        )

        let sponsors = [sponsor1, sponsor2]
        let groupedSponsors: [SponsorLevel: [Sponsor]] = [
            .platinum: [sponsor1],
            .silver: [sponsor2]
        ]

        XCTAssertTrue(state.sponsors.isEmpty)

        let action = SponsorAction.setSponsors(sponsors)
        let newState = sponsorReducer(state: state, action: action)

        XCTAssertEqual(newState.sponsors, groupedSponsors)
    }

}
