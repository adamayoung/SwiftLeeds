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

    case .fetchCurrentSchedule:
        guard let conferenceID = state.current?.id else {
            return nil
        }

        let useCase = dependencies.fetchScheduleUseCase()
        guard
            let scheduleModel = try? await useCase.execute(conferenceID: conferenceID),
            let schedule = Schedule(schedule: scheduleModel)
        else {
            return nil
        }

        return .setCurrentSchedule(schedule)

    case .fetchSpeakers:
        guard let conferenceID = state.current?.id else {
            return nil
        }

        let useCase = dependencies.fetchSpeakersUseCase()
        guard let speakerModels = try? await useCase.execute(conferenceID: conferenceID) else {
            return nil
        }

        let speakers = speakerModels.map(Speaker.init)
        return .setSpeakers(speakers)

    default:
        break
    }

    return nil
}
