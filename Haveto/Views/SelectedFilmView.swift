//
//  SelectedFilmView.swift
//  Haveto
//
//  Created by Arina Postnikova on 5.03.23.
//

import SwiftUI

struct SelectedFilmView: View {
    var filmDetailedView: Search
    
    var body: some View {
        ScrollView {
            imageView
            textDetails
            watchedButton
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
    }
}
