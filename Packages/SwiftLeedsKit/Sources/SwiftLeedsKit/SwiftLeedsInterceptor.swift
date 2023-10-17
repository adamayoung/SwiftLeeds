import Foundation

func swiftLeedsInterceptor(
    state: SwiftLeedsState,
    action: SwiftLeedsAction,
    dependencies: SwiftLeedsDependencies
) async -> SwiftLeedsAction? {
    switch action {
    case .conferences(let action):
        let newAction = await conferenceInterceptor(state: state.conferences, action: action,
                                                    dependencies: dependencies)
        guard let action = newAction else {
            return nil
        }

        return .conferences(action)

    case .pointsOfInterest(let action):
        let newAction = await pointOfInterestInterceptor(state: state.pointsOfInterest, action: action,
                                                         dependencies: dependencies)
        guard let action = newAction else {
            return nil
        }

        return .pointsOfInterest(action)

    case .sponsors(let action):
        let newAction = await sponsorInterceptor(state: state.sponsors, action: action, dependencies: dependencies)
        guard let action = newAction else {
            return nil
        }

        return .sponsors(action)
    }
}
