import SwiftLeedsKit
import SwiftUI

struct ActivityRow: View {

    var activity: Activity

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(verbatim: activity.title)
                .font(.headline)
                .bold()

            if !activity.subtitle.isEmpty {
                Text(verbatim: activity.subtitle)
                    .font(.caption)
            }
        }
    }

}

#Preview {
    NavigationStack {
        List {
            ActivityRow(activity: .preview)
        }
    }
}
