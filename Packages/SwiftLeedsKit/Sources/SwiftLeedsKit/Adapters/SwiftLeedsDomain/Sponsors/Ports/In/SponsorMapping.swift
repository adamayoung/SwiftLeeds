import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

protocol SponsorMapping {

    func map(sponsor: SwiftLeedsData.SponsorDataModel) -> SwiftLeedsDomain.Sponsor?

}
