import Foundation

public protocol FetchVenueUseCase {

    func execute() async throws -> PointOfInterest?

}
