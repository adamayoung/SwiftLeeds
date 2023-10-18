import Foundation

public final class FetchConferences: FetchConferencesUseCase {

    private let conferenceDataSource: any ConferenceDataSource

    public init(conferenceDataSource: some ConferenceDataSource) {
        self.conferenceDataSource = conferenceDataSource
    }

    public func execute() async throws -> [Conference] {
        let conferences: [Conference]
        do {
            conferences = try await conferenceDataSource.conferences()
        } catch let error {
            throw FetchConferencesError(error: error)
        }

        let sortedConferences = conferences.sorted { $0.date > $1.date }
        return sortedConferences
    }

}
