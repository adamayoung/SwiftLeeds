import Foundation

public struct Conference: Identifiable, Equatable {

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

extension Conference {

    public static var preview: Conference {
        Conference(
            id: UUID(uuidString: "2D951908-1679-4D02-944B-54579698888B")!,
            name: "SwiftLeeds 2023",
            date: Date(timeIntervalSince1970: 1696809600),
            location: "The Playhouse, Leeds"
        )
    }

}
