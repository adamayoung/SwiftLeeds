import SwiftLeedsKit
import SwiftUI

#if os(macOS)
struct Sidebar: View {

    @Binding var selection: Panel
    var currentConference: Conference

    @Environment(SwiftLeedsStore.self) private var store

    private var pastConferences: [Conference] {
        store.conferences.pastConferences
    }

    var body: some View {
        List(selection: $selection) {
            Section(currentConference.name) {
                NavigationLink(value: Panel.conference) {
                    Label("SCHEDULE", systemImage: "wallet.pass")
                }

                NavigationLink(value: Panel.speakers) {
                    Label("SPEAKERS", systemImage: "person.bubble")
                }

                NavigationLink(value: Panel.map) {
                    Label("MAP", systemImage: "map")
                }

                NavigationLink(value: Panel.sponsors) {
                    Label("SPONSORS", systemImage: "wand.and.stars")
                }
            }

            if !pastConferences.isEmpty {
                Section("PREVIOUS_CONFERENCES") {
                    ForEach(pastConferences) { conference in
                        NavigationLink(value: Panel.pastConference(conference)) {
                            Label(conference.name, systemImage: "wallet.pass")
                        }
                    }
                }
            }
        }
        #if os(macOS)
        .listStyle(.sidebar)
        .navigationSplitViewColumnWidth(min: 200, ideal: 200)
        #endif
        .task {
            await store.send(.conferences(.fetchConferences))
        }
    }

}

#Preview {
    let store = SwiftLeedsStore.preview

    return NavigationSplitView {
        Sidebar(
            selection: .constant(.conference),
            currentConference: .preview
        )
    } detail: {
        Text(verbatim: "Detail")
    }
    .environment(store)

}
#endif
