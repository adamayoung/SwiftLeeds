import Foundation

public struct Job: Identifiable, Equatable {

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

extension Job {

    // swiftlint:disable line_length
    public static var preview: Job {
        Job(
            id: UUID(uuidString: "9C220CD8-2782-4A6E-B9DD-091C0E246834")!,
            title: "Engineering Manager",
            details: "RevenueCat makes building, analyzing, and growing mobile subscriptions easy. We launched as part of Y Combinator's summer 2018 batch and today are handling more than $2B of in-app purchases annually across thousands of apps.\r\n\r\nWe are a mission driven, remote-first company that is building the standard for mobile subscription infrastructure. Top apps like VSCO, Notion, and ClassDojo count on RevenueCat to power their subscriptions at scale.\r\n\r\nOur 70 team members (and growing!) are located all over the world, from San Francisco to Madrid to Taipei. We're a close-knit, product-driven team, and we strive to live our core values: Customer Obsession, Always Be Shipping, Own It, and Balance.\r\n\r\nTo achieve our mission, we build tools for subscription measurement and experimentation that give developers the insights they need to understand their business and make more money; and we’re seeking an engineering leader ready to partner in that mission.",
            location: "Remote, Americas or EMEA",
            url: URL(string: "https://boards.greenhouse.io/revenuecat/jobs/4926059004")!
        )
    }
    // swiftlint:enable line_length

    public static var previews: [Job] {
        [Job.preview]
    }

}
