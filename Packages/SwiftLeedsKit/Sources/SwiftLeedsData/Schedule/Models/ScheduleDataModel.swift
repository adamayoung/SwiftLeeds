import Foundation

public struct ScheduleDataModel: Decodable {

    public let event: EventDataModel
    public let events: [EventDataModel]
    public let slots: [SlotDataModel]

    public init(
        event: EventDataModel,
        events: [EventDataModel],
        slots: [SlotDataModel]
    ) {
        self.event = event
        self.events = events
        self.slots = slots
    }

}
