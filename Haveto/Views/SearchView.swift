//
//  SearchView.swift
//  Haveto
//
//  Created by Arina Postnikova on 11.02.23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var viewModel: SignInViewModel
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: "Montserrat-Bold", size: 40)!]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Button("sign out") {
                    viewModel.signOut()
                }
                Text("")
                    .navigationTitle("Search")
                    .navigationBarTitleDisplayMode(.large)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
