import Foundation

///
/// Use case interface to fetch all conferences.
///
public protocol FetchConferencesUseCase {

    ///
    /// Fetches all conferences.
    ///
    /// - Throws: A ``FetchConferencesError``
    ///
    /// - Returns: All conferences, past and present.
    ///
    func execute() async throws -> [Conference]

}
