import Foundation

public struct TimeSlot: Identifiable {

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
