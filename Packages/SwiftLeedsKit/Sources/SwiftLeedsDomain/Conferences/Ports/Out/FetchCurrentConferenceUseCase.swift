import Foundation

public protocol FetchCurrentConferenceUseCase {

    func execute() async throws -> Conference?

}
