import Foundation

public final class FetchCurrentConference: FetchCurrentConferenceUseCase {

    private let conferenceDataSource: any ConferenceDataSource

    public init(conferenceDataSource: some ConferenceDataSource) {
        self.conferenceDataSource = conferenceDataSource
    }

    public func execute() async throws -> Conference? {
        let conference: Conference?
        do {
            conference = try await conferenceDataSource.currentConference()
        } catch {
            return nil
        }

        return conference
    }

}
