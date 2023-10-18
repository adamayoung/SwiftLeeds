import SwiftLeedsKit
import SwiftUI

struct ScheduleView: View {

    var conference: Conference

    @Environment(SwiftLeedsStore.self) private var store

    private var timeSlots: [TimeSlot] {
        guard let schedule = store.schedules.schedules[conference.id] else {
            return []
        }

        return schedule.timeSlots
    }

    var body: some View {
        List(timeSlots) { timeSlot in
            TimeSlotSection(timeSlot: timeSlot)
        }
        .refreshable {
            await refreshData()
        }
        .navigationTitle("SCHEDULE")
        .task {
            await refreshData()
        }
    }

    private func refreshData() async {
        await store.send(.schedules(.fetchSchedule(conferenceID: conference.id)))
    }

}

#Preview {
    let store = SwiftLeedsStore.preview

    return NavigationStack {
        ScheduleView(conference: .preview)
            .environment(store)
    }
}
