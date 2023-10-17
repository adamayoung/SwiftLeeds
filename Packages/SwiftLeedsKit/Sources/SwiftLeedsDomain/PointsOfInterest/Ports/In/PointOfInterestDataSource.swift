import Foundation

public protocol PointOfInterestDataSource {

    func venue() async throws -> PointOfInterest?

    func pointsOfInterest() async throws -> [PointsOfInterestGroup]

}
