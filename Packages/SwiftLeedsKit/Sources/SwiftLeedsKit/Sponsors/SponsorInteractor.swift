import Foundation

func sponsorInterceptor(
    state: SponsorState,
    action: SponsorAction,
    dependencies: SponsorDependencies
) async -> SponsorAction? {
    switch action {
    case .fetchSponsors:
        let useCase = dependencies.fetchSponsorsUseCase()
        guard let sponsorModels = try? await useCase.execute() else {
            return nil
        }

        let sponsors = sponsorModels.map(Sponsor.init)

        return .setSponsors(sponsors)

    default:
        break
    }

    return nil
}
