import Foundation

public struct SwiftLeedsState {

    public internal(set) var conferences: ConferenceState
    public internal(set) var schedules: ScheduleState
    public internal(set) var pointsOfInterest: PointOfInterestState
    public internal(set) var sponsors: SponsorState

    public var isReady: Bool {
        conferences.current != nil
    }

    public init(
        conferences: ConferenceState = ConferenceState(),
        schedules: ScheduleState = ScheduleState(),
        pointsOfInterest: PointOfInterestState = PointOfInterestState(),
        sponsors: SponsorState = SponsorState()
    ) {
        self.conferences = conferences
        self.schedules = schedules
        self.pointsOfInterest = pointsOfInterest
        self.sponsors = sponsors
    }

}

extension SwiftLeedsState {

    public static var preview: SwiftLeedsState {
        SwiftLeedsState(
            conferences: .preview,
            schedules: .preview,
            pointsOfInterest: .preview,
            sponsors: .preview
        )
    }

}
