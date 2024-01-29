import SwiftUI

struct KeywordPage: View {
    private var topButtonData = ["keyword21", "keyword22", "keyword23"]
    private var bottomButtonData = ["keyword24", "keyword25", "keyword26"] 
    @State private var showResults = false
    @State private var selectedKeywords = [String]()
    private var buttonData = (1...20).map { "keyword\($0)" }
    @State private var showAlternateView = false

    var body: some View {
        ZStack {
            VStack {
                
                Button(showAlternateView ? "Floating" : "Checkboxes") {
                    showAlternateView.toggle()
                }
                .background(Color.yellow)
                .foregroundColor(.black)
                .cornerRadius(5)
                
                if showAlternateView {
                    AlternateFloatingButtonsView(selectedKeywords: $selectedKeywords, onBack: {})
                }
                
                else {
                    
                    FloatingButtonsRow(buttons: Array(buttonData.prefix(5)), selectedKeywords: $selectedKeywords)
                    
                    BiggerFloatingButtonsRow(buttons: topButtonData, selectedKeywords: $selectedKeywords)
                        .padding(.bottom, -100)
                    
                    HStack {
                        
                        FloatingButtonsColumn(buttons: Array(buttonData[5..<10]), selectedKeywords: $selectedKeywords)
                        
                        Spacer()
                        
                        Circle().frame(width: 200, height: 200).foregroundColor(.gray)
                        
                        Spacer()
                        
                        FloatingButtonsColumn(buttons: Array(buttonData[10..<15]), selectedKeywords: $selectedKeywords)
                        
                    }
                    
                    BiggerFloatingButtonsRow(buttons: bottomButtonData, selectedKeywords: $selectedKeywords)
                        .padding(.top, -100)
                    
                    FloatingButtonsRow(buttons: Array(buttonData.suffix(5)), selectedKeywords: $selectedKeywords)
                }
            }

            VStack {
                Spacer()
                Button("Show Results") {
                    showResults = true
                }
                .padding(.top, 40)
            }
        }
        .sheet(isPresented: $showResults) {
            ResultsView1()
        }
    }

}

struct KeywordPage_Previews: PreviewProvider {
    static var previews: some View {
        KeywordPage()
    }
}

