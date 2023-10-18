import Foundation

///
/// A structure representing a conference.
///
public struct Conference: Identifiable {

    ///
    /// Conference identifier.
    ///
    public let id: UUID

    ///
    /// Conference name.
    ///
    public let name: String

    ///
    /// Conference start date.
    ///
    public let date: Date

    ///
    /// Conference location.
    ///
    public let location: String

    /// 
    /// Create a conference object.
    ///
    /// - Parameters:
    ///   - id: Conference identifier.
    ///   - name: Conference name.
    ///   - date: Conference start date.
    ///   - location: Conference location.
    ///
    public init(
        id: UUID,
        name: String,
        date: Date,
        location: String
    ) {
        self.id = id
        self.name = name
        self.date = date
        self.location = location
    }

}
