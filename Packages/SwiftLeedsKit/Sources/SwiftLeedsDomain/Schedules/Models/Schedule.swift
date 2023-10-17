import Foundation

public struct Schedule: Identifiable {

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
