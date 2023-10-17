import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

struct ConferenceMapper: ConferenceMapping {

    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter
    }()

    func map(event: SwiftLeedsData.EventDataModel) -> SwiftLeedsDomain.Conference {
        SwiftLeedsDomain.Conference(
            id: event.id,
            name: event.name,
            date: Self.dateFormatter.date(from: event.date)!,
            location: event.location
        )
    }

}
