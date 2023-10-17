import SwiftLeedsKit
import SwiftUI

struct PresentationView: View {

    var presentation: Presentation

    var body: some View {
        List {
            Section {
                Text(presentation.title)
                    .font(.largeTitle)
                    .bold()
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)

            Section {
                PresentationTimeRow(displayTime: presentation.displayTime)
                    .foregroundStyle(.secondary)
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)

            Section {
                NavigationLink(value: presentation.speaker) {
                    PresentationSpeakerRow(speaker: presentation.speaker)
                }
                .listRowSeparator(.hidden)
            }

            Section("SYNOPSIS") {
                Text(presentation.synopsis)
                    .listRowSeparator(.hidden)
            }

            Section("RELATED") {
                if let slidoURL = presentation.slidoURL {
                    PresentationSlidoRow(slidoURL: slidoURL)
                        .listRowSeparator(.hidden)
                }
            }
        }
        .listStyle(.plain)
        #if os(macOS)
        .navigationTitle(presentation.title)
        #endif
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }

}

#Preview {
    NavigationStack {
        PresentationView(presentation: .preview)
    }
}
