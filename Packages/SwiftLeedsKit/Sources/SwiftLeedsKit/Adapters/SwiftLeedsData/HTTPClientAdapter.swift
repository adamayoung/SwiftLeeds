import Foundation
import Networking
import SwiftLeedsData

final class HTTPClientAdapter: SwiftLeedsData.HTTPClient {

    private let httpClient: any Networking.HTTPClient

    init(httpClient: some Networking.HTTPClient) {
        self.httpClient = httpClient
    }

    func get(url: URL) async throws -> Data {
        let data: Data
        do {
            data = try await httpClient.get(url: url)
        } catch let error {
            throw SwiftLeedsData.HTTPClientError(error: error)
        }

        return data
    }

}
