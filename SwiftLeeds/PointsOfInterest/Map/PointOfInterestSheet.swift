import SwiftLeedsKit
import SwiftUI

struct PointOfInterestSheet: View {

    var pointOfInterest: PointOfInterest

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 25) {
                    VStack(alignment: .leading) {
                        Text(verbatim: pointOfInterest.categoryName.uppercased())
                            .font(.caption)
                            .foregroundStyle(Color.secondary)

                        Text(verbatim: pointOfInterest.name)
                            .font(.title)
                            .bold()
                    }

                    VStack(alignment: .leading) {
                        Text("WEB_SITE")
                            .font(.subheadline)
                            .foregroundStyle(Color.secondary)

                        HStack {
                            Image(systemName: "link")
                                .font(.caption)

                            Link(pointOfInterest.url.absoluteString, destination: pointOfInterest.url)
                        }
                    }
                }
                .padding(.horizontal)

                Spacer()

                Button("CLOSE", systemImage: "xmark.circle.fill") {
                    dismiss()
                }
                .font(.title)
                .labelStyle(.iconOnly)
                .foregroundStyle(Color.gray)
            }
            .padding()

            Spacer()
        }
    }

}

#Preview {
    Color.secondary
        .ignoresSafeArea()
        .sheet(isPresented: .constant(true)) {
            PointOfInterestSheet(pointOfInterest: .preview)
                .presentationBackground(.thinMaterial)
                .presentationDetents([.height(170)])
        }
}
