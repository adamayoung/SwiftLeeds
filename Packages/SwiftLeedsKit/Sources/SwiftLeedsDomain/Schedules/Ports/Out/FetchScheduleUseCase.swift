import Foundation

public protocol FetchScheduleUseCase {

    func execute(conferenceID: UUID) async throws -> Schedule

}
