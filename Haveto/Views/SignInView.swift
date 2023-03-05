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
                .font(.custom(Fonts.bold, size: 35))
            HStack {
                Button(
                    action: {
                        signInViewModel.signIn()
                    },
                    label: {
                        HStack {
                            Image("whitegooglelogo")
                            Text("Sign in with Google")
                                .foregroundColor(.white)
                                .font(.custom(Fonts.regular, size: 15))
                        } }
                )
                .padding(.horizontal)
                .padding(10)
                .background(Color.black)
                .cornerRadius(25)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
