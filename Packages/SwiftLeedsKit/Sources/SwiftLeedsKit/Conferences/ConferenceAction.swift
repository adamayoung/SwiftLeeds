import Foundation

public enum ConferenceAction {

    case fetchCurrentConference
    case setCurrentConference(Conference)

    case fetchCurrentSchedule
    case setCurrentSchedule(Schedule)

    case fetchSpeakers
    case setSpeakers([Speaker])

}
