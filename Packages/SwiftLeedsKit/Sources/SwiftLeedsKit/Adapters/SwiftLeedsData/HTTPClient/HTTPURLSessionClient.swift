import Foundation
import SwiftLeedsData

final class HTTPURLSessionClient: HTTPClient {

    private let urlSession: URLSession

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    func get(url: URL) async throws -> Data {
        let (data, _) = try await urlSession.data(from: url)

        return data
    }

}
