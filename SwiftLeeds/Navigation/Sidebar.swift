import SwiftUI

#if os(macOS)
struct Sidebar: View {

    @Binding var selection: Panel

    var body: some View {
        List(selection: $selection) {
            Section {
                NavigationLink(value: Panel.conference) {
                    Label("Schedule", systemImage: "wallet.pass")
                }

                NavigationLink(value: Panel.speakers) {
                    Label("SPEAKERS", systemImage: "rectangle.3.group.bubble.fill")
                }

                NavigationLink(value: Panel.map) {
                    Label("MAP", systemImage: "map")
                }

                NavigationLink(value: Panel.sponsors) {
                    Label("SPONSORS", systemImage: "wand.and.stars")
                }
            }
        }
        #if os(macOS)
        .listStyle(.sidebar)
        .navigationSplitViewColumnWidth(min: 200, ideal: 200)
        #endif
    }

}

#Preview {
    Sidebar(selection: .constant(.conference))
}
#endif
