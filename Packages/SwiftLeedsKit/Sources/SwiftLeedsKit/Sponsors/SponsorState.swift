import Foundation

public struct SponsorState: Equatable {

    public internal(set) var sponsors: [SponsorLevel: [Sponsor]]

    public init(
        sponsors: [SponsorLevel: [Sponsor]] = [:]
    ) {
        self.sponsors = sponsors
    }

}

extension SponsorState {

    public static var preview: SponsorState {
        SponsorState(
            sponsors: Sponsor.groupByLevel(sponsors: Sponsor.previews)
        )
    }

}
