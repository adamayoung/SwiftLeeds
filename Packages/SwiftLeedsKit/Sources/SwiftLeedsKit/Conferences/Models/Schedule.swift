import Foundation

public struct Schedule: Identifiable, Equatable {

    public var id: String { "conference-\(conferenceID.uuidString)" }
    public let conferenceID: UUID
    public let timeSlots: [TimeSlot]

    public init(
        conferenceID: UUID,
        timeSlots: [TimeSlot]
    ) {
        self.conferenceID = conferenceID
        self.timeSlots = timeSlots
    }

}

extension Schedule {

    public static var preview: Schedule {
        Schedule(
            conferenceID: UUID(uuidString: "2D951908-1679-4D02-944B-54579698888B")!,
            timeSlots: TimeSlot.previews
        )
    }

}
