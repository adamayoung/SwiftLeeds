import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

final class SwiftLeedsLiveDependencies: SwiftLeedsDependencies {

    init() { }

}

extension SwiftLeedsLiveDependencies {

    func fetchConferencesUseCase() -> FetchConferencesUseCase {
        FetchConferences(conferenceDataSource: conferenceDataSource())
    }

    func fetchCurrentConferenceUseCase() -> FetchCurrentConferenceUseCase {
        FetchCurrentConference(conferenceDataSource: conferenceDataSource())
    }

    func fetchScheduleUseCase() -> FetchScheduleUseCase {
        FetchSchedule(scheduleDataSource: scheduleDataSource())
    }

    func fetchSpeakersUseCase() -> FetchSpeakersUseCase {
        FetchSpeakers(scheduleDataSource: scheduleDataSource())
    }

}

extension SwiftLeedsLiveDependencies {

    func fetchVenueUseCase() -> FetchVenueUseCase {
        FetchVenue(pointOfInterestDataSource: pointOfInterestDataSource())
    }

    func fetchPointsOfInterestUseCase() -> FetchPointsOfInterestUseCase {
        FetchPointsOfInterest(pointOfInterestDataSource: pointOfInterestDataSource())
    }

}

extension SwiftLeedsLiveDependencies {

    func fetchSponsorsUseCase() -> FetchSponsorsUseCase {
        FetchSponsors(sponsorDataSource: sponsorDataSource())
    }

}

extension SwiftLeedsLiveDependencies {

    private func conferenceDataSource() -> some ConferenceDataSource {
        ConferenceDataSourceAdapter(
            scheduleRepository: scheduleRepository(),
            conferenceMapper: conferenceMapper()
        )
    }

    private func scheduleDataSource() -> some ScheduleDataSource {
        ScheduleDataSourceAdapter(
            scheduleRepository: scheduleRepository(),
            scheduleMapper: scheduleMapper()
        )
    }

    private func sponsorDataSource() -> some SponsorDataSource {
        SponsorDataSourceAdapter(
            sponsorRepository: sponsorRepository(),
            sponsorMapper: sponsorMapper()
        )
    }

    private func pointOfInterestDataSource() -> some PointOfInterestDataSource {
        PointOfInterestDataSourceAdapater(
            locationRepository: locationRepository(),
            pointOfInterestMapper: pointOfInterestMapper(),
            pointsOfInterestGroupMapper: pointsOfInterestGroupMapper()
        )
    }

}

extension SwiftLeedsLiveDependencies {

    private func conferenceMapper() -> some ConferenceMapping {
        ConferenceMapper()
    }

    private func scheduleMapper() -> some ScheduleMapping {
        ScheduleMapper()
    }

    private func sponsorMapper() -> some SponsorMapping {
        SponsorMapper()
    }

    private func pointsOfInterestGroupMapper() -> some PointsOfInterestGroupMapping {
        PointsOfInterestGroupMapper(pointOfInterestMapper: pointOfInterestMapper())
    }

    private func pointOfInterestMapper() -> some PointOfInterestMapping {
        PointOfInterestMapper()
    }

}

extension SwiftLeedsLiveDependencies {

    private func scheduleRepository() -> some ScheduleRepository {
        ScheduleHTTPRepository(httpClient: httpClient)
    }

    private func sponsorRepository() -> some SponsorRepository {
        SponsorHTTPRepository(httpClient: httpClient)
    }

    private func locationRepository() -> some LocationRepository {
        LocationHTTPRepository(httpClient: httpClient)
    }

}

extension SwiftLeedsLiveDependencies {

    private var httpClient: some HTTPClient {
        HTTPURLSessionClient(urlSession: Self.urlSession)
    }

    private static let urlSession: URLSession = {
        .shared
    }()

}
