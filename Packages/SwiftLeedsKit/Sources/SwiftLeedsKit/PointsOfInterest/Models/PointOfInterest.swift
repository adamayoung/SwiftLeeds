import Foundation

public struct PointOfInterest: Identifiable, Hashable, Equatable {

    public let id: UUID
    public let name: String
    public let categoryName: String
    public let categorySymbolName: String
    public let url: URL
    public let latitude: Double
    public let longitude: Double

    public var appleMapsURL: URL {
        URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")!
    }

    public init(
        id: UUID,
        name: String,
        categoryName: String,
        categorySymbolName: String,
        url: URL,
        latitude: Double,
        longitude: Double
    ) {
        self.id = id
        self.name = name
        self.categoryName = categoryName
        self.categorySymbolName = categorySymbolName
        self.url = url
        self.latitude = latitude
        self.longitude = longitude
    }

}

#if canImport(CoreLocation)
import CoreLocation

extension PointOfInterest {

    public var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

}
#endif

#if canImport(MapKit)
import MapKit

extension PointOfInterest {

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

extension PointOfInterest {

    public var mapCameraPosition: MapCameraPosition {
        MapCameraPosition.region(region)
    }

    public var marker: Marker<Label<Text, Image>> {
        Marker(
            name,
            systemImage: categorySymbolName,
            coordinate: coordinate
        )
    }

}
#endif

extension PointOfInterest {

    public static var preview: PointOfInterest {
        PointOfInterest(
            id: UUID(uuidString: "E1A700DB-8872-4E12-8B88-4A1322D4FC73")!,
            name: "Duke Studios",
            categoryName: "Places to Work",
            categorySymbolName: "laptopcomputer",
            url: URL(string: "http://www.duke-studios.com/")!,
            latitude: 53.7913022408058,
            longitude: -1.538100284323885
        )
    }

}
