import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

final class ConferenceDataSourceAdapter: ConferenceDataSource {

    private let scheduleRepository: any ScheduleRepository
    private let conferenceMapper: any ConferenceMapping

    init(
        scheduleRepository: some ScheduleRepository,
        conferenceMapper: some ConferenceMapping
    ) {
        self.scheduleRepository = scheduleRepository
        self.conferenceMapper = conferenceMapper
    }

    func currentConference() async throws -> SwiftLeedsDomain.Conference? {
        let scheduleDataModel = try await scheduleRepository.schedule()
        let eventDataModel = scheduleDataModel.event

        let conference = conferenceMapper.map(event: eventDataModel)

        return conference
    }

    func conferences() async throws -> [SwiftLeedsDomain.Conference] {
        let scheduleDataModel = try await scheduleRepository.schedule()
        let eventDataModels = scheduleDataModel.events

        let conferences = eventDataModels.map(conferenceMapper.map)

        return conferences
    }

}
