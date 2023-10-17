import Foundation

public struct Sponsor: Identifiable, Equatable {

    public let id: UUID
    public let name: String
    public let subtitle: String
    public let url: URL
    public let sponsorLevel: SponsorLevel
    public let imageURL: URL
    public let jobs: [Job]

    public init(
        id: UUID,
        name: String,
        subtitle: String,
        url: URL,
        sponsorLevel: SponsorLevel,
        imageURL: URL,
        jobs: [Job]
    ) {
        self.id = id
        self.name = name
        self.subtitle = subtitle
        self.url = url
        self.sponsorLevel = sponsorLevel
        self.imageURL = imageURL
        self.jobs = jobs
    }

}
