import Foundation

public struct Activity: Identifiable, Hashable, Equatable {

    public let id: UUID
    public let title: String
    public let subtitle: String
    public let description: String
    public let imageURL: URL
    public let metadataURL: URL?

    public init(
        id: UUID,
        title: String,
        subtitle: String,
        description: String,
        imageURL: URL,
        metadataURL: URL? = nil
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.imageURL = imageURL
        self.metadataURL = metadataURL
    }

}

extension Activity {

    public static var preview: Activity {
        // swiftlint:disable line_length
        Activity(
            id: UUID(uuidString: "39E7B472-B792-4646-8841-E9BB5DC6DD30")!,
            title: "Registration & Breakfast",
            subtitle: "Time to check in 🎟",
            description: "The doors at The Playhouse will open at 8:30 AM and it's time to register, then once you have your badge you can check out the swag and T-Shirts. \r\nPlease bring along your QR code ticket for prompt entry and nothing else is required. \r\nThe SwiftLeeds team will greet you along with a fresh breakfast to start the first day.",
            imageURL: URL(string: "https://swiftleeds-speakers.s3.eu-west-2.amazonaws.com/3B000D4F-FBE1-4732-8F6A-EC1EE2127AB6-3893D677-2CA2-4BD5-AE1D-F9F69CE85139-LP_BuildingProgress_Aug2019-7-David-Lindsay-Photographer-scaled.jpeg")!,
            metadataURL: nil
        )
        // swiftlint:enable line_length
    }

}
