import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

final class ScheduleDataSourceAdapter: ScheduleDataSource {

    private let scheduleRepository: any ScheduleRepository
    private let scheduleMapper: any ScheduleMapping

    init(
        scheduleRepository: some ScheduleRepository,
        scheduleMapper: some ScheduleMapping
    ) {
        self.scheduleRepository = scheduleRepository
        self.scheduleMapper = scheduleMapper
    }

    func schedule(forConference conferenceID: UUID) async throws -> SwiftLeedsDomain.Schedule {
        let scheduleDataModel = try await scheduleRepository.schedule(forEvent: conferenceID)
        let event = scheduleDataModel.event
        let slotDataModels = scheduleDataModel.slots

        let schedule = scheduleMapper.map(conferenceID: event.id, slots: slotDataModels)

        return schedule
    }

}
