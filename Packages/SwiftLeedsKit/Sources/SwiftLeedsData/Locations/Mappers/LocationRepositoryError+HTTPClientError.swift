import Foundation

extension LocationRepositoryError {

    init(error: Error) {
        guard let error = error as? HTTPClientError else {
            self = .unknown()
            return
        }

        switch error {
        case .network(let networkError):
            self = .fetch(networkError)

        case .invalidStatusCode(let statusCode):
            if statusCode == 404 {
                self = .notFound
                return
            }

            self = .unknown()

        case .unknown:
            self = .unknown()
        }
    }

}
