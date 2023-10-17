import Foundation

public protocol ConferenceDataSource {

    func currentConference() async throws -> Conference?

    func conferences() async throws -> [Conference]

}
