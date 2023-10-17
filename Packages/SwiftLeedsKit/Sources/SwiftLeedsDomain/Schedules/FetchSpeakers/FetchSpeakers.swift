import Foundation

public final class FetchSpeakers: FetchSpeakersUseCase {

    private let scheduleDataSource: any ScheduleDataSource

    public init(scheduleDataSource: some ScheduleDataSource) {
        self.scheduleDataSource = scheduleDataSource
    }

    public func execute(conferenceID: UUID) async throws -> [Speaker] {
        let schedule: Schedule
        do {
            schedule = try await scheduleDataSource.schedule(forConference: conferenceID)
        } catch {
            return []
        }

        let speakers = Self.speakers(from: schedule)
        return speakers
    }

}

extension FetchSpeakers {

    private static func speakers(from schedule: Schedule) -> [Speaker] {
        let speakers = schedule.timeSlots.compactMap { timeSlot in
            switch timeSlot.item {
            case .presentation(let presentation):
                return presentation.speaker

            default:
                return nil
            }
        }

        return speakers
    }

}
