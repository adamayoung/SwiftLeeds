import Foundation

public protocol ScheduleDataSource {

    func schedule(forConference conferenceID: UUID) async throws -> Schedule

}
