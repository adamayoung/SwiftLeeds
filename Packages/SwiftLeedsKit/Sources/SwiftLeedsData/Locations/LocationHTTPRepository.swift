import Foundation

public class LocationHTTPRepository: LocationRepository {

    private static let localURL = URL(string: "https://swiftleeds.co.uk/api/v1/local")!

    private let httpClient: any HTTPClient
    private let decoder: JSONDecoder

    public convenience init(httpClient: some HTTPClient) {
        self.init(httpClient: httpClient, decoder: JSONDecoder())
    }

    init(httpClient: some HTTPClient, decoder: JSONDecoder) {
        self.httpClient = httpClient
        self.decoder = decoder
    }

    public func venueLocation() async throws -> LocationDataModel? {
        let data = try await httpClient.get(url: Self.localURL)

        let response = try decoder.decode(LocationsResponse.self, from: data)
        guard let venueGroup = response.data.first(where: { $0.name == "SwiftLeeds" }) else {
            return nil
        }

        return venueGroup.locations.first
    }

    public func locationGroups() async throws -> [LocationGroupDataModel] {
        let data = try await httpClient.get(url: Self.localURL)

        let response = try decoder.decode(LocationsResponse.self, from: data)

        return response.data
    }

}
