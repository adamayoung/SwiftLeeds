import Foundation

public enum HTTPClientError: Error {

    case network(Error)
    case invalidStatusCode(Int)
    case unknown

}
