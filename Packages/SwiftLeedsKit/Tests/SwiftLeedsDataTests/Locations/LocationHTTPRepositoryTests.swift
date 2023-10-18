@testable import SwiftLeedsData
import XCTest

final class LocationHTTPRepositoryTests: XCTestCase {

    var repository: LocationHTTPRepository!
    var httpClient: HTTPMockClient!
    var decoder: JSONDecoder!
    var encoder: JSONEncoder!

    override func setUp() {
        super.setUp()
        httpClient = HTTPMockClient()
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        repository = LocationHTTPRepository(httpClient: httpClient, decoder: decoder)
    }

    override func tearDown() {
        repository = nil
        encoder = nil
        decoder = nil
        httpClient = nil
        super.tearDown()
    }

}

extension LocationHTTPRepositoryTests {

    func testVenueLocationShouldRequestFromURL() async throws {
        let expectedURL = try XCTUnwrap(URL(string: "https://swiftleeds.co.uk/api/v1/local"))

        _ = try? await repository.venueLocation()

        XCTAssertTrue(httpClient.hasGetBeenCalled)
        XCTAssertEqual(httpClient.lastGetURL, expectedURL)
    }

    func testVenueLocationWhenHTTPClientThrowsErrorShouldThrowError() async throws {
        httpClient.getResult = .failure(HTTPClientError.unknown)

        var repositoryError: Error?
        do {
            _ = try await repository.venueLocation()
        } catch let error {
            repositoryError = error
        }

        let error = try XCTUnwrap(repositoryError)

        XCTAssertTrue(error is LocationRepositoryError)
    }

    func testVenueLocationWhenDataDecodeErrorShouldThrowError() async throws {
        let data = try XCTUnwrap("Some data".data(using: .utf8))
        httpClient.getResult = .success(data)

        var repositoryError: Error?
        do {
            _ = try await repository.venueLocation()
        } catch let error {
            repositoryError = error
        }

        let error = try XCTUnwrap(repositoryError as? LocationRepositoryError)

        switch error {
        case .decode:
            XCTAssertTrue(true)

        default:
            XCTFail("Error type does not match .decode()")
        }
    }

    func testVenueLocationWhenVenueNotFoundShouldThrowError() async throws {
        let data = try XCTUnwrap("{ \"data\": [] }".data(using: .utf8))
        httpClient.getResult = .success(data)

        var repositoryError: Error?
        do {
            _ = try await repository.venueLocation()
        } catch let error {
            repositoryError = error
        }

        let error = try XCTUnwrap(repositoryError as? LocationRepositoryError)

        switch error {
        case .notFound:
            XCTAssertTrue(true)

        default:
            XCTFail("Error type does not match .decode()")
        }
    }

    func testVenueLocationWhenSwiftLeedsGroupNotFoundShouldThrowError() async throws {
        let data = try XCTUnwrap(#"""
            {
                "data": [
                    {
                        "id": "9C718636-A15A-4F13-A45A-82B6B78054BF",
                        "name": "Group 1",
                        "symbolName": "symbol.name",
                        "locations": []
                    }
                ]
            }
        """#.data(using: .utf8))
        httpClient.getResult = .success(data)

        var repositoryError: Error?
        do {
            _ = try await repository.venueLocation()
        } catch let error {
            repositoryError = error
        }

        let error = try XCTUnwrap(repositoryError as? LocationRepositoryError)

        switch error {
        case .notFound:
            XCTAssertTrue(true)

        default:
            XCTFail("Error type does not match .decode()")
        }
    }

    func testVenueLocationShouldReturnLocation() async throws {
        let data = try XCTUnwrap(#"""
            {
                "data": [
                    {
                        "id": "9344A28A-A852-4AB8-ADEC-56F1D884477A",
                        "name": "SwiftLeeds",
                        "symbolName": "symbol.name",
                        "locations": [
                            {
                                "id": "E9E9E702-4EA8-4323-AF67-4794AA56B5FC",
                                "name": "Location 1",
                                "url": "https://domain.com/location1",
                                "lat": 0.1,
                                "lon": -0.1
                            },
                            {
                                "id": "49A79315-CB9A-4CC4-AD5B-F5842FAB358F",
                                "name": "Location 2",
                                "url": "https://domain.com/location2",
                                "lat": 0.2,
                                "lon": -0.2
                            }
                        ]
                    },
                    {
                        "id": "8553E5FB-EFCE-4DFB-B1A2-BA37DB456962",
                        "name": "Group 1",
                        "symbolName": "symbol.name",
                        "locations": []
                    }
                ]
            }
        """#.data(using: .utf8))
        httpClient.getResult = .success(data)
        let expectedLocationID = try XCTUnwrap(UUID(uuidString: "E9E9E702-4EA8-4323-AF67-4794AA56B5FC"))

        let location = try await repository.venueLocation()

        XCTAssertEqual(location.id, expectedLocationID)
    }

}

extension LocationHTTPRepositoryTests {

    func testLocationGroupsShouldRequestFromURL() async throws {
        let expectedURL = try XCTUnwrap(URL(string: "https://swiftleeds.co.uk/api/v1/local"))

        _ = try? await repository.locationGroups()

        XCTAssertTrue(httpClient.hasGetBeenCalled)
        XCTAssertEqual(httpClient.lastGetURL, expectedURL)
    }

    func testLocationGroupsWhenHTTPClientThrowsErrorShouldThrowError() async throws {
        httpClient.getResult = .failure(HTTPClientError.unknown)

        var repositoryError: Error?
        do {
            _ = try await repository.locationGroups()
        } catch let error {
            repositoryError = error
        }

        let error = try XCTUnwrap(repositoryError)

        XCTAssertTrue(error is LocationRepositoryError)
    }

    func testLocationGroupsWhenDataDecodeErrorShouldThrowError() async throws {
        let data = try XCTUnwrap("Some data".data(using: .utf8))
        httpClient.getResult = .success(data)

        var repositoryError: Error?
        do {
            _ = try await repository.locationGroups()
        } catch let error {
            repositoryError = error
        }

        let error = try XCTUnwrap(repositoryError as? LocationRepositoryError)

        switch error {
        case .decode:
            XCTAssertTrue(true)

        default:
            XCTFail("Error type does not match .decode()")
        }
    }

    func testLocationGroupsShouldReturnLocation() async throws {
        let data = try XCTUnwrap(#"""
            {
                "data": [
                    {
                        "id": "9344A28A-A852-4AB8-ADEC-56F1D884477A",
                        "name": "SwiftLeeds",
                        "symbolName": "symbol.name",
                        "locations": [
                            {
                                "id": "E9E9E702-4EA8-4323-AF67-4794AA56B5FC",
                                "name": "Location 1",
                                "url": "https://domain.com/location1",
                                "lat": 0.1,
                                "lon": -0.1
                            }
                        ]
                    },
                    {
                        "id": "8553E5FB-EFCE-4DFB-B1A2-BA37DB456962",
                        "name": "Group 1",
                        "symbolName": "symbol.name",
                        "locations": [
                            {
                                "id": "49A79315-CB9A-4CC4-AD5B-F5842FAB358F",
                                "name": "Location 2",
                                "url": "https://domain.com/location2",
                                "lat": 0.2,
                                "lon": -0.2
                            }
                        ]
                    }
                ]
            }
        """#.data(using: .utf8))
        httpClient.getResult = .success(data)

        let groups = try await repository.locationGroups()

        XCTAssertEqual(groups.count, 2)
        XCTAssertEqual(groups[0].id, UUID(uuidString: "9344A28A-A852-4AB8-ADEC-56F1D884477A"))
        XCTAssertEqual(groups[1].id, UUID(uuidString: "8553E5FB-EFCE-4DFB-B1A2-BA37DB456962"))
    }

}
