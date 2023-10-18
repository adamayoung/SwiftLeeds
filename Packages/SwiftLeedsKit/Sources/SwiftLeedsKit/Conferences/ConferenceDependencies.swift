import Foundation
import SwiftLeedsDomain

public protocol ConferenceDependencies {

    func fetchConferencesUseCase() -> any FetchConferencesUseCase

    func fetchCurrentConferenceUseCase() -> any FetchCurrentConferenceUseCase

}
