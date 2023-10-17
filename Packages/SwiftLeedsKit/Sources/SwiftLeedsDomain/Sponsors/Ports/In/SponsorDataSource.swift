import Foundation

public protocol SponsorDataSource {

    func sponsors() async throws -> [Sponsor]

}
