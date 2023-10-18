import SwiftData
import SwiftLeedsKit
import SwiftUI

struct ContentView: View {

    @Environment(SwiftLeedsStore.self) private var store
    @AppStorage("selectedPanel") private var selection: Panel = Panel.conference

    private var isReady: Bool {
        store.isReady
    }

    var body: some View {
        if isReady {
            content
        } else {
            loadingView
        }
    }

    private var content: some View {
        #if os(macOS)
            NavigationSplitView {
                Sidebar(selection: $selection)
            } detail: {
                NavigationStack {
                    DetailColumn(selection: $selection)
                }
            }
            .frame(minWidth: 600, minHeight: 450)
        #else
            AppTabView()
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
