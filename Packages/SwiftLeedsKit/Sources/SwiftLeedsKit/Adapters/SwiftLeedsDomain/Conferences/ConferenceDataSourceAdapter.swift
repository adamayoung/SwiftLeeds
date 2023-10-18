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
        let scheduleDataModel: ScheduleDataModel
        do {
            scheduleDataModel = try await scheduleRepository.schedule()
        } catch let error as ScheduleRepositoryError {
            if case .notFound = error {
                return nil
            }

            throw ConferenceDataSourceError(error: error)
        } catch let error {
            throw ConferenceDataSourceError(error: error)
        }

        let eventDataModel = scheduleDataModel.event
        let conference = conferenceMapper.map(event: eventDataModel)

        return conference
    }

    func conferences() async throws -> [SwiftLeedsDomain.Conference] {
        let scheduleDataModel: ScheduleDataModel
        do {
            scheduleDataModel = try await scheduleRepository.schedule()
        } catch let error as ScheduleRepositoryError {
            if case .notFound = error {
                return []
            }

            throw ConferenceDataSourceError(error: error)
        } catch let error {
            throw ConferenceDataSourceError(error: error)
        }

        let eventDataModels = scheduleDataModel.events

        let conferences = eventDataModels
            .map(conferenceMapper.map)
            .sorted { $0.date < $1.date }

        return conferences
    }

}
