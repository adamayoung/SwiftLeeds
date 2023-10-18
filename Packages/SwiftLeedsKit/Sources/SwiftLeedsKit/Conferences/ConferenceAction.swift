import Foundation

public enum ConferenceAction {

    case fetchCurrentConference
    case setCurrentConference(Conference)

    case fetchConferences
    case setConferences([Conference])

}
