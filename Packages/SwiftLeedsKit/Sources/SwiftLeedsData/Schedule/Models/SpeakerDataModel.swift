import Foundation

public struct SpeakerDataModel: Decodable {

    public let id: UUID
    public let name: String
    public let biography: String
    public let profileImage: URL
    public let organisation: String
    public let twitter: String

    public init(
        id: UUID,
        name: String,
        biography: String,
        profileImage: URL,
        organisation: String,
        twitter: String
    ) {
        self.id = id
        self.name = name
        self.biography = biography
        self.profileImage = profileImage
        self.organisation = organisation
        self.twitter = twitter
    }

}
