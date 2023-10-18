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

    public func venueLocation() async throws -> LocationDataModel {
        let data: Data
        do {
            data = try await httpClient.get(url: Self.localURL)
        } catch let error {
            throw LocationRepositoryError(error: error)
        }

        let response: LocationsResponse
        do {
            response = try decoder.decode(LocationsResponse.self, from: data)
        } catch let error {
            throw LocationRepositoryError.decode(error)
        }

        guard
            let venueGroup = response.data.first(where: { $0.name == "SwiftLeeds" }),
            let location = venueGroup.locations.first
        else {
            throw LocationRepositoryError.notFound
        }

        return location
    }

    public func locationGroups() async throws -> [LocationGroupDataModel] {
        let data: Data
        do {
            data = try await httpClient.get(url: Self.localURL)
        } catch let error {
            throw LocationRepositoryError(error: error)
        }

        let response: LocationsResponse
        do {
            response = try decoder.decode(LocationsResponse.self, from: data)
        } catch let error {
            throw LocationRepositoryError.decode(error)
        }

        return response.data
    }

}
