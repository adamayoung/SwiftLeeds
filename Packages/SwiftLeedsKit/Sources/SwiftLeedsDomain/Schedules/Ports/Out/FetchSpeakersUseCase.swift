import Foundation

public protocol FetchSpeakersUseCase {

    func execute(conferenceID: UUID) async throws -> [Speaker]

}
