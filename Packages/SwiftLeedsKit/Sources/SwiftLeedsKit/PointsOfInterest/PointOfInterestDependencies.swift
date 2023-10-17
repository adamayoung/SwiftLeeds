import Foundation
import SwiftLeedsDomain

public protocol PointOfInterestDependencies {

    func fetchVenueUseCase() -> any FetchVenueUseCase

    func fetchPointsOfInterestUseCase() -> any FetchPointsOfInterestUseCase

}
