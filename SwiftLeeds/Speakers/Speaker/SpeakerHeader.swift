import NukeUI
import SwiftLeedsKit
import SwiftUI

struct SpeakerHeader: View {

    var speaker: Speaker

    var body: some View {
        ZStack {
            Rectangle()
                .offset(CGSize(width: 0, height: -100.0))

            ZStack {
                LazyImage(url: speaker.profileImageURL) { state in
                    if let image = state.image {

                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250, height: 250, alignment: .center)
                    } else if state.error != nil {
                        Color.red
                    } else {
                        Color.secondary
                    }
                }
                .clipShape(Circle())

                Circle()
                    .stroke(Color.white, lineWidth: 5)
                    .frame(width: 250, height: 250, alignment: .center)
                    .foregroundColor(.clear)
            }
        }
    }

}

#Preview {
    SpeakerHeader(speaker: .preview)
}
