import SwiftLeedsKit
import SwiftUI

struct PresentationRow: View {

    var presentation: Presentation

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(verbatim: presentation.title)
                .font(.headline)

            Text(verbatim: presentation.speaker.name.uppercased())
                .font(.caption)
                .bold()
                .foregroundStyle(Color.secondary)
        }
    }
}

#Preview {
    NavigationStack {
        List {
            PresentationRow(presentation: .preview)
        }
    }
}
