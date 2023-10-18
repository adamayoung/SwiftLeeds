import Foundation

///
/// An interface for a conference data source.
///
public protocol ConferenceDataSource {

    /// 
    /// Fetches the current conference.
    ///
    /// - Throws: A ``ConferenceDataSourceError``.
    ///
    /// - Returns: The current conference.
    ///
    func currentConference() async throws -> Conference?

    /// 
    /// Fetches all conferences.
    ///
    /// - Throws: A ``ConferenceDataSourceError``.
    ///
    /// - Returns: A list of all conferences.
    ///
    func conferences() async throws -> [Conference]

}
