import Foundation

public struct PresentationDataModel: Decodable {

    public let id: UUID
    public let title: String
    public let synopsis: String
    public let speakers: [SpeakerDataModel]
    public let slidoURL: URL

    public init(
        id: UUID,
        title: String,
        synopsis: String,
        speakers: [SpeakerDataModel],
        slidoURL: URL
    ) {
        self.id = id
        self.title = title
        self.synopsis = synopsis
        self.speakers = speakers
        self.slidoURL = slidoURL
    }

}
