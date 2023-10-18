import Foundation
import SwiftLeedsDomain

extension TimeSlot {

    init(timeSlot: SwiftLeedsDomain.TimeSlot) {
        self.init(
            id: timeSlot.id,
            startDate: timeSlot.startDate,
            endDate: timeSlot.endDate,
            item: TimeSlotItem(
                timeSlotItem: timeSlot.item,
                startDate: timeSlot.startDate,
                endDate: timeSlot.endDate
            )
        )
    }

}
