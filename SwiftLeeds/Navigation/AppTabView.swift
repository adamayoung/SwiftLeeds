import SwiftLeedsKit
import SwiftUI

struct AppTabView: View {

    @AppStorage("selectedTab") private var selectedTab: Tab = .conference

    var body: some View {
        TabView(selection: $selectedTab) {
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
            .tabItem {
                Label("CONFERENCE", systemImage: "wallet.pass")
            }
            .tag(Tab.conference)

            NavigationStack {
                SpeakersView()
                    .navigationDestination(for: Speaker.self) { speaker in
                        SpeakerView(speaker: speaker)
                    }
            }
            .tabItem {
                Label("SPEAKERS", systemImage: "rectangle.3.group.bubble.fill")
            }
            .tag(Tab.speakers)

            PointsOfInterestMapView()
                .tabItem {
                    Label("MAP", systemImage: "map")
                }
                .tag(Tab.map)

            NavigationStack {
                SponsorsView()
            }
            .tabItem {
                Label("SPONSORS", systemImage: "wand.and.stars")
            }
            .tag(Tab.sponsors)
        }
    }

}

extension AppTabView {

    private enum Tab: String {
        case conference
        case speakers
        case map
        case sponsors
    }

}

#Preview {
    let store = SwiftLeedsStore.preview

    return NavigationStack {
        AppTabView()
            .environment(store)
    }
}
