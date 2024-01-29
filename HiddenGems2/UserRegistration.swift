import SwiftUI

struct UserRegistration: View {
    @State private var username: String = ""
    @State private var id: String = ""
    @State private var password: String = ""
    @State private var profilePic: UIImage? = nil
    @State private var favorites: String = ""
    @State private var showImagePicker: Bool = false 

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Information")) {
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                    Button("Upload Profile Picture") {
                        showImagePicker = true
                    }
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(selectedImage: $profilePic, sourceType: .photoLibrary)
                    }

                    if let profilePic = profilePic {
                        Image(uiImage: profilePic)
                            .resizable()
                            .scaledToFit()
                    }
                }

                Button("Create Profile") {
                    createUserProfile()
                }
            }
            .navigationBarTitle("Register")
        }
    }

    func createUserProfile() {
        let favoritesArray = favorites.components(separatedBy: ", ")
        let user = User(username: username, id: id, password: password, profilePic: nil, favorites: favoritesArray)
        print(user)
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedImage: UIImage?
    var sourceType: UIImagePickerController.SourceType

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserRegistration()
    }
}



