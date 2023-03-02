//
//  SearchView.swift
//  Haveto
//
//  Created by Arina Postnikova on 11.02.23.
//

import SwiftUI

struct SearchView: View {
    @State private var query: String = ""
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: Fonts.bold, size: 40)!]
    }
    
    var body: some View {
        NavigationView {
            HStack {
                Spacer()
                VStack {
                    Text("")
                        .navigationTitle("Search")
                        .navigationBarTitleDisplayMode(.large)
                    HStack {
                        SearchBar(query: $query)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
