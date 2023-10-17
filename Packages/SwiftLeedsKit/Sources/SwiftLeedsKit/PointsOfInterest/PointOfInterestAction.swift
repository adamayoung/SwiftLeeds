import Foundation

public enum PointOfInterestAction: Equatable {

    case fetchVenue
    case setVenue(Venue)

    case fetchPointsOfInterest
    case setPointsOfInterest([PointsOfInterestGroup])

}
