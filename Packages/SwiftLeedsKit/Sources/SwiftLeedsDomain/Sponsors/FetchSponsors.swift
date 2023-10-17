import Foundation

public final class FetchSponsors: FetchSponsorsUseCase {

    private let sponsorDataSource: any SponsorDataSource

    public init(sponsorDataSource: any SponsorDataSource) {
        self.sponsorDataSource = sponsorDataSource
    }

    public func execute() async throws -> [Sponsor] {
        let sponsors: [Sponsor]
        do {
            sponsors = try await sponsorDataSource.sponsors()
        } catch let error {
            throw FetchSponsorsError.unknown(error)
        }

        let sortedSponsers = sponsors.sorted { $0.name < $1.name }
        return sortedSponsers
    }

}
