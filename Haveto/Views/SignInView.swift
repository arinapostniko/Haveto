//
//  SignInView.swift
//  Haveto
//
//  Created by Arina Postnikova on 23.02.23.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var signInViewModel: SignInViewModel
    
    var body: some View {
        VStack {
            Text("Welcome,\nlogin to continue")
                .fontWeight(.semibold)
                .font(.system(size: 36))
            HStack {
                Button(
                    action: {
                        signInViewModel.signIn()
                    },
                    label: {
                        HStack {
                            Image("googlelogo")
                            Text("Sign in with Google")
                                .foregroundColor(.black)
                        } }
                )
                .buttonStyle(.bordered)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
