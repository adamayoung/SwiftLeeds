import Foundation

public struct TimeSlot: Identifiable, Equatable {

    public let id: UUID
    public let startDate: Date
    public let endDate: Date
    public let item: TimeSlotItem

    public var displayTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = .none
        dateFormatter.timeStyle = .short

        return dateFormatter.string(from: startDate)
    }

    public init(
        id: UUID,
        startDate: Date,
        endDate: Date,
        item: TimeSlotItem
    ) {
        self.id = id
        self.startDate = startDate
        self.endDate = endDate
        self.item = item
    }

}

extension TimeSlot {

    // swiftlint:disable line_length
    public static var preview: TimeSlot {
        TimeSlot(
            id: UUID(uuidString: "5A0D31E2-C9FA-4AB2-B4FF-5231F37D5F7C")!,
            startDate: Date(timeIntervalSince1970: 1696809600),
            endDate: Date(timeIntervalSince1970: 1696809900),
            item: .activity(Activity(
                id: UUID(uuidString: "39E7B472-B792-4646-8841-E9BB5DC6DD30")!,
                title: "Registration & Breakfast",
                subtitle: "Time to check in 🎟",
                description: "The doors at The Playhouse will open at 8:30 AM and it's time to register, then once you have your badge you can check out the swag and T-Shirts. \r\nPlease bring along your QR code ticket for prompt entry and nothing else is required. \r\nThe SwiftLeeds team will greet you along with a fresh breakfast to start the first day.",
                imageURL: URL(string: "https://swiftleeds-speakers.s3.eu-west-2.amazonaws.com/3B000D4F-FBE1-4732-8F6A-EC1EE2127AB6-3893D677-2CA2-4BD5-AE1D-F9F69CE85139-LP_BuildingProgress_Aug2019-7-David-Lindsay-Photographer-scaled.jpeg")!,
                metadataURL: nil
            ))
        )
    }
    // swiftlint:enable line_length

    // swiftlint:disable line_length
    public static var previews: [TimeSlot] {
        [
            TimeSlot(
                id: UUID(uuidString: "5A0D31E2-C9FA-4AB2-B4FF-5231F37D5F7C")!,
                startDate: Date(timeIntervalSince1970: 1696809600),
                endDate: Date(timeIntervalSince1970: 1696809900),
                item: .activity(Activity(
                    id: UUID(uuidString: "39E7B472-B792-4646-8841-E9BB5DC6DD30")!,
                    title: "Registration & Breakfast",
                    subtitle: "Time to check in 🎟",
                    description: "The doors at The Playhouse will open at 8:30 AM and it's time to register, then once you have your badge you can check out the swag and T-Shirts. \r\nPlease bring along your QR code ticket for prompt entry and nothing else is required. \r\nThe SwiftLeeds team will greet you along with a fresh breakfast to start the first day.",
                    imageURL: URL(string: "https://swiftleeds-speakers.s3.eu-west-2.amazonaws.com/3B000D4F-FBE1-4732-8F6A-EC1EE2127AB6-3893D677-2CA2-4BD5-AE1D-F9F69CE85139-LP_BuildingProgress_Aug2019-7-David-Lindsay-Photographer-scaled.jpeg")!,
                    metadataURL: nil
                ))
            ),
            TimeSlot(
                id: UUID(uuidString: "376BDB39-233E-4285-9120-75D330E6D15F")!,
                startDate: Date(timeIntervalSince1970: 1696809900),
                endDate: Date(timeIntervalSince1970: 169681000),
                item: .presentation(
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
                )
            )
        ]
    }
    // swiftlint:enable line_length

}
