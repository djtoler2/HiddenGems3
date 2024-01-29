import SwiftUI

struct MainView: View {
    @State private var showRegistration = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Background Image Goes Here")
                    .bold()
                Spacer()
                HStack(spacing: 20) {
                    Button("Register") {
                        showRegistration = true
                    }
                    .sheet(isPresented: $showRegistration) {
                        UserRegistration()
                    }
                    .buttonStyle(.borderedProminent)

                    Button("Continue as Guest") {
                        
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

