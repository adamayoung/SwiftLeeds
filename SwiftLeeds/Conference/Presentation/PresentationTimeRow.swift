import SwiftLeedsKit
import SwiftUI

struct PresentationTimeRow: View {

    var displayTime: String

    var body: some View {
        HStack {
            Image(systemName: "clock")
                .bold()

            Text(verbatim: displayTime)
                .font(.subheadline)
        }
    }

}

#Preview {
    PresentationTimeRow(displayTime: "01:00 - 02:00")
}
