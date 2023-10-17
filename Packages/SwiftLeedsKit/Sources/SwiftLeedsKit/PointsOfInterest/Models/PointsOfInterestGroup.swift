import Foundation

public struct PointsOfInterestGroup: Identifiable, Equatable {

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

#if canImport(SwiftUI)
import SwiftUI

extension PointsOfInterestGroup {

    public var image: Image {
        Image(systemName: symbolName)
    }

}
#endif

extension PointsOfInterestGroup {

    public static var preview: PointsOfInterestGroup {
        PointsOfInterestGroup(
            id: UUID(uuidString: "D5B5B6C9-D1BF-4B33-B77D-29C5C1DDB560")!,
            name: "SwiftLeeds",
            symbolName: "building.2.fill",
            pointsOfInterest: [
                PointOfInterest(
                    id: UUID(uuidString: "85C117E9-DFBD-4249-9639-83E9B1A343E4")!,
                    name: "Playhouse Theatre",
                    categoryName: "SwiftLeeds",
                    categorySymbolName: "building.2.fill",
                    url: URL(string: "https://leedsplayhouse.org.uk")!,
                    latitude: 53.798228,
                    longitude: -1.535243
                )
            ]
        )
    }

    public static var previews: [PointsOfInterestGroup] {
        [
            PointsOfInterestGroup(
                id: UUID(uuidString: "D5B5B6C9-D1BF-4B33-B77D-29C5C1DDB560")!,
                name: "SwiftLeeds",
                symbolName: "building.2.fill",
                pointsOfInterest: [
                    PointOfInterest(
                        id: UUID(uuidString: "85C117E9-DFBD-4249-9639-83E9B1A343E4")!,
                        name: "Playhouse Theatre",
                        categoryName: "SwiftLeeds",
                        categorySymbolName: "building.2.fill",
                        url: URL(string: "https://leedsplayhouse.org.uk")!,
                        latitude: 53.798228,
                        longitude: -1.535243
                    )
                ]
            ),
            PointsOfInterestGroup(
                id: UUID(uuidString: "0E46F4B7-0844-4C5B-8457-16A8C966BF58")!,
                name: "Places to Work",
                symbolName: "laptopcomputer",
                pointsOfInterest: [
                    PointOfInterest(
                        id: UUID(uuidString: "823B754C-D551-4234-BAF1-9AE444FDC5F5")!,
                        name: "Avenue HQ",
                        categoryName: "Places to Work",
                        categorySymbolName: "laptopcomputer",
                        url: URL(string: "https://www.avenue-hq.com/")!,
                        latitude: 53.79885392247382,
                        longitude: -1.548977202363078
                    ),
                    PointOfInterest(
                        id: UUID(uuidString: "F506EC86-C363-447E-8775-86627D76BE86")!,
                        name: "Park House by Spacemade",
                        categoryName: "Places to Work",
                        categorySymbolName: "laptopcomputer",
                        url: URL(string: "https://www.spacemade.co/locations/london/park-house/")!,
                        latitude: 53.798857519062445,
                        longitude: -1.5527801945845137
                    )
                ]
            )
        ]
    }

}
