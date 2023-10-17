import Foundation
import SwiftLeedsDomain

extension Activity {

    init(activity: SwiftLeedsDomain.Activity) {
        self.init(
            id: activity.id,
            title: activity.title,
            subtitle: activity.subtitle,
            description: activity.description,
            imageURL: activity.imageURL,
            metadataURL: activity.metadataURL
        )
    }

}
