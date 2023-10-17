import Foundation

public struct Speaker: Identifiable, Hashable {

    public let id: UUID
    public let name: String
    public let organisation: String?
    public let biography: String
    public let profileImageURL: URL
    public let twitter: String

    public init(
        id: UUID,
        name: String,
        organisation: String?,
        biography: String,
        profileImageURL: URL,
        twitter: String
    ) {
        self.id = id
        self.name = name
        self.organisation = organisation
        self.biography = biography
        self.profileImageURL = profileImageURL
        self.twitter = twitter
    }

}
