import SwiftLeedsKit
import SwiftUI

struct DetailColumn: View {

    @Binding var selection: Panel

    var body: some View {
        switch selection {
        case .conference:
            NavigationStack {
                ScheduleView()
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
                SpeakersView()
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
        }
    }

}
