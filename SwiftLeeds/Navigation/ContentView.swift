import SwiftData
import SwiftLeedsKit
import SwiftUI

struct ContentView: View {

    @Environment(SwiftLeedsStore.self) private var store
    @State private var selection: Panel = .conference

    private var isReady: Bool {
        store.isReady
    }

    private var currentConference: Conference? {
        store.conferences.current
    }

    var body: some View {
        if let currentConference, isReady {
            content(currentConference: currentConference)
        } else {
            loadingView
        }
    }

    @ViewBuilder
    private func content(currentConference: Conference) -> some View {
        #if os(macOS)
            NavigationSplitView {
                Sidebar(selection: $selection, currentConference: currentConference)
            } detail: {
                NavigationStack {
                    DetailColumn(selection: $selection, currentConference: currentConference)
                }
            }
            .frame(minWidth: 600, minHeight: 450)
        #else
            AppTabView(currentConference: currentConference)
        #endif
    }

    private var loadingView: some View {
        VStack(spacing: 80) {
            Image(systemName: "swift")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .foregroundStyle(Color.accentColor)

            ProgressView {
                Text("COMPILING")
            }
        }
    }

}

#Preview {
    let store = SwiftLeedsStore.preview

    return ContentView()
        .environment(store)
}
