import SwiftUI

//#######################################################################################

struct FloatingButton: View {
    var label: String
    var isSelected: Bool
    var action: () -> Void

    @State private var isFloating = false
    @State private var offsetX: CGFloat = 0
    @State private var offsetY: CGFloat = 0
    @State private var scale: CGFloat = 1.0

    private let floatRange: CGFloat = 10
    private let scaleRange: CGFloat = 0.15
    private let animationDelay = Double.random(in: 0...2)

    var body: some View {
        Button(action: action) {
            VStack {
                Image("gem")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(isSelected ? .blue : .gray)
                    .scaleEffect(scale)
                Text(label)
                    .font(.caption)
            }
        }
        .offset(x: offsetX, y: offsetY)
        .animation(Animation.easeInOut(duration: 2).delay(animationDelay).repeatForever(autoreverses: true), value: isFloating)
        .onAppear {
            offsetX = CGFloat.random(in: -floatRange...floatRange)
            offsetY = CGFloat.random(in: -floatRange...floatRange)
            scale = CGFloat.random(in: 1.0-scaleRange...1.0+scaleRange)
            isFloating = true
        }
    }
}

//#######################################################################################

struct FloatingButtonsView: View {
    @Binding var selectedKeywords: [String]
    private let maxSelection = 5
    @State private var buttonData = (1...20).map { "keyword\($0)" }

    var body: some View {
   
        ScrollView {
         
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 4), spacing: 5) {
                ForEach(buttonData, id: \.self) { keyword in
                    FloatingButton(label: keyword, isSelected: selectedKeywords.contains(keyword)) {
                        if let index = selectedKeywords.firstIndex(of: keyword) {
                            selectedKeywords.remove(at: index)
                        } else if selectedKeywords.count < maxSelection {
                            selectedKeywords.append(keyword)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

//#######################################################################################

struct BiggerFloatingButton: View {
    var label: String
    var isSelected: Bool
    var action: () -> Void

    @State private var isFloating = false
    @State private var offsetX: CGFloat = 0
    @State private var offsetY: CGFloat = 0
    @State private var scale: CGFloat = 1.0

    private let floatRange: CGFloat = 10
    private let scaleRange: CGFloat = 0.15
    private let animationDelay = Double.random(in: 0...2)

    var body: some View {
        Button(action: action) {
            VStack {
                Image("gem")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .foregroundColor(isSelected ? .blue : .gray)
                    .scaleEffect(scale)
                Text(label)
                    .font(.caption)
            }
        }
        .offset(x: offsetX, y: offsetY)
        .animation(Animation.easeInOut(duration: 2).delay(animationDelay).repeatForever(autoreverses: true), value: isFloating)
        .onAppear {
            offsetX = CGFloat.random(in: -floatRange...floatRange)
            offsetY = CGFloat.random(in: -floatRange...floatRange)
            scale = CGFloat.random(in: 1.0-scaleRange...1.0+scaleRange)
            isFloating = true
        }
    }
}

//#######################################################################################

struct BiggerFloatingButtonsView: View {
    @Binding var selectedKeywords: [String]
    private let maxSelection = 5
    @State private var buttonData = (1...6).map { "keyword\($0)" }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 4), spacing: 5) {
                ForEach(buttonData, id: \.self) { keyword in
                    FloatingButton(label: keyword, isSelected: selectedKeywords.contains(keyword)) {
                        if let index = selectedKeywords.firstIndex(of: keyword) {
                            selectedKeywords.remove(at: index)
                        } else if selectedKeywords.count < maxSelection {
                            selectedKeywords.append(keyword)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

//#######################################################################################

struct FloatingButtonsRow: View {
    var buttons: [String]
    @Binding var selectedKeywords: [String]

    var body: some View {
        HStack {
            ForEach(buttons, id: \.self) { keyword in
                FloatingButton(label: keyword, isSelected: selectedKeywords.contains(keyword)) {
                    if let index = selectedKeywords.firstIndex(of: keyword) {
                        selectedKeywords.remove(at: index)
                    } else if selectedKeywords.count < 5 {
                        selectedKeywords.append(keyword)
                    }
                }
            }
        }
    }
}

//#######################################################################################

struct BiggerFloatingButtonsRow: View {
    var buttons: [String]
    @Binding var selectedKeywords: [String]

    var body: some View {
        HStack {
            ForEach(buttons, id: \.self) { keyword in
                BiggerFloatingButton(label: keyword, isSelected: selectedKeywords.contains(keyword)) {
                    if let index = selectedKeywords.firstIndex(of: keyword) {
                        selectedKeywords.remove(at: index)
                    } else if selectedKeywords.count < 5 {
                        selectedKeywords.append(keyword)
                    }
                }
            }
        }
    }
}

//#######################################################################################

struct FloatingButtonsColumn: View {
    var buttons: [String]
    @Binding var selectedKeywords: [String]

    var body: some View {
        VStack {
            ForEach(buttons, id: \.self) { keyword in
                FloatingButton(label: keyword, isSelected: selectedKeywords.contains(keyword)) {
                    if let index = selectedKeywords.firstIndex(of: keyword) {
                        selectedKeywords.remove(at: index)
                    } else if selectedKeywords.count < 5 {
                        selectedKeywords.append(keyword)
                    }
                }
            }
        }
    }
}

//#######################################################################################
