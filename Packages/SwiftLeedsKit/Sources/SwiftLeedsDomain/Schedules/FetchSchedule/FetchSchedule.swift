import Foundation

public final class FetchSchedule: FetchScheduleUseCase {

    private let scheduleDataSource: any ScheduleDataSource

    public init(scheduleDataSource: some ScheduleDataSource) {
        self.scheduleDataSource = scheduleDataSource
    }

    public func execute(conferenceID: UUID) async throws -> Schedule {
        let schedule: Schedule
        do {
            schedule = try await scheduleDataSource.schedule(forConference: conferenceID)
        } catch {
            throw FetchScheduleError.notFound
        }

        return schedule
    }

}
