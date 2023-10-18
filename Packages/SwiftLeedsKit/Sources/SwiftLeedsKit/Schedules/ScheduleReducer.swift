import Foundation

public func scheduleReducer(state: ScheduleState, action: ScheduleAction) -> ScheduleState {
    var state = state

    switch action {
    case .setSchedule(let schedule, let conferenceID):
        state.schedules[conferenceID] = schedule

    case .setSpeakers(let speakers, let conferenceID):
        state.speakers[conferenceID] = speakers

    default:
        break
    }

    return state
}
