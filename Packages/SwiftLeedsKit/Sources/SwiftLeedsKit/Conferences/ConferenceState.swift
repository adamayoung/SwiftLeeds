import Foundation

public struct ConferenceState: Equatable {

    public internal(set) var current: Conference?
    public internal(set) var all: [Conference]

    public var pastConferences: [Conference] {
        guard let current else {
            return []
        }

        return all.filter { conference in
            conference.date < current.date
        }
    }

    public init(
        current: Conference? = nil,
        all: [Conference] = []
    ) {
        self.current = current
        self.all = all
    }

}

extension ConferenceState {

    public static var preview: ConferenceState {
        ConferenceState(
            current: Conference.preview,
            all: Conference.previews
        )
    }

}
