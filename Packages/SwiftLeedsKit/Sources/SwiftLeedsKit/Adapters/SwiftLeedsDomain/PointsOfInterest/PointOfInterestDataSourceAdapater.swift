import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

final class PointOfInterestDataSourceAdapater: PointOfInterestDataSource {

    private let locationRepository: any LocationRepository
    private let pointOfInterestMapper: any PointOfInterestMapping
    private let pointsOfInterestGroupMapper: any PointsOfInterestGroupMapping

    init(
        locationRepository: some LocationRepository,
        pointOfInterestMapper: some PointOfInterestMapping,
        pointsOfInterestGroupMapper: some PointsOfInterestGroupMapping
    ) {
        self.locationRepository = locationRepository
        self.pointOfInterestMapper = pointOfInterestMapper
        self.pointsOfInterestGroupMapper = pointsOfInterestGroupMapper
    }

    func venue() async throws -> SwiftLeedsDomain.PointOfInterest? {
        guard let locationDataModel = try await locationRepository.venueLocation() else {
            return nil
        }

        let venue = pointOfInterestMapper.map(location: locationDataModel)

        return venue
    }

    func pointsOfInterest() async throws -> [SwiftLeedsDomain.PointsOfInterestGroup] {
        let locationGroupDataModels = try await locationRepository.locationGroups()

        let pointsOfInterestGroups = locationGroupDataModels.map(pointsOfInterestGroupMapper.map)

        return pointsOfInterestGroups
    }

}
