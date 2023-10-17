import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

struct PointOfInterestMapper: PointOfInterestMapping {

    func map(location: SwiftLeedsData.LocationDataModel) -> SwiftLeedsDomain.PointOfInterest {
        SwiftLeedsDomain.PointOfInterest(
            id: location.id,
            name: location.name,
            url: location.url,
            latitude: location.lat,
            longitude: location.lon
        )
    }

}
