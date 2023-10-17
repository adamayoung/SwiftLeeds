import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

struct PointsOfInterestGroupMapper: PointsOfInterestGroupMapping {

    private let pointOfInterestMapper: any PointOfInterestMapping

    init(pointOfInterestMapper: some PointOfInterestMapping) {
        self.pointOfInterestMapper = pointOfInterestMapper
    }

    func map(locationGroup: SwiftLeedsData.LocationGroupDataModel) -> SwiftLeedsDomain.PointsOfInterestGroup {
        let pointsOfInterest = locationGroup.locations.map(pointOfInterestMapper.map)

        return SwiftLeedsDomain.PointsOfInterestGroup(
            id: locationGroup.id,
            name: locationGroup.name,
            symbolName: locationGroup.symbolName,
            pointsOfInterest: pointsOfInterest
        )
    }

}
