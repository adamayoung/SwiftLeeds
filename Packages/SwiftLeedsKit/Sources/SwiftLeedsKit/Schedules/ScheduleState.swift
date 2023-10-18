import Foundation

public struct ScheduleState: Equatable {

    public internal(set) var schedules: [UUID: Schedule]
    public internal(set) var speakers: [UUID: [Speaker]]

    public init(
        schedules: [UUID: Schedule] = [:],
        speakers: [UUID: [Speaker]] = [:]
    ) {
        self.schedules = schedules
        self.speakers = speakers
    }

}

extension ScheduleState {

    public static var preview: ScheduleState {
        ScheduleState(
            schedules: [Conference.preview.id: Schedule.preview],
            speakers: [Conference.preview.id: Speaker.previews]
        )
    }

}
