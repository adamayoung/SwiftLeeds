import Foundation
import SwiftLeedsDomain

extension TimeSlotItem {

    init(timeSlotItem: SwiftLeedsDomain.TimeSlotItem, startDate: Date, endDate: Date) {
        switch timeSlotItem {
        case .activity(let activity):
            self = .activity(Activity(activity: activity))

        case .presentation(let presentation):
            self = .presentation(
                Presentation(
                    presentation: presentation,
                    startDate: startDate,
                    endDate: endDate
                )
            )
        }
    }

}
