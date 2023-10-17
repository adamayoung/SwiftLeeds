import Foundation

public struct ConferenceState: Equatable {

    public internal(set) var current: Conference?
    public internal(set) var schedule: Schedule?
    public internal(set) var speakers: [Speaker]

    public init(
        current: Conference? = nil,
        schedule: Schedule? = nil,
        speakers: [Speaker] = []
    ) {
        self.current = current
        self.schedule = schedule
        self.speakers = speakers
    }

}

extension ConferenceState {

    public static var preview: ConferenceState {
        ConferenceState(
            current: Conference.preview,
            schedule: Schedule.preview,
            speakers: Speaker.previews
        )
    }

}
