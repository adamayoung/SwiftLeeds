import Foundation

public enum SponsorLevelDataModel: String, Decodable {

    case platinum
    case silver
    case unknown

    public init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }

}
