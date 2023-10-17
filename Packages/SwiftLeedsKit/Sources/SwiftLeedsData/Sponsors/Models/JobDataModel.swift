import Foundation

public struct JobDataModel: Decodable {

    public let id: UUID
    public let title: String
    public let details: String
    public let location: String
    public let url: URL

    public init(
        id: UUID,
        title: String,
        details: String,
        location: String,
        url: URL
    ) {
        self.id = id
        self.title = title
        self.details = details
        self.location = location
        self.url = url
    }

}
