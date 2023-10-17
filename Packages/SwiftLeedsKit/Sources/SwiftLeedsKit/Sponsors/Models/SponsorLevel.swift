import Foundation

public enum SponsorLevel: CaseIterable, Hashable, Equatable, CustomLocalizedStringResourceConvertible {

    case platinum
    case silver

    public var localizedStringResource: LocalizedStringResource {
        switch self {
        case .platinum:
            return LocalizedStringResource("SPONSOR_LEVEL_PLATINUM")

        case .silver:
            return LocalizedStringResource("SPONSOR_LEVEL_SILVER")
        }
    }

}
