import SwiftLeedsKit
import SwiftUI

struct DetailColumn: View {

    @Binding var selection: Panel
    var currentConference: Conference

    @Environment(SwiftLeedsStore.self) private var store

    var body: some View {
        switch selection {
        case .conference:
            NavigationStack {
                ScheduleView(conference: currentConference)
                    .navigationDestination(for: Presentation.self) { presentation in
                        PresentationView(presentation: presentation)
                    }
                    .navigationDestination(for: Activity.self) { activity in
                        ActivityView(activity: activity)
                    }
                    .navigationDestination(for: Speaker.self) { speaker in
                        SpeakerView(speaker: speaker)
                    }
            }

        case .speakers:
            NavigationStack {
                SpeakersView(conference: currentConference)
                    .navigationDestination(for: Speaker.self) { speaker in
                        SpeakerView(speaker: speaker)
                    }
            }

        case .map:
            PointsOfInterestMapView()

        case .sponsors:
            NavigationStack {
                SponsorsView()
            }

        case .pastConference(let conference):
            NavigationStack {
                ScheduleView(conference: conference)
                    .navigationDestination(for: Presentation.self) { presentation in
                        PresentationView(presentation: presentation)
                    }
                    .navigationDestination(for: Activity.self) { activity in
                        ActivityView(activity: activity)
                    }
                    .navigationDestination(for: Speaker.self) { speaker in
                        SpeakerView(speaker: speaker)
                    }
            }
            .id(conference.id)
        }
    }

}
