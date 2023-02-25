//
//  ProfileView.swift
//  Haveto
//
//  Created by Arina Postnikova on 11.02.23.
//

import SwiftUI
import GoogleSignIn

struct ProfileView: View {
    @EnvironmentObject var viewModel: SignInViewModel
    @State private var showModal: Bool = false
    
    private let user = GIDSignIn.sharedInstance.currentUser
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text(user?.profile?.name ?? "Name")
                            .font(.custom(Fonts.bold, size: 20))
                    }
                    VStack {
                        Button(
                            action: {
                                self.showModal = true
                                
                            },
                            label: {
                                HStack {
                                    Image("settings")
                                } }
                        )
                        .sheet(isPresented: self.$showModal) {
                            SettingsView()
                        }
                    }
                }
                Spacer()
                NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .trailing)
                    .cornerRadius(50)
            }
            .padding()
            .frame(maxWidth: .infinity)
            //            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
            .padding()
            Spacer()
        }
    }
}

struct NetworkImage: View {
    let url: URL?
    
    var body: some View {
        if let url = url,
           let data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(SignInViewModel())
    }
}
