import Foundation

public struct Presentation: Identifiable, Hashable {

    public let id: UUID
    public let title: String
    public let synopsis: String
    public let speaker: Speaker
    public let slidoURL: URL?

    public init(
        id: UUID,
        title: String,
        synopsis: String,
        speaker: Speaker,
        slidoURL: URL? = nil
    ) {
        self.id = id
        self.title = title
        self.synopsis = synopsis
        self.speaker = speaker
        self.slidoURL = slidoURL
    }

}
