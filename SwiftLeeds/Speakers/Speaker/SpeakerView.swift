import NukeUI
import SwiftLeedsKit
import SwiftUI

struct SpeakerView: View {

    var speaker: Speaker

    var body: some View {
        ScrollView {
            SpeakerHeader(speaker: speaker)
                .frame(height: 250)

            VStack(alignment: .leading, spacing: 30) {
                VStack(alignment: .leading) {
                    Text(speaker.name)
                        .font(.title)
                        .bold()

                    Link(destination: speaker.twitterProfileURL) {
                        Text(verbatim: speaker.displayTwitterHandle)
                    }
                    .foregroundStyle(.secondary)
                }

                if let organisation = speaker.organisation {
                    Text(organisation.uppercased())
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Text(speaker.biography)
            }
            .padding()
        }
        #if os(macOS)
        .navigationTitle(speaker.name)
        #endif
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }

}

#Preview {
    NavigationStack {
        SpeakerView(speaker: .preview)
    }
}
