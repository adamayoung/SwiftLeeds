import Foundation

public final class SponsorHTTPRepository: SponsorRepository {

    private static let sponsorsURL = URL(string: "https://swiftleeds.co.uk/api/v1/sponsors")!

    private let httpClient: any HTTPClient
    private let decoder: JSONDecoder

    public convenience init(httpClient: some HTTPClient) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        self.init(httpClient: httpClient, decoder: JSONDecoder())
    }

    init(httpClient: some HTTPClient, decoder: JSONDecoder) {
        self.httpClient = httpClient
        self.decoder = decoder
    }

    public func sponsors() async throws -> [SponsorDataModel] {
        let data: Data
        do {
            data = try await httpClient.get(url: Self.sponsorsURL)
        } catch let error {
            throw SponsorRepositoryError(error: error)
        }

        let response: SponsorsResponse
        do {
            response = try decoder.decode(SponsorsResponse.self, from: data)
        } catch let error {
            throw SponsorRepositoryError.decode(error)
        }

        return response.data
    }

}
