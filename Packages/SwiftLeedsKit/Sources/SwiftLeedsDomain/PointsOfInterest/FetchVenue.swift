import Foundation

public final class FetchVenue: FetchVenueUseCase {

    private let pointOfInterestDataSource: any PointOfInterestDataSource

    public init(pointOfInterestDataSource: some PointOfInterestDataSource) {
        self.pointOfInterestDataSource = pointOfInterestDataSource
    }

    public func execute() async throws -> PointOfInterest? {
        let venue: PointOfInterest?
        do {
            venue = try await pointOfInterestDataSource.venue()
        } catch {
            return nil
        }

        return venue
    }

}
