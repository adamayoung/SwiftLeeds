import SwiftLeedsKit
import SwiftUI

struct ScheduleView: View {

    @Environment(SwiftLeedsStore.self) private var store

    private var timeSlots: [TimeSlot] {
        store.conferences.schedule?.timeSlots ?? []
    }

    var body: some View {
        List(timeSlots) { timeSlot in
            TimeSlotSection(timeSlot: timeSlot)
        }
        .refreshable {
            await store.send(.conferences(.fetchCurrentSchedule))
        }
        .navigationTitle("SCHEDULE")
        .task {
            await store.send(.conferences(.fetchCurrentSchedule))
        }
    }
}

#Preview {
    let store = SwiftLeedsStore.preview

    return NavigationStack {
        ScheduleView()
            .environment(store)
    }
}
