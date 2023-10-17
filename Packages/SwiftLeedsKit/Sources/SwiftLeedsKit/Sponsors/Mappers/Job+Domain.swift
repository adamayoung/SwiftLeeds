import Foundation
import SwiftLeedsDomain

extension Job {

    init(job: SwiftLeedsDomain.Job) {
        self.init(
            id: job.id,
            title: job.title,
            details: job.details,
            location: job.location,
            url: job.url
        )
    }

}
