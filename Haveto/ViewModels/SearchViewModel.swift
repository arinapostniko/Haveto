//
//  SearchViewModel.swift
//  Haveto
//
//  Created by Arina Postnikova on 2.03.23.
//

import SwiftUI

extension SearchView {
    
    var searchListView: some View {
        ForEach(movieManager.filteredResults(searchTerm: searchTerm), id: \.self) { film in
            NavigationLink {
                SelectedFilmView(filmDetailedView: film)
            } label: {
                VStack(spacing: 0) {
                    SingleFilmView(filmSubView: film)
                }
            }
        }
    }

    var errorMessageView: some View {
        VStack {
            Text("No results")
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                .padding()
        }
    }

    var searchButtonView: some View {
        SearchBar(query: $searchTerm)
            .onChange(of: searchTerm) { newValue in
                movieManager.fetchFilms(searchTerm: searchTerm)
            }
    }
}
