@testable import SwiftLeedsDomain
import XCTest

final class FetchSponsorsTests: XCTestCase {

    var useCase: FetchSponsors!
    var sponsorDataSource: SponsorMockDataSource!

    override func setUp() {
        super.setUp()
        sponsorDataSource = SponsorMockDataSource()
        useCase = FetchSponsors(sponsorDataSource: sponsorDataSource)
    }

    override func tearDown() {
        useCase = nil
        sponsorDataSource = nil
        super.tearDown()
    }

    func testExecuteReturnsSponsorsInAlphabeticalOrder() async throws {
        let sponsor1 = Sponsor(
            id: try XCTUnwrap(UUID(uuidString: "A102A530-5B52-4772-8508-8DB6F302A919")),
            name: "Sponsor 1",
            subtitle: "Subtitle 1",
            url: try XCTUnwrap(URL(string: "https://domain.com/sponsor1")),
            sponsorLevel: .platinum,
            imageURL: try XCTUnwrap(URL(string: "https://domain.com/sponsor/image1")),
            jobs: []
        )

        let sponsor2 = Sponsor(
            id: try XCTUnwrap(UUID(uuidString: "FCC5662D-C18C-46E2-B832-13F175E437E4")),
            name: "Sponsor 2",
            subtitle: "Subtitle 2",
            url: try XCTUnwrap(URL(string: "https://domain.com/sponsor2")),
            sponsorLevel: .silver,
            imageURL: try XCTUnwrap(URL(string: "https://domain.com/sponsor/image2")),
            jobs: []
        )

        let expectedSponsors = [sponsor1, sponsor2]

        sponsorDataSource.sponsorsResult = .success([sponsor2, sponsor1])

        let sponsors = try await useCase.execute()

        XCTAssertEqual(sponsors, expectedSponsors)
    }

}
