import Foundation

func scheduleInterceptor(
    state: ScheduleState,
    action: ScheduleAction,
    dependencies: ScheduleDependencies
) async -> ScheduleAction? {
    switch action {
    case .fetchSchedule(let conferenceID):
        let useCase = dependencies.fetchScheduleUseCase()
        guard
            let scheduleModel = try? await useCase.execute(conferenceID: conferenceID),
            let schedule = Schedule(schedule: scheduleModel)
        else {
            return nil
        }

        return .setSchedule(schedule, conferenceID: conferenceID)

    case .fetchSpeakers(let conferenceID):
        let useCase = dependencies.fetchSpeakersUseCase()
        guard let speakerModels = try? await useCase.execute(conferenceID: conferenceID) else {
            return nil
        }

        let speakers = speakerModels.map(Speaker.init)
        return .setSpeakers(speakers, conferenceID: conferenceID)

    default:
        break
    }

    return nil
}
