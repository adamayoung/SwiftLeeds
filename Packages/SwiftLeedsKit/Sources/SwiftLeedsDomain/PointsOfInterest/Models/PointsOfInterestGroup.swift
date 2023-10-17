import Foundation

public struct PointsOfInterestGroup: Identifiable {

    public let id: UUID
    public let name: String
    public let symbolName: String
    public let pointsOfInterest: [PointOfInterest]

    public init(
        id: UUID,
        name: String,
        symbolName: String,
        pointsOfInterest: [PointOfInterest]
    ) {
        self.id = id
        self.name = name
        self.symbolName = symbolName
        self.pointsOfInterest = pointsOfInterest
    }

}
