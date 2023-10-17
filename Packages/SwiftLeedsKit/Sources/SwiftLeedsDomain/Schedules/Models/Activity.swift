import Foundation

public struct Activity: Identifiable, Hashable {

    public let id: UUID
    public let title: String
    public let subtitle: String
    public let description: String
    public let imageURL: URL
    public let metadataURL: URL?

    public init(
        id: UUID,
        title: String,
        subtitle: String,
        description: String,
        imageURL: URL,
        metadataURL: URL? = nil
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.imageURL = imageURL
        self.metadataURL = metadataURL
    }

}
