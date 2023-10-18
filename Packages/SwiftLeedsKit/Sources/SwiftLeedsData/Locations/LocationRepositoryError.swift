import Foundation

public enum LocationRepositoryError: Error {

    case fetch(Error)
    case decode(Error)
    case notFound
    case unknown(Error? = nil)

}
