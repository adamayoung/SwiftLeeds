import SwiftLeedsKit
import SwiftUI

struct TimeSlotSection: View {

    var timeSlot: TimeSlot

    var body: some View {
        Section(timeSlot.displayTime) {
            switch timeSlot.item {
            case .activity(let activity):
                NavigationLink(value: activity) {
                    ActivityRow(activity: activity)
                }

            case .presentation(let presentation):
                NavigationLink(value: presentation) {
                    PresentationRow(presentation: presentation)
                }
            }
        }
    }
}

#Preview {
    List(TimeSlot.previews) { timeSlot in
        TimeSlotSection(timeSlot: timeSlot)
    }
}
