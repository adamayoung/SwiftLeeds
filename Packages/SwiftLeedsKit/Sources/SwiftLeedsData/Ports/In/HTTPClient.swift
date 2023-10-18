import Foundation

///
/// An interface for an HTTP client.
///
public protocol HTTPClient {


    /// 
    /// Performs an HTTP GET request.
    ///
    /// - Parameter url: The URL to get.
    ///
    /// - Throws: An ``HTTPClientError``.
    ///
    /// - Returns: Data from the response.
    ///
    func get(url: URL) async throws -> Data

}
