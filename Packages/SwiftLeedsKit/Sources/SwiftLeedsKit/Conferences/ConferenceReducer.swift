import Foundation

public func conferenceReducer(state: ConferenceState, action: ConferenceAction) -> ConferenceState {
    var state = state

    switch action {
    case .setCurrentConference(let conference):
        state.current = conference

    case .setCurrentSchedule(let schedule):
        state.schedule = schedule

    case .setSpeakers(let speakers):
        state.speakers = speakers

    default:
        break
    }

    return state
}
