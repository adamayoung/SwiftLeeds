import SwiftLeedsDomain
@testable import SwiftLeedsKit
import XCTest

final class SponsorInterceptorTests: XCTestCase {

    var state: SponsorState!
    var dependencies: SponsorMockDependencies!

    override func setUp() {
        super.setUp()
        state = SponsorState()
        dependencies = SponsorMockDependencies()
    }

    override func tearDown() {
        dependencies = nil
        state = nil
        super.tearDown()
    }

    func testFetchSponsors() async throws {
        let sponsors = [
            SwiftLeedsDomain.Sponsor(
                id: try XCTUnwrap(UUID(uuidString: "A102A530-5B52-4772-8508-8DB6F302A919")),
                name: "Sponsor 1",
                subtitle: "Subtitle 1",
                url: try XCTUnwrap(URL(string: "https://domain.com/sponsor1")),
                sponsorLevel: .platinum,
                imageURL: try XCTUnwrap(URL(string: "https://domain.com/sponsor/image1")),
                jobs: []
            ),
            SwiftLeedsDomain.Sponsor(
                id: try XCTUnwrap(UUID(uuidString: "FCC5662D-C18C-46E2-B832-13F175E437E4")),
                name: "Sponsor 2",
                subtitle: "Subtitle 2",
                url: try XCTUnwrap(URL(string: "https://domain.com/sponsor2")),
                sponsorLevel: .silver,
                imageURL: try XCTUnwrap(URL(string: "https://domain.com/sponsor/image2")),
                jobs: []
            )
        ]
        dependencies.fetchSponsors.sponsors = .success(sponsors)
        let expectedSponsors = [
            SwiftLeedsKit.Sponsor(
                id: try XCTUnwrap(UUID(uuidString: "A102A530-5B52-4772-8508-8DB6F302A919")),
                name: "Sponsor 1",
                subtitle: "Subtitle 1",
                url: try XCTUnwrap(URL(string: "https://domain.com/sponsor1")),
                sponsorLevel: .platinum,
                imageURL: try XCTUnwrap(URL(string: "https://domain.com/sponsor/image1")),
                jobs: []
            ),
            SwiftLeedsKit.Sponsor(
                id: try XCTUnwrap(UUID(uuidString: "FCC5662D-C18C-46E2-B832-13F175E437E4")),
                name: "Sponsor 2",
                subtitle: "Subtitle 2",
                url: try XCTUnwrap(URL(string: "https://domain.com/sponsor2")),
                sponsorLevel: .silver,
                imageURL: try XCTUnwrap(URL(string: "https://domain.com/sponsor/image2")),
                jobs: []
            )
        ]

        let action = SponsorAction.fetchSponsors
        let expectedNewAction = SponsorAction.setSponsors(expectedSponsors)

        let newAction = await sponsorInterceptor(state: state, action: action, dependencies: dependencies)

        XCTAssertEqual(newAction, expectedNewAction)
    }

}
