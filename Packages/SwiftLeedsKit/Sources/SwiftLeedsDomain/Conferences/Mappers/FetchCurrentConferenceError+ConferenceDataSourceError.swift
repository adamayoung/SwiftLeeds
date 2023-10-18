import Foundation

extension FetchCurrentConferenceError {

    init(error: Error) {
        guard let error = error as? ConferenceDataSourceError else {
            self = .unknown(error)
            return
        }

        self = .unknown(error)
    }

}
