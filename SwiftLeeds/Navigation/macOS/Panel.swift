import Foundation
import SwiftLeedsKit

enum Panel: Hashable {

    case conference
    case speakers
    case map
    case sponsors
    case pastConference(Conference)

}
