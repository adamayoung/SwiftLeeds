import NukeUI
import SwiftLeedsKit
import SwiftUI

struct SponsorCard: View {

    var sponsor: Sponsor

    private var logoHeight: CGFloat {
        switch sponsor.sponsorLevel {
        case .platinum:
            return 200

        case .silver:
            return 90
        }
    }

    private var nameFont: Font {
        switch sponsor.sponsorLevel {
        case .platinum:
            return .headline

        case .silver:
            return .caption
        }
    }

    private var subtitleFont: Font {
        switch sponsor.sponsorLevel {
        case .platinum:
            return .title

        case .silver:
            return .headline
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            LazyImage(url: sponsor.imageURL) { state in
                if let image = state.image {
                    image.resizable()
                        .aspectRatio(contentMode: .fit)

                } else if state.error != nil {
                    Color.red
                } else {
                    Color.secondary
                }
            }
            .padding()
            .frame(height: logoHeight, alignment: .center)

            Text(sponsor.name.uppercased())
                .font(nameFont)
                .foregroundStyle(Color.secondary)

            Text(sponsor.subtitle)
                .font(subtitleFont)
                .bold()

            Spacer()

            if !sponsor.jobs.isEmpty {
                Divider()

                Text("Jobs")
                    .font(.callout)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .padding()
        .multilineTextAlignment(.leading)
        .background(
            .regularMaterial,
            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
        )
    }

}

#Preview {
    SponsorCard(sponsor: .preview)
}
