import Foundation

func pointOfInterestInterceptor(
    state: PointOfInterestState,
    action: PointOfInterestAction,
    dependencies: PointOfInterestDependencies
) async -> PointOfInterestAction? {
    switch action {
    case .fetchVenue:
        let useCase = dependencies.fetchVenueUseCase()
        guard let pointOfInterestModel = try? await useCase.execute() else {
            return nil
        }

        let venue = Venue(pointOfInterest: pointOfInterestModel)
        return .setVenue(venue)

    case .fetchPointsOfInterest:
        let useCase = dependencies.fetchPointsOfInterestUseCase()
        guard let pointsOfInterestGroupModels = try? await useCase.execute() else {
            return nil
        }

        let pointsOfInterestGroups = pointsOfInterestGroupModels.map(PointsOfInterestGroup.init)
        return .setPointsOfInterest(pointsOfInterestGroups)

    default:
        break
    }

    return nil
}
