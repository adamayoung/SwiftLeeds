import Foundation

public struct Presentation: Identifiable, Hashable, Equatable {

    public let id: UUID
    public let title: String
    public let synopsis: String
    public let speaker: Speaker
    public let dateRange: ClosedRange<Date>
    public let slidoURL: URL?

    public var displayTime: String {
        let startTime = dateRange.lowerBound.formatted(.dateTime.hour().minute())
        let endTime = dateRange.upperBound.formatted(.dateTime.hour().minute())
        return "\(startTime) - \(endTime)"
    }

    public init(
        id: UUID,
        title: String,
        synopsis: String,
        speaker: Speaker,
        dateRange: ClosedRange<Date>,
        slidoURL: URL? = nil
    ) {
        self.id = id
        self.title = title
        self.synopsis = synopsis
        self.speaker = speaker
        self.dateRange = dateRange
        self.slidoURL = slidoURL
    }

}

extension Presentation {

    // swiftlint:disable line_length
    public static var preview: Presentation {
        Presentation(
            id: UUID(uuidString: "AAB3A73E-4DA0-4C19-9C68-2175F189E6A9")!,
            title: "Driving Success with UX: Unlocking Your iOS App's Full Potential",
            synopsis: "In this talk, we’ll explore how good UX design can drive business results for iOS apps, and share best practices for integrating UX design into your app development process.\r\n\r\nAs iOS development continues to evolve and become more competitive, it's increasingly important for businesses to focus on creating great user experiences. In this talk, I will share real-world examples of how good UX design has driven business results for iOS apps, including increased user engagement, higher conversion rates, and improved brand perception.\r\n\r\nI will also provide practical tips and strategies for incorporating UX design into your iOS development process, from conducting user research to designing intuitive user interfaces. Attendees will leave with a deeper understanding of the value of UX in iOS development, as well as actionable insights they can use to improve their own app design and development practices.",
            speaker: Speaker(
                id: UUID(uuidString: "CE7AF15B-D93E-4A06-941F-7A1221BF37D0")!,
                name: "Richie Flores",
                organisation: "Northrop Grumman",
                biography: "Hello World! I am a principal software engineer and iOS aficionado with a passion for designing impactful user experiences. With over 7 years of experience building software products, I have seen firsthand the difference that good UX design can make in driving business results. I believe that the key to creating successful software products lies in understanding the needs and pain points of users, and designing intuitive interfaces that make it easy for them to achieve their goals. Good UX design can make a difference in the AppStore by driving business results such as increased user engagement, higher conversion rates, and improved brand perception.",
                profileImageURL: URL(string: "https://swiftleeds-speakers.s3.eu-west-2.amazonaws.com/7A6E0452-E3F3-4FE7-A645-88D8A6B3DFA6-richie-flores.jpg")!,
                twitterHandle: "richiexflores"
            ),
            dateRange: Date(timeIntervalSince1970: 1696809600)...Date(timeIntervalSince1970: 1696809900),
            slidoURL: URL(string: "https://app.sli.do/event/jHmthXSatH6w4BUEyjpDPa")!
        )
    }
    // swiftlint:enable line_length

}
