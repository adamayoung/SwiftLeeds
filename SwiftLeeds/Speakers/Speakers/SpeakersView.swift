import SwiftLeedsKit
import SwiftUI

struct SpeakersView: View {

    @Environment(SwiftLeedsStore.self) private var store

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    private var speakers: [Speaker] {
        store.conferences.speakers
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
            await store.send(.conferences(.fetchSpeakers))
        }
        .navigationTitle("SPEAKERS")
    }

}

#Preview {
    let store = SwiftLeedsStore.preview

    return NavigationStack {
        SpeakersView()
            .environment(store)
    }
}
