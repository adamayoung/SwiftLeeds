import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

protocol ConferenceMapping {

    func map(event: SwiftLeedsData.EventDataModel) -> SwiftLeedsDomain.Conference

}
