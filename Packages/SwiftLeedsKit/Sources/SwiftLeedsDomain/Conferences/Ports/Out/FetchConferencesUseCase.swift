import Foundation

public protocol FetchConferencesUseCase {

    func execute() async throws -> [Conference]

}
