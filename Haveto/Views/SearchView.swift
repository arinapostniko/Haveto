//
//  SearchView.swift
//  Haveto
//
//  Created by Arina Postnikova on 11.02.23.
//

import SwiftUI

struct SearchView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: Fonts.bold, size: 40)!]
    }
    
    var body: some View {
        NavigationView {
            VStack {
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
