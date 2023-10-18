import Foundation
import SwiftLeedsKit

#if os(macOS)
enum Panel: Hashable {

    case conference
    case speakers
    case map
    case sponsors
    case pastConference(Conference)

}
#endif
