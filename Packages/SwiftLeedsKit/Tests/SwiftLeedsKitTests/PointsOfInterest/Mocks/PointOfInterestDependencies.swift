import Foundation
import SwiftLeedsDomain
@testable import SwiftLeedsKit

final class PointOfInterestMockDependencies: PointOfInterestDependencies {

    let fetchVenue = FetchVenueMockUseCase()
    let pointsOfInterest = FetchPointsOfInterestMockUseCase()

    init() { }

    func fetchVenueUseCase() -> FetchVenueUseCase {
        fetchVenue
    }

    func fetchPointsOfInterestUseCase() -> FetchPointsOfInterestUseCase {
        pointsOfInterest
    }

}

extension PointOfInterestMockDependencies {

    final class FetchVenueMockUseCase: FetchVenueUseCase {

        var venue: Result<SwiftLeedsDomain.PointOfInterest?, Error> = .success(nil)

        init() { }

        func execute() async throws -> SwiftLeedsDomain.PointOfInterest? {
            try venue.get()
        }

    }

    final class FetchPointsOfInterestMockUseCase: FetchPointsOfInterestUseCase {

        var pointsOfInterest: Result<[SwiftLeedsDomain.PointsOfInterestGroup], Error> = .success([])

        init() { }

        func execute() async throws -> [SwiftLeedsDomain.PointsOfInterestGroup] {
            try pointsOfInterest.get()
        }

    }

}
