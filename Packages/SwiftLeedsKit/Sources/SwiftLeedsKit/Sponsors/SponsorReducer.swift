import Foundation

public func sponsorReducer(state: SponsorState, action: SponsorAction) -> SponsorState {
    var state = state

    switch action {
    case .setSponsors(let sponsors):
        let grouped = Sponsor.groupByLevel(sponsors: sponsors)
        state.sponsors = grouped

    default:
        break
    }

    return state
}
