import SwiftLeedsKit
import SwiftUI

struct SponsorsView: View {

    @Environment(SwiftLeedsStore.self) private var store

    private var sponsors: [SponsorLevel: [Sponsor]] {
        store.sponsors.sponsors
    }

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            ForEach(SponsorLevel.allCases, id: \.self) { sponsorLevel in
                if let sponsors = sponsors[sponsorLevel] {
                    let columns = columns(for: sponsorLevel)
                    Section {
                        LazyVGrid(columns: columns) {
                            ForEach(sponsors) { sponsor in
                                Link(destination: sponsor.url) {
                                    SponsorCard(sponsor: sponsor)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    } header: {
                        Text(sponsorLevel.localizedStringResource)
                    }
                }
            }
            .padding()
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .task {
            await store.send(.sponsors(.fetchSponsors))
        }
        .navigationTitle("SPONSORS")
    }

    private func columns(for sponsorLevel: SponsorLevel) -> [GridItem] {
        switch sponsorLevel {
        case .platinum:
            return [GridItem(.flexible())]

        case .silver:
            return [GridItem(.flexible()), GridItem(.flexible())]
        }
    }

}

#Preview {
    let store = SwiftLeedsStore.preview

    return NavigationStack {
        SponsorsView()
            .environment(store)
    }
}
