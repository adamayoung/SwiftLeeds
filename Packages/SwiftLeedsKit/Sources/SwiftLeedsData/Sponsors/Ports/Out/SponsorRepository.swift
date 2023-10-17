import Foundation

public protocol SponsorRepository {

    func sponsors() async throws -> [SponsorDataModel]

}
