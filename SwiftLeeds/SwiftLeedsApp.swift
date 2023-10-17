import SwiftData
import SwiftLeedsKit
import SwiftUI

@main
struct SwiftLeedsApp: App {

    @State private var store = SwiftLeedsStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(store)
                .task {
                    await store.send(.conferences(.fetchCurrentConference))
                }
        }
    }

}
