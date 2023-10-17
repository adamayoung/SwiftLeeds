import Foundation

public struct PointOfInterestState: Equatable {

    public internal(set) var all: [PointsOfInterestGroup]
    public internal(set) var venue: Venue?

    public init(
        all: [PointsOfInterestGroup] = [],
        venue: Venue? = nil
    ) {
        self.all = all
        self.venue = venue
    }

}

extension PointOfInterestState {

    public static var preview: PointOfInterestState {
        PointOfInterestState(
            all: PointsOfInterestGroup.previews,
            venue: .preview
        )
    }

}
