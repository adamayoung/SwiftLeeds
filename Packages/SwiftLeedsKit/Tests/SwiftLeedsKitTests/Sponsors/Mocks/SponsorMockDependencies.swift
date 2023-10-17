import Foundation
import SwiftLeedsDomain
@testable import SwiftLeedsKit

final class SponsorMockDependencies: SponsorDependencies {

    let fetchSponsors = FetchSponsorsMockUseCase()

    init() { }

    func fetchSponsorsUseCase() -> FetchSponsorsUseCase {
        fetchSponsors
    }

}

extension SponsorMockDependencies {

    final class FetchSponsorsMockUseCase: FetchSponsorsUseCase {

        var sponsors: Result<[SwiftLeedsDomain.Sponsor], Error> = .success([])

        init() { }

        func execute() async throws -> [SwiftLeedsDomain.Sponsor] {
            try sponsors.get()
        }

    }

}
