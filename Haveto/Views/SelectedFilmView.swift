//
//  SelectedFilmView.swift
//  Haveto
//
//  Created by Arina Postnikova on 5.03.23.
//

import SwiftUI

struct SelectedFilmView: View {
    var filmDetailedView: MovieModel
    
    var body: some View {
        ScrollView {
            imageView
            textDetails
            watchedButton
            checkButton
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
    }
}
