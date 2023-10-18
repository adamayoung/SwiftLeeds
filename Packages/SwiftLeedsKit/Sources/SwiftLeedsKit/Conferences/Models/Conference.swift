import Foundation

public struct Conference: Identifiable, Hashable, Equatable {

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

    public static var previews: [Conference] {
        [
            Conference(
                id: UUID(uuidString: "2D951908-1679-4D02-944B-54579698888B")!,
                name: "SwiftLeeds 2023",
                date: Date(timeIntervalSince1970: 1696809600),
                location: "The Playhouse, Leeds"
            ),
            Conference(
                id: UUID(uuidString: "CD72144D-8786-4188-ADA5-794393225AB2")!,
                name: "SwiftLeeds 2022",
                date: Date(timeIntervalSince1970: 1666224000),
                location: "The Playhouse, Leeds"
            ),
            Conference(
                id: UUID(uuidString: "9C8A70F3-2EC5-4B8B-B483-0349448A1E0A")!,
                name: "SwiftLeeds 2021",
                date: Date(timeIntervalSince1970: 1633478400),
                location: "The Carriageworks Theatre"
            )
        ]
    }

}
