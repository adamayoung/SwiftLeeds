import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

extension ConferenceDataSourceError {

    init(error: Error) {
        guard let error = error as? ScheduleRepositoryError else {
            self = .unknown(error)
            return
        }

        self = .unknown(error)
    }

}
