import Foundation

public enum SwiftLeedsAction {

    case conferences(ConferenceAction)

    case schedules(ScheduleAction)

    case pointsOfInterest(PointOfInterestAction)

    case sponsors(SponsorAction)

}
