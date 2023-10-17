import SwiftLeedsKit
import SwiftUI

struct ActivityView: View {

    var activity: Activity

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                Text(activity.title)
                    .font(.system(size: 50))
                    .bold()
                    .multilineTextAlignment(.leading)

                Text(activity.subtitle)
                    .font(.headline)
                    .foregroundStyle(.secondary)

                Text(activity.description)
            }
            .padding()
        }
        #if os(macOS)
        .navigationTitle(activity.title)
        #endif
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }

}

#Preview {
    NavigationStack {
        ActivityView(activity: .preview)
    }
}
