import Foundation
import SwiftLeedsDomain

extension PointsOfInterestGroup {

    init(pointsOfInterestGroup: SwiftLeedsDomain.PointsOfInterestGroup) {
        self.init(
            id: pointsOfInterestGroup.id,
            name: pointsOfInterestGroup.name,
            symbolName: pointsOfInterestGroup.symbolName,
            pointsOfInterest: pointsOfInterestGroup.pointsOfInterest.map {
                PointOfInterest(
                    pointOfInterest: $0,
                    categoryName: pointsOfInterestGroup.name,
                    categorySymbolName: pointsOfInterestGroup.symbolName
                )
            }
        )
    }

}
