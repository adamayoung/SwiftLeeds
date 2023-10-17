import Foundation

public struct LocationGroupDataModel: Decodable {

    public let id: UUID
    public let name: String
    public let symbolName: String
    public let locations: [LocationDataModel]

    public init(
        id: UUID,
        name: String,
        symbolName: String,
        locations: [LocationDataModel]
    ) {
        self.id = id
        self.name = name
        self.symbolName = symbolName
        self.locations = locations
    }

}
