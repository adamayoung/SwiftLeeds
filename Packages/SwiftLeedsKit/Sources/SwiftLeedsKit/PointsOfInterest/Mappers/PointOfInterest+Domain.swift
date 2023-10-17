import Foundation
import SwiftLeedsDomain

extension PointOfInterest {

    init(pointOfInterest: SwiftLeedsDomain.PointOfInterest, categoryName: String, categorySymbolName: String) {
        self.init(
            id: pointOfInterest.id,
            name: pointOfInterest.name,
            categoryName: categoryName,
            categorySymbolName: categorySymbolName,
            url: pointOfInterest.url,
            latitude: pointOfInterest.latitude,
            longitude: pointOfInterest.longitude
        )
    }

}
