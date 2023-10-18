import Foundation
import SwiftLeedsDomain

public protocol ScheduleDependencies {

    func fetchScheduleUseCase() -> any FetchScheduleUseCase

    func fetchSpeakersUseCase() -> any FetchSpeakersUseCase

}
