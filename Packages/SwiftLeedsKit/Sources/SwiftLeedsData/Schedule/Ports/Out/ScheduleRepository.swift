import Foundation

public protocol ScheduleRepository {

    func schedule() async throws -> ScheduleDataModel

    func schedule(forEvent eventID: UUID?) async throws -> ScheduleDataModel

}
