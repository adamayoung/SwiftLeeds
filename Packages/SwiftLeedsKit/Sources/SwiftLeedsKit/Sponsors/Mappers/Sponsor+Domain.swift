import Foundation
import SwiftLeedsDomain

extension Sponsor {

    init(sponsor: SwiftLeedsDomain.Sponsor) {
        self.init(
            id: sponsor.id,
            name: sponsor.name,
            subtitle: sponsor.subtitle,
            url: sponsor.url,
            sponsorLevel: SponsorLevel(sponsorLevel: sponsor.sponsorLevel),
            imageURL: sponsor.imageURL,
            jobs: sponsor.jobs.map(Job.init)
        )
    }

}

extension Sponsor {

    static func groupByLevel(sponsors: [Sponsor]) -> [SponsorLevel: [Sponsor]] {
        var groups = [SponsorLevel: [Sponsor]]()
        for sponsor in sponsors {
            var sponsorGroup = groups[sponsor.sponsorLevel, default: []]
            sponsorGroup.append(sponsor)
            groups[sponsor.sponsorLevel] = sponsorGroup
        }

        return groups
    }

}
