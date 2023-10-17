import Foundation
import SwiftLeedsDomain

extension SponsorLevel {

    init(sponsorLevel: SwiftLeedsDomain.SponsorLevel) {
        switch sponsorLevel {
        case .platinum:
            self = .platinum

        case .silver:
            self = .silver
        }
    }

}
