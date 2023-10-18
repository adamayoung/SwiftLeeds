import SwiftLeedsKit
import SwiftUI

struct BrowseView: View {

    @Environment(SwiftLeedsStore.self) private var store

    private var conferences: [Conference] {
        store.conferences.pastConferences
    }

    var body: some View {
        List(conferences) { conference in
            NavigationLink(value: conference) {
                Label(conference.name, systemImage: "wallet.pass.fill")
            }
        }
        .navigationTitle("BROWSE")
        .task {
            await store.send(.conferences(.fetchCurrentConference))
            await store.send(.conferences(.fetchConferences))
        }
    }

}

#Preview {
    let store = SwiftLeedsStore.preview

    return NavigationStack {
        BrowseView()
            .environment(store)
    }

}
