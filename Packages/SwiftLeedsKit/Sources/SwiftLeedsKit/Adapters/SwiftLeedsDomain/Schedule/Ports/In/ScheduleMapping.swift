import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

protocol ScheduleMapping {

    func map(conferenceID: UUID, slots: [SwiftLeedsData.SlotDataModel]) -> SwiftLeedsDomain.Schedule

}
