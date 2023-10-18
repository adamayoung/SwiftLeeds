import Foundation

public final class HTTPURLSessionClient: HTTPClient {

    private let urlSession: URLSession

    public init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    public func get(url: URL) async throws -> Data {
        let (data, response): (Data, URLResponse)

        do {
            (data, response) = try await urlSession.data(from: url)
        } catch let error {
            throw HTTPClientError.network(error)
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            throw HTTPClientError.unknown
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw HTTPClientError.invalidStatusCode(httpResponse.statusCode)
        }

        return data
    }

}
