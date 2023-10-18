import Foundation
import SwiftLeedsData

final class HTTPMockClient: HTTPClient {

    var getResult: Result<Data, HTTPClientError> = .failure(.unknown)
    private(set) var hasGetBeenCalled = false
    private(set) var lastGetURL: URL?

    func get(url: URL) async throws -> Data {
        hasGetBeenCalled = true
        lastGetURL = url

        return try getResult.get()
    }

}
