import Foundation

public class Results {
    public var locationName: String
    public var id: String
    public var address: String
    public var locationImage: URL?
    public var favoriteIcon: String
    public var keywordTags : [String]

    public init(locationName: String, id: String, address: String, locationImage: URL? = nil, favoriteIcon: String, keywordTags: [String]) {
        self.locationName = locationName
        self.id = id
        self.address = address
        self.locationImage = locationImage
        self.favoriteIcon = favoriteIcon
        self.keywordTags = keywordTags
    }
}
