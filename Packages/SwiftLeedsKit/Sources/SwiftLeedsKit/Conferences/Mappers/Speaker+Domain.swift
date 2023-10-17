import Foundation
import SwiftLeedsDomain

extension Speaker {

    init(speaker: SwiftLeedsDomain.Speaker) {
        self.init(
            id: speaker.id,
            name: speaker.name,
            organisation: speaker.organisation,
            biography: speaker.biography,
            profileImageURL: speaker.profileImageURL,
            twitterHandle: speaker.twitter
        )
    }

}
