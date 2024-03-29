//
//  SingleFilmView.swift
//  Haveto
//
//  Created by Arina Postnikova on 2.03.23.
//

import SwiftUI
import Kingfisher

struct SingleFilmView: View {
    var filmSubView: MovieModel
    
    var body: some View {
        HStack(spacing: 20) {
            KFImage(URL(string: filmSubView.poster!))
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .cornerRadius(15)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(filmSubView.title ?? "")
                        .font(.custom(Fonts.bold, size: 17))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                
                Text(filmSubView.year ?? "")
                    .font(.custom(Fonts.light, size: 13))
                    .font(.footnote)
            }
            .foregroundColor(.black)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal, 20)
    }
}

