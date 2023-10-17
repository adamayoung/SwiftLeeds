import Foundation
import SwiftLeedsDomain

extension Venue {

    init(pointOfInterest: SwiftLeedsDomain.PointOfInterest) {
        self.init(
            id: pointOfInterest.id,
            name: pointOfInterest.name,
            latitude: pointOfInterest.latitude,
            longitude: pointOfInterest.longitude
        )
    }

}
