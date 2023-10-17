import Foundation

public protocol FetchPointsOfInterestUseCase {

    func execute() async throws -> [PointsOfInterestGroup]

}
