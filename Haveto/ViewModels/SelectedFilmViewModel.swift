//
//  SelectedFilmViewModel.swift
//  Haveto
//
//  Created by Arina Postnikova on 5.03.23.
//

import SwiftUI
import Kingfisher

extension SelectedFilmView {
    
    var imageView: some View {
        KFImage(URL(string: filmDetailedView.poster!))
            .resizable()
            .scaledToFit()
            .mask(Circle())
            .frame(height: 200)
    }
    
    var textDetails: some View {
        VStack {
            Text(filmDetailedView.title!)
                .font(.custom(Fonts.black, size: 20))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Text(filmDetailedView.type!)
                .font(.custom(Fonts.light, size: 15))
                .opacity(0.5)
                .multilineTextAlignment(.center)
            
            Text(filmDetailedView.year!)
                .font(.custom(Fonts.light, size: 15))
                .opacity(0.5)
        }
    }
    
    var watchedButton: some View {
        Button(
            action: {
                // TODO: add film to watched list
            },
            label: {
                HStack {
                    Text("Watched")
                        .foregroundColor(Color.gray)
                        .font(.custom(Fonts.regular, size: 15))
                }
            }
        )
        .padding(.horizontal)
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(25)
    }
}