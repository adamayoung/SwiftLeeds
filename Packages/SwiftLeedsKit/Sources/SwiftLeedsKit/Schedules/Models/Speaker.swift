import Foundation

public struct Speaker: Identifiable, Hashable {

    public let id: UUID
    public let name: String
    public let organisation: String?
    public let biography: String
    public let profileImageURL: URL
    public let twitterHandle: String

    public var displayTwitterHandle: String {
        "@\(twitterHandle)"
    }

    public var twitterProfileURL: URL {
        URL(string: "https://twitter.com/\(twitterHandle)")!
    }

    public init(
        id: UUID,
        name: String,
        organisation: String? = nil,
        biography: String,
        profileImageURL: URL,
        twitterHandle: String
    ) {
        self.id = id
        self.name = name
        self.organisation = organisation
        self.biography = biography
        self.profileImageURL = profileImageURL
        self.twitterHandle = twitterHandle
    }

}

extension Speaker {

    // swiftlint:disable line_length
    public static var preview: Speaker {
        Speaker(
            id: UUID(uuidString: "CE7AF15B-D93E-4A06-941F-7A1221BF37D0")!,
            name: "Richie Flores",
            organisation: "Northrop Grumman",
            biography: "Hello World! I am a principal software engineer and iOS aficionado with a passion for designing impactful user experiences. With over 7 years of experience building software products, I have seen firsthand the difference that good UX design can make in driving business results. I believe that the key to creating successful software products lies in understanding the needs and pain points of users, and designing intuitive interfaces that make it easy for them to achieve their goals. Good UX design can make a difference in the AppStore by driving business results such as increased user engagement, higher conversion rates, and improved brand perception.",
            profileImageURL: URL(string: "https://swiftleeds-speakers.s3.eu-west-2.amazonaws.com/7A6E0452-E3F3-4FE7-A645-88D8A6B3DFA6-richie-flores.jpg")!,
            twitterHandle: "richiexflores"
        )
    }
    // swiftlint:enable line_length

    // swiftlint:disable line_length
    public static var previews: [Speaker] {
        [
            Speaker(
                id: UUID(uuidString: "CE7AF15B-D93E-4A06-941F-7A1221BF37D0")!,
                name: "Richie Flores",
                organisation: "Northrop Grumman",
                biography: "Hello World! I am a principal software engineer and iOS aficionado with a passion for designing impactful user experiences. With over 7 years of experience building software products, I have seen firsthand the difference that good UX design can make in driving business results. I believe that the key to creating successful software products lies in understanding the needs and pain points of users, and designing intuitive interfaces that make it easy for them to achieve their goals. Good UX design can make a difference in the AppStore by driving business results such as increased user engagement, higher conversion rates, and improved brand perception.",
                profileImageURL: URL(string: "https://swiftleeds-speakers.s3.eu-west-2.amazonaws.com/7A6E0452-E3F3-4FE7-A645-88D8A6B3DFA6-richie-flores.jpg")!,
                twitterHandle: "richiexflores"
            ),
            Speaker(
                id: UUID(uuidString: "5938594A-0032-4CFC-8184-75E8B2A3AAD1")!,
                name: "Tunde Adegoroye",
                organisation: "tundsdev & Bally’s Interactive",
                biography: "Tunde teaches SwiftUI and all things related to iOS development on YouTube @tundsdev. He is a Development Manager based in Manchester, UK. When he is not coding you can catch him travelling, watching anime, trying new foods & new experiences.",
                profileImageURL: URL(string: "https://swiftleeds-speakers.s3.eu-west-2.amazonaws.com/BA74EE92-CDF9-4E37-AC03-55F90F024456-tunde_adegoyoye.jpg")!,
                twitterHandle: "tundsdev"
            )
        ]
    }
    // swiftlint:enable line_length

}
