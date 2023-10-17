import Foundation
import SwiftLeedsDomain

extension Schedule {

    init?(schedule: SwiftLeedsDomain.Schedule?) {
        guard let schedule else {
            return nil
        }

        self.init(
            conferenceID: schedule.conferenceID,
            timeSlots: schedule.timeSlots.map(TimeSlot.init)
        )
    }

}
