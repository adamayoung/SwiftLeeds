import SwiftLeedsKit
import SwiftUI

struct PresentationSlidoRow: View {

    var slidoURL: URL

    var body: some View {
        Link(destination: slidoURL) {
            HStack {
                Image(.slidoIcon)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))

                VStack(alignment: .leading) {
                    Text("Q_AND_A")
                        .font(.headline)
                        .bold()

                    Text("SLIDO")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    PresentationSlidoRow(
        slidoURL: URL(string: "https://www.slido.com")!
    )
}
