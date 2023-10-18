import Foundation

public final class ScheduleHTTPRepository: ScheduleRepository {

    private static let scheduleURL = URL(string: "https://swiftleeds.co.uk/api/v1/schedule")!

    private let httpClient: any HTTPClient
    private let decoder: JSONDecoder

    public convenience init(httpClient: some HTTPClient) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        self.init(httpClient: httpClient, decoder: decoder)
    }

    init(httpClient: some HTTPClient, decoder: JSONDecoder) {
        self.httpClient = httpClient
        self.decoder = decoder
    }

    public func schedule() async throws -> ScheduleDataModel {
        try await schedule(forEvent: nil)
    }

    public func schedule(forEvent eventID: UUID?) async throws -> ScheduleDataModel {
        let baseURL = Self.scheduleURL
        guard var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else {
            throw ScheduleRepositoryError.unknown()
        }

        var queryItems = urlComponents.queryItems ?? []
        if let eventID {
            queryItems.append(URLQueryItem(name: "event", value: eventID.uuidString))
        }
        urlComponents.queryItems = queryItems

        guard let url = urlComponents.url else {
            throw ScheduleRepositoryError.unknown()
        }

        let data: Data
        do {
            data = try await httpClient.get(url: url)
        } catch let error {
            throw ScheduleRepositoryError(error: error)
        }

        let response: ScheduleResponse
        do {
            response = try decoder.decode(ScheduleResponse.self, from: data)
        } catch let error {
            throw ScheduleRepositoryError.decode(error)
        }

        return response.data
    }

}
