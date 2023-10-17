import Foundation
import SwiftLeedsDomain

public protocol SponsorDependencies {

    func fetchSponsorsUseCase() -> any FetchSponsorsUseCase

}
