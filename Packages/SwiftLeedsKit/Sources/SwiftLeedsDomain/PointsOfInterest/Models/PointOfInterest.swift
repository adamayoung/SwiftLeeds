import Foundation

public struct PointOfInterest: Identifiable, Hashable {

    public let id: UUID
    public let name: String
    public let url: URL
    public let latitude: Double
    public let longitude: Double

    public init(
        id: UUID,
        name: String,
        url: URL,
        latitude: Double,
        longitude: Double
    ) {
        self.id = id
        self.name = name
        self.url = url
        self.latitude = latitude
        self.longitude = longitude
    }

}
