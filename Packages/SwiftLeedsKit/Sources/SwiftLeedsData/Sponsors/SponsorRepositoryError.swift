import Foundation

public enum SponsorRepositoryError: Error {

    case fetch(Error)
    case decode(Error)
    case notFound
    case unknown(Error? = nil)

}
