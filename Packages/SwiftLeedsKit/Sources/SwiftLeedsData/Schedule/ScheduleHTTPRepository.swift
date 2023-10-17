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
        let data = try await httpClient.get(url: Self.scheduleURL)

        let response = try decoder.decode(ScheduleResponse.self, from: data)

        return response.data
    }

}
