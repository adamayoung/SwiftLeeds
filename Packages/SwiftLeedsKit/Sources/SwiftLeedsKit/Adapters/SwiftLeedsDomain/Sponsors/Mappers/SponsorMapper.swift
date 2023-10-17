import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

struct SponsorMapper: SponsorMapping {

    func map(sponsor: SwiftLeedsData.SponsorDataModel) -> SwiftLeedsDomain.Sponsor? {
        guard let sponsorLevel = mapSponsorLevel(sponsor.sponsorLevel) else {
            return nil
        }

        let jobs = sponsor.jobs.map(mapJob)

        return SwiftLeedsDomain.Sponsor(
            id: sponsor.id,
            name: sponsor.name,
            subtitle: sponsor.subtitle,
            url: sponsor.url,
            sponsorLevel: sponsorLevel,
            imageURL: sponsor.image,
            jobs: jobs
        )
    }

}

extension SponsorMapper {

    private func mapSponsorLevel(
        _ sponsorLevel: SwiftLeedsData.SponsorLevelDataModel
    ) -> SwiftLeedsDomain.SponsorLevel? {
        switch sponsorLevel {
        case .platinum:
            return .platinum

        case .silver:
            return .silver

        default:
            return nil
        }
    }

    private func mapJob(_ job: SwiftLeedsData.JobDataModel) -> SwiftLeedsDomain.Job {
        SwiftLeedsDomain.Job(
            id: job.id,
            title: job.title,
            details: job.details,
            location: job.location,
            url: job.url
        )
    }

}
