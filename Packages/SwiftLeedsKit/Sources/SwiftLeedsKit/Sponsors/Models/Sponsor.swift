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

extension Sponsor {

    public static var preview: Sponsor {
        Sponsor(
            id: UUID(uuidString: "A102A530-5B52-4772-8508-8DB6F302A919")!,
            name: "Codemagic",
            subtitle: "Ci/CD for mobile that matches your needs",
            url: URL(string: "https://codemagic.io")!,
            sponsorLevel: .platinum,
            imageURL: URL(string: "https://swiftleeds-speakers.s3.eu-west-2.amazonaws.com/0216EFFD-EFEA-4325-880C-CB74B1B16264-codemagic.png")!,
            jobs: Job.previews
        )
    }

    public static var previews: [Sponsor] {
        [
            Sponsor(
                id: UUID(uuidString: "A102A530-5B52-4772-8508-8DB6F302A919")!,
                name: "Codemagic",
                subtitle: "Ci/CD for mobile that matches your needs",
                url: URL(string: "https://codemagic.io")!,
                sponsorLevel: .platinum,
                imageURL: URL(string: "https://swiftleeds-speakers.s3.eu-west-2.amazonaws.com/0216EFFD-EFEA-4325-880C-CB74B1B16264-codemagic.png")!,
                jobs: Job.previews
            ),
            Sponsor(
                id: UUID(uuidString: "7B06DCF7-A52B-42DD-A388-1D882DF94506")!,
                name: "Sentry",
                subtitle: "Performance Monitoring",
                url: URL(string: "https://sentry.io/")!,
                sponsorLevel: .silver,
                imageURL: URL(string: "https://swiftleeds-speakers.s3.eu-west-2.amazonaws.com/522D9390-7A1C-47AF-8547-5A207E77501F-sentry-wordmark-dark-400x119white.png")!,
                jobs: []
            )
        ]
    }

}
