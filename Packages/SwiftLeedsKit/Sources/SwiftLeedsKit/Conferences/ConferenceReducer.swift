import Foundation

public func conferenceReducer(state: ConferenceState, action: ConferenceAction) -> ConferenceState {
    var state = state

    switch action {
    case .setCurrentConference(let conference):
        state.current = conference

    case .setConferences(let conferences):
        state.all = conferences

    default:
        break
    }

    return state
}
