import Foundation

public enum ScheduleAction {

    case fetchSchedule(conferenceID: UUID)
    case setSchedule(Schedule, conferenceID: UUID)

    case fetchSpeakers(conferenceID: UUID)
    case setSpeakers([Speaker], conferenceID: UUID)

}
