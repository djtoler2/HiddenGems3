import SwiftUI

struct IconsView: View {
    // Array of system icons and their coordinates
    let icons = [
        ("gem", CGPoint(x: 184, y: 112)),
        ("gem", CGPoint(x: 426, y: 104)),
        ("gem", CGPoint(x: 539, y: 187)),
        ("gem", CGPoint(x: 486, y: 294)),
        ("gem", CGPoint(x: 297, y: 382)),
        ("gem", CGPoint(x: 323, y: 211)),
        ("gem", CGPoint(x: 158, y: 252)),
        ("gem", CGPoint(x: 58, y: 179)),
        ("gem", CGPoint(x: 69, y: 375)),
        ("gem", CGPoint(x: 512, y: 453)),
        ("gem", CGPoint(x: 104, y: 519)),
        ("gem", CGPoint(x: 92, y: 690)),
        ("gem", CGPoint(x: 307, y: 657)),
        ("gem", CGPoint(x: 480, y: 737)),
        ("gem", CGPoint(x: 261, y: 815)),
        ("gem", CGPoint(x: 379, y: 929)),
        ("gem", CGPoint(x: 541, y: 858)),
        ("gem", CGPoint(x: 535, y: 1001)),
        ("gem", CGPoint(x: 73, y: 976)),
        ("gem", CGPoint(x: 166, y: 703))
    ]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<icons.count, id: \.self) { index in
                    let icon = icons[index]
                    Image("gem")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        // Adjust position based on the parent view size
                        .position(x: min(icon.1.x, geometry.size.width),
                                  y: min(icon.1.y, geometry.size.height))
                }
            }
        }
    }
}

struct IconsView_Previews: PreviewProvider {
    static var previews: some View {
        IconsView()
    }
}

