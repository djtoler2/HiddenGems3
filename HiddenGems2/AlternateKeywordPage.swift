import SwiftUI

struct CheckboxView: View {
    var label: String
    @Binding var selectedItems: [String]

    var body: some View {
        HStack {
            Image(systemName: selectedItems.contains(label) ? "checkmark.square.fill" : "square")
                .foregroundColor(selectedItems.contains(label) ? .blue : .gray)
                .onTapGesture {
                    if let index = selectedItems.firstIndex(of: label) {
                        selectedItems.remove(at: index)
                    } else if selectedItems.count < 5 {
                        selectedItems.append(label)
                    }
                }
            Text(label)
                .font(.system(size: 10)) // Smaller font size
                .foregroundColor(.black)
        }
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.teal))
    }
}


struct AlternateFloatingButtonsView: View {
    @Binding var selectedKeywords: [String]
    var onBack: () -> Void
    @State private var selectedTab = 0

    var body: some View {
        VStack {
            HStack {
                // Left arrow button
                Button(action: {
                    withAnimation {
                        selectedTab = max(selectedTab - 1, 0)
                    }
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(selectedTab > 0 ? .blue : .gray)
                }
                .disabled(selectedTab <= 0)

                Spacer()

                // Right arrow button
                Button(action: {
                    withAnimation {
                        selectedTab = min(selectedTab + 1, 1) // Assuming two pages for example
                    }
                }) {
                    Image(systemName: "arrow.right")
                        .foregroundColor(selectedTab < 1 ? .blue : .gray)
                }
                .disabled(selectedTab >= 1)
            }
            .padding()

            TabView(selection: $selectedTab) {
                // First page with checkboxes
                checkboxPage(startIndex: 0)
                    .tag(0)

                // Second page with checkboxes
                checkboxPage(startIndex: 5)
                    .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }

    private func checkboxGrid(for keywords: [String]) -> some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
            ForEach(keywords, id: \.self) { keyword in
                CheckboxView(label: keyword, selectedItems: $selectedKeywords)
            }
        }
    }

    private func checkboxPage(startIndex: Int) -> some View {
        ScrollView {
            VStack {
                ForEach(0..<4) { categoryIndex in
                    VStack(alignment: .leading) {
                        Text("Category \(startIndex + categoryIndex + 1)")
                            .font(.headline)
                            .padding(.top)
                        
                        let categoryKeywords = (1...6).map { "Keyword \(startIndex * 6 + categoryIndex * 6 + $0)" }
                        checkboxGrid(for: categoryKeywords)
                    }
                }
            }
            .padding()
        }
    }
}

struct AlternateFloatingButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        AlternateFloatingButtonsView(selectedKeywords: .constant([]), onBack: {})
    }
}








