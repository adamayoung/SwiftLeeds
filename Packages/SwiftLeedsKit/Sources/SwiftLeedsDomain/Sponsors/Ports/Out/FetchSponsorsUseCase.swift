import Foundation

public protocol FetchSponsorsUseCase {

    func execute() async throws -> [Sponsor]

}
