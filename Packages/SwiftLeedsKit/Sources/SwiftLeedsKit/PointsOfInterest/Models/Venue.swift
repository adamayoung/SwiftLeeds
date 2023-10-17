import Foundation

public struct Venue: Identifiable, Equatable {

    public let id: UUID
    public let name: String
    public let latitude: Double
    public let longitude: Double

    public init(
        id: UUID,
        name: String,
        latitude: Double,
        longitude: Double
    ) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }

}

#if canImport(CoreLocation)
import CoreLocation

extension Venue {

    public var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

}
#endif

#if canImport(MapKit)
import MapKit

extension Venue {

    public var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: self.coordinate,
            latitudinalMeters: 1000,
            longitudinalMeters: 1000
        )
    }

}
#endif

#if canImport(SwiftUI)
import SwiftUI

extension Venue {

    public var mapCameraPosition: MapCameraPosition {
        MapCameraPosition.region(region)
    }

}
#endif

extension Venue {

    public static var preview: Venue {
        Venue(
            id: UUID(uuidString: "85C117E9-DFBD-4249-9639-83E9B1A343E4")!,
            name: "Playhouse Theatre",
            latitude: 53.798228,
            longitude: -1.535243
        )
    }

}
