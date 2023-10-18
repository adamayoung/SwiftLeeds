import Foundation

public func swiftLeedsReducer(state: SwiftLeedsState, action: SwiftLeedsAction) -> SwiftLeedsState {
    var state = state

    switch action {
    case .conferences(let action):
        state.conferences = conferenceReducer(state: state.conferences, action: action)

    case .schedules(let action):
        state.schedules = scheduleReducer(state: state.schedules, action: action)

    case .pointsOfInterest(let action):
        state.pointsOfInterest = pointOfInterestReducer(state: state.pointsOfInterest, action: action)

    case .sponsors(let action):
        state.sponsors = sponsorReducer(state: state.sponsors, action: action)
    }

    return state
}
