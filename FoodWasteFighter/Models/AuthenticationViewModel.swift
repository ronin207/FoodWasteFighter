//
//  AuthenticationViewModel.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 10/3/22.
//

import Firebase
import GoogleSignIn

class AuthenticationViewModel: ObservableObject {
    @Published var state: LoginState = .signout
    
    enum LoginState {
        case signin
        case signout
    }
    
    func signIn() {
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
                authenticateUser(for: user, with: error)
            }
        } else {
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            let configuration = GIDConfiguration(clientID: clientID)
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            guard let presenting = windowScene.windows.first?.rootViewController else { return }
            
            GIDSignIn.sharedInstance.signIn(with: configuration, presenting: presenting) { [unowned self] user, error in
                authenticateUser(for: user, with: error)
            }
        }
    }
    
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        
        do {
            try Auth.auth().signOut()
            state = .signout
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { [unowned self] _, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.state = .signin
            }
        }
    }
}
