//
//  SearchView.swift
//  Haveto
//
//  Created by Arina Postnikova on 11.02.23.
//

import SwiftUI

struct SearchView: View {
    @StateObject var movieManager: MovieManager = MovieManager()
    @State var searchTerm: String = ""
    
    let randomName = ["Spider", "Black", "Star", "Pirates", "Fast", "Harry"]
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: Fonts.bold, size: 40)!]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                searchButtonView
                
                if movieManager.filteredResults(searchTerm: searchTerm).isEmpty {
                    errorMessageView
                } else {
                    searchListView
                }
            }
            .navigationTitle("Search")
        }
        .onAppear {
            movieManager.fetchFilms(searchTerm: randomName.randomElement()!)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
