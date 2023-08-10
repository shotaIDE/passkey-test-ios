import SwiftUI
import AuthenticationServices

struct ContentView: View {
    let passkeyResource = PasskeyResource()
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 10) {
                TextField("Username", text: $username)
                    .textContentType(.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal, 40)
            
            Button(action: {
                passkeyResource.storePassword(
                    userId: username,
                    password: password
                )
            }) {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Store password")
                }
            }
            
            Button(action: {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                      let window = windowScene.windows.first else {
                    return
                }
                
                passkeyResource.signUpWith(
                    userName: "Test User",
                    anchor: window
                )
            }) {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Register")
                }
            }
            
            Button(action: {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                      let window = windowScene.windows.first else {
                    return
                }
                
                passkeyResource.signInWith(
                    anchor: window,
                    //
                    preferImmediatelyAvailableCredentials: true
                )
            }) {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Sign In")
                }
            }
            .padding()
            
            Button(action: {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                      let window = windowScene.windows.first else {
                    return
                }
                
                passkeyResource.beginAutoFillAssistedPasskeySignIn(
                    anchor: window
                )
            }) {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Auto fill")
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
