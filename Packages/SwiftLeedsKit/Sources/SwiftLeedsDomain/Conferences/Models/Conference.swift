import Foundation

public struct Conference: Identifiable {

    public let id: UUID
    public let name: String
    public let date: Date
    public let location: String

    public init(
        id: UUID,
        name: String,
        date: Date,
        location: String
    ) {
        self.id = id
        self.name = name
        self.date = date
        self.location = location
    }

}
