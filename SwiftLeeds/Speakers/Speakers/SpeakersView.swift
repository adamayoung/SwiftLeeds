import SwiftLeedsKit
import SwiftUI

struct SpeakersView: View {

    var conference: Conference?

    @Environment(SwiftLeedsStore.self) private var store

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    private var speakers: [Speaker] {
        guard let conference else {
            return []
        }

        return store.schedules.speakers[conference.id] ?? []
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(speakers) { speaker in
                    NavigationLink(value: speaker) {
                        SpeakerCard(speaker: speaker)
                            .padding()
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .task {
            guard let conference else {
                return
            }

            await store.send(.schedules(.fetchSpeakers(conferenceID: conference.id)))
        }
        .navigationTitle("SPEAKERS")
    }

}

#Preview {
    let store = SwiftLeedsStore.preview

    return NavigationStack {
        SpeakersView(conference: .preview)
            .environment(store)
    }
}
