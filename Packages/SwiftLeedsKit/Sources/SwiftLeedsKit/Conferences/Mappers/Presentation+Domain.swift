import Foundation
import SwiftLeedsDomain

extension Presentation {

    init(presentation: SwiftLeedsDomain.Presentation, startDate: Date, endDate: Date) {
        self.init(
            id: presentation.id,
            title: presentation.title,
            synopsis: presentation.synopsis,
            speaker: Speaker(speaker: presentation.speaker),
            dateRange: startDate...endDate,
            slidoURL: presentation.slidoURL
        )
    }

}
