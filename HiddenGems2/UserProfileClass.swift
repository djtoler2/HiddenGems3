import Foundation

public class User {
    public var username: String
    public var id: String
    public var password: String
    public var profilePic: URL?
    public var favorites: [String]

    public init(username: String, id: String, password: String, profilePic: URL? = nil, favorites: [String]) {
        self.username = username
        self.id = id
        self.password = password
        self.profilePic = profilePic
        self.favorites = favorites
    }
}
