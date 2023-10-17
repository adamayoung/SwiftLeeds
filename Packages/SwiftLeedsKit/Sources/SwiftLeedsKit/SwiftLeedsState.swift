import Foundation

public struct SwiftLeedsState {

    public internal(set) var conferences: ConferenceState
    public internal(set) var pointsOfInterest: PointOfInterestState
    public internal(set) var sponsors: SponsorState

    public init(
        conferences: ConferenceState = ConferenceState(),
        pointsOfInterest: PointOfInterestState = PointOfInterestState(),
        sponsors: SponsorState = SponsorState()
    ) {
        self.conferences = conferences
        self.pointsOfInterest = pointsOfInterest
        self.sponsors = sponsors
    }

}

extension SwiftLeedsState {

    public static var preview: SwiftLeedsState {
        SwiftLeedsState(
            conferences: .preview,
            pointsOfInterest: .preview,
            sponsors: .preview
        )
    }

}
