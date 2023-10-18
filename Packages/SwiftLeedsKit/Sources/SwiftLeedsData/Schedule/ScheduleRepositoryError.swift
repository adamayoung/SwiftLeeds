import Foundation

public enum ScheduleRepositoryError: Error {

    case fetch(Error)
    case decode(Error)
    case notFound
    case unknown(Error? = nil)

}
