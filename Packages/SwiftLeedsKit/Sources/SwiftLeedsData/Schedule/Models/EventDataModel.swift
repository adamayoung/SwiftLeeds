import Foundation

public struct EventDataModel: Decodable {

    public let id: UUID
    public let name: String
    public let location: String
    public let date: String

    public init(
        id: UUID,
        name: String,
        location: String,
        date: String
    ) {
        self.id = id
        self.name = name
        self.location = location
        self.date = date
    }

}
