import Foundation
import SwiftLeedsDomain

final class SponsorMockDataSource: SponsorDataSource {

    private(set) var wasSponsorsCalled = false
    var sponsorsResult: Result<[Sponsor], FetchSponsorsError> = .failure(.unknown(nil))

    func sponsors() async throws -> [Sponsor] {
        wasSponsorsCalled = true

        return try sponsorsResult.get()
    }

}
