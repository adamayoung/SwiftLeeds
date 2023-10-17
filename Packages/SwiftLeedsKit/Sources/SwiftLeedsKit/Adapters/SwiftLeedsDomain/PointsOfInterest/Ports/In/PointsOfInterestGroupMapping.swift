import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

protocol PointsOfInterestGroupMapping {

    func map(locationGroup: SwiftLeedsData.LocationGroupDataModel) -> SwiftLeedsDomain.PointsOfInterestGroup

}
