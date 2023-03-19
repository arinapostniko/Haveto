//
//  ProfileView.swift
//  Haveto
//
//  Created by Arina Postnikova on 11.02.23.
//

import SwiftUI
import GoogleSignIn
import RealmSwift

struct ProfileView: View {
    @EnvironmentObject var viewModel: SignInViewModel
    @State var showModal: Bool = false
    @ObservedObject var movies = BindableResults(results: try! Realm().objects(MovieEntity.self))
    
    let user = GIDSignIn.sharedInstance.currentUser
    
    var body: some View {
        VStack {
            profileView
            moviesList
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
