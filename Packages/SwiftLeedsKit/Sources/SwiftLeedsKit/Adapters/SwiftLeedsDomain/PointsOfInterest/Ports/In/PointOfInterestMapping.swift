import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

protocol PointOfInterestMapping {

    func map(location: SwiftLeedsData.LocationDataModel) -> SwiftLeedsDomain.PointOfInterest

}
