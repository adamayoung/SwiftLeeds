import Foundation

public func pointOfInterestReducer(state: PointOfInterestState, action: PointOfInterestAction) -> PointOfInterestState {
    var state = state

    switch action {
    case .setVenue(let venue):
        state.venue = venue

    case .setPointsOfInterest(let pointsOfInterest):
        state.all = pointsOfInterest

    default:
        break
    }

    return state
}
