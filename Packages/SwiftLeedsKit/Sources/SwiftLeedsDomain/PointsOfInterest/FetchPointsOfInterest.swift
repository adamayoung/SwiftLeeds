import Foundation

public final class FetchPointsOfInterest: FetchPointsOfInterestUseCase {

    private let pointOfInterestDataSource: any PointOfInterestDataSource

    public init(pointOfInterestDataSource: some PointOfInterestDataSource) {
        self.pointOfInterestDataSource = pointOfInterestDataSource
    }

    public func execute() async throws -> [PointsOfInterestGroup] {
        let pointsOfInterest: [PointsOfInterestGroup]
        do {
            pointsOfInterest = try await pointOfInterestDataSource.pointsOfInterest()
        } catch {
            return []
        }

        return pointsOfInterest
    }

}
