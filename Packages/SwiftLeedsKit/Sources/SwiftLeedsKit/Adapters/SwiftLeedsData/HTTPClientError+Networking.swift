import Foundation
import Networking
import SwiftLeedsData

extension SwiftLeedsData.HTTPClientError {

    init(error: Error) {
        guard let error = error as? Networking.HTTPClientError else {
            self = .unknown
            return
        }

        switch error {
        case .network(let networkError):
            self = .network(networkError)

        case .invalidStatusCode(let statusCode):
            self = .invalidStatusCode(statusCode)

        case .unknown:
            self = .unknown
        }
    }

}
