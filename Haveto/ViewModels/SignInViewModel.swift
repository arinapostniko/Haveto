//
//  SignInViewModel.swift
//  Haveto
//
//  Created by Arina Postnikova on 23.02.23.
//

import SwiftUI
import Firebase
import GoogleSignIn

class SignInViewModel: ObservableObject {
    @Published var isLogin: Bool = false
    
    func signInWithGoogle() {
        guard let clientId = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientId)

        GIDSignIn.sharedInstance.signIn(withPresenting: ApplicationUtility.rootViewController) { [self] user, err in
            if let error = err {
                print(error.localizedDescription)
                return
            }
            
            guard let authentication = user?.authentication,
                  let idToken = authentication.idToken
            else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { result, error in
                if let err = error {
                    print(err.localizedDescription)
                    return
                }
                
                guard let user = result?.user else { return }
                print(user.displayName)
                isLogin.toggle()
            }
        }
    }
}
