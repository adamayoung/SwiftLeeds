import Foundation

public struct ActivityDataModel: Decodable {

    public let id: UUID
    public let title: String
    public let subtitle: String
    public let description: String
    public let image: URL
    public let metadataURL: String

    public init(
        id: UUID,
        title: String,
        subtitle: String,
        description: String,
        image: URL,
        metadataURL: String
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.image = image
        self.metadataURL = metadataURL
    }

}
