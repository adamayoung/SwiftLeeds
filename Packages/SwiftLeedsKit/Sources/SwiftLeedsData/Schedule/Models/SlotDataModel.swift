import Foundation

public struct SlotDataModel: Decodable {

    public let id: UUID
    public let date: Date
    public let startTime: String
    public let duration: TimeInterval
    public let activity: ActivityDataModel?
    public let presentation: PresentationDataModel?

    public init(
        id: UUID,
        date: Date,
        startTime: String,
        duration: TimeInterval,
        activity: ActivityDataModel? = nil,
        presentation: PresentationDataModel? = nil
    ) {
        self.id = id
        self.date = date
        self.startTime = startTime
        self.duration = duration
        self.activity = activity
        self.presentation = presentation
    }

}
