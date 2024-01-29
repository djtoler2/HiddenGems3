import SwiftUI

//public class Results {
//    public var locationName: String
//    public var id: String
//    public var address: String
//    public var locationImage: URL?
//    public var favoriteIcon: String
//    public var keywordTags: [String]
//
//    public init(locationName: String, id: String, address: String, locationImage: URL? = nil, favoriteIcon: String, keywordTags: [String]) {
//        self.locationName = locationName
//        self.id = id
//        self.address = address
//        self.locationImage = locationImage
//        self.favoriteIcon = favoriteIcon
//        self.keywordTags = keywordTags
//    }
//}

struct ResultView: View {
    var result: Results

    var body: some View {
        HStack {
            // Placeholder for location image
            Rectangle()
                .fill(Color.gray)
                .frame(width: 60, height: 60)
                .cornerRadius(8)
                .overlay(
                    result.locationImage != nil ?
                        Image(systemName: "photo") : nil
                )

            VStack(alignment: .leading) {
                Text(result.locationName)
                Text(result.address)
                Text(result.keywordTags.joined(separator: ", "))
            }

            Spacer()

            Image(systemName: result.favoriteIcon)
                .foregroundColor(.red)
        }
    }
}

struct ResultsView1: View {
    let results = [
        Results(locationName: "Location 1", id: "1", address: "123 Street", favoriteIcon: "star.fill", keywordTags: ["Tag1", "Tag2"]),
        Results(locationName: "Location 2", id: "2", address: "456 Avenue", favoriteIcon: "star.fill", keywordTags: ["Tag3", "Tag4"]),
        Results(locationName: "Location 3", id: "3", address: "789 Boulevard", favoriteIcon: "star.fill", keywordTags: ["Tag5", "Tag6"])
    ]

    var body: some View {
        NavigationView {
            List(results, id: \.id) { result in
                ResultView(result: result)
            }
            .navigationTitle("Results")
        }
    }
}

struct ResultsView1_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView1()
    }
}

