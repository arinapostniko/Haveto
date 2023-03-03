//
//  SearchView.swift
//  Haveto
//
//  Created by Arina Postnikova on 11.02.23.
//

import SwiftUI

struct SearchView: View {
    //    @State private var query: String = ""
    @ObservedObject var movieManager: MovieManager = .init()
    @State var searchTerm: String = ""
    
    let randomName = ["Spider", "Black", "Star", "Pirates", "Fast"]
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: Fonts.bold, size: 40)!]
    }
    
    var body: some View {
        NavigationView {
            ScrollView{
                searchButtonView
//                    .padding()
//                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(Color(.systemGray6)))
//                    .padding()
                
                if movieManager.filteredResults(searchTerm: searchTerm).isEmpty{
                    errorMessageView
                }else{
                    searchListView
                }
                
            }
            .navigationTitle("Search")
        }
        .onAppear{
            movieManager.fetchFilms(searchTerm: randomName.randomElement()!)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
