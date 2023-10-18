import Foundation

func conferenceInterceptor(
    state: ConferenceState,
    action: ConferenceAction,
    dependencies: ConferenceDependencies
) async -> ConferenceAction? {
    switch action {
    case .fetchCurrentConference:
        let useCase = dependencies.fetchCurrentConferenceUseCase()
        guard
            let conferenceModel = try? await useCase.execute(),
            let conference = Conference(conference: conferenceModel)
        else {
            return nil
        }

        return .setCurrentConference(conference)

    case .fetchConferences:
        let useCase = dependencies.fetchConferencesUseCase()
        guard let conferenceModels = try? await useCase.execute() else {
            return nil
        }

        let conferences =  conferenceModels.compactMap(Conference.init)

        return .setConferences(conferences)

    default:
        break
    }

    return nil
}
