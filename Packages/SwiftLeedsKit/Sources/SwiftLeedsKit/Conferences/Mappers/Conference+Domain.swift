import Foundation
import SwiftLeedsDomain

extension Conference {

    init?(conference: SwiftLeedsDomain.Conference?) {
        guard let conference else {
            return nil
        }

        self.init(
            id: conference.id,
            name: conference.name,
            date: conference.date,
            location: conference.location
        )
    }

}
