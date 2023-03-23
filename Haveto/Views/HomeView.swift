//
//  HomeView.swift
//  Haveto
//
//  Created by Arina Postnikova on 23.02.23.
//

import SwiftUI

struct HomeView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            SearchView()
                .tabItem {
                    selection == 0 ? Image("selected-add") : Image("add")
                }
                .tag(0)
            ProfileView()
                .tabItem {
                    selection == 1 ? Image("selected-profile") : Image("profile")
                }
                .tag(1)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
