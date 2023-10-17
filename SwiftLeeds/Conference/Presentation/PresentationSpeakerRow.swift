import NukeUI
import SwiftLeedsKit
import SwiftUI

struct PresentationSpeakerRow: View {

    var speaker: Speaker

    var body: some View {
        HStack {
            LazyImage(url: speaker.profileImageURL) { state in
                if let image = state.image {
                    image.resizable()
                        .aspectRatio(contentMode: .fill)

                } else if state.error != nil {
                    Color.red
                } else {
                    Color.secondary
                }
            }
            .frame(width: 70, height: 70, alignment: .center)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))

            VStack(alignment: .leading) {
                Text(speaker.name)
                    .font(.headline)
                    .bold()

                Text(verbatim: speaker.displayTwitterHandle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    PresentationSpeakerRow(speaker: .preview)
}
