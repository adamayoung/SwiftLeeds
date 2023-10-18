import Foundation

public protocol LocationRepository {

    func venueLocation() async throws -> LocationDataModel

    func locationGroups() async throws -> [LocationGroupDataModel]

}
