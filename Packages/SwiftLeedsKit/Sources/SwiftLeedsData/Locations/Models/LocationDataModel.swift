import Foundation

public struct LocationDataModel: Decodable {

    public let id: UUID
    public let name: String
    public let url: URL
    public let lat: Double
    public let lon: Double

    public init(
        id: UUID,
        name: String,
        url: URL,
        lat: Double,
        lon: Double
    ) {
        self.id = id
        self.name = name
        self.url = url
        self.lat = lat
        self.lon = lon
    }

}
