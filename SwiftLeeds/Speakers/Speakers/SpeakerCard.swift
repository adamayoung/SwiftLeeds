import NukeUI
import SwiftLeedsKit
import SwiftUI

struct SpeakerCard: View {

    var speaker: Speaker

    var body: some View {
        VStack(alignment: .center) {
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
            .frame(width: 150, height: 150, alignment: .center)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))

            Text(speaker.name)
                .font(.headline)
                .bold()

            if let organisation = speaker.organisation {
                Text(organisation)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
        }
        .multilineTextAlignment(.center)
    }

}

#Preview(traits: .sizeThatFitsLayout) {
    SpeakerCard(speaker: .preview)
}
