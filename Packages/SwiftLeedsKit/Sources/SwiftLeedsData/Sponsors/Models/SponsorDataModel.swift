import Foundation

public struct SponsorDataModel: Decodable {

    public let id: UUID
    public let name: String
    public let subtitle: String
    public let url: URL
    public let sponsorLevel: SponsorLevelDataModel
    public let image: URL
    public let jobs: [JobDataModel]

    public init(
        id: UUID,
        name: String,
        subtitle: String,
        url: URL,
        sponsorLevel: SponsorLevelDataModel,
        image: URL,
        jobs: [JobDataModel]
    ) {
        self.id = id
        self.name = name
        self.subtitle = subtitle
        self.url = url
        self.sponsorLevel = sponsorLevel
        self.image = image
        self.jobs = jobs
    }

}
