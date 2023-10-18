import Foundation

///
/// Use case interface to fetch the current conference.
///
public protocol FetchCurrentConferenceUseCase {

    ///
    /// Fetches the current conference.
    ///
    /// - Throws: A ``FetchCurrentConferenceError``
    ///
    /// - Returns: The current conference, if available.
    ///
    func execute() async throws -> Conference?

}
