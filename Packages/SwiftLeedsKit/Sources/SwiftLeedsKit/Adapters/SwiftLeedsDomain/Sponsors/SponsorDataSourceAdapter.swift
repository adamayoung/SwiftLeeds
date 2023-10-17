import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

final class SponsorDataSourceAdapter: SponsorDataSource {

    private let sponsorRepository: any SponsorRepository
    private let sponsorMapper: any SponsorMapping

    init(
        sponsorRepository: some SponsorRepository,
        sponsorMapper: some SponsorMapping
    ) {
        self.sponsorRepository = sponsorRepository
        self.sponsorMapper = sponsorMapper
    }

    func sponsors() async throws -> [SwiftLeedsDomain.Sponsor] {
        let sponsorDataModels = try await sponsorRepository.sponsors()

        let sponsors = sponsorDataModels.compactMap(sponsorMapper.map)

        return sponsors
    }

}
