//
//  SingleFilmView.swift
//  Haveto
//
//  Created by Arina Postnikova on 2.03.23.
//

import SwiftUI
import Kingfisher

struct SingleFilmView: View {
    var filmSubView: Search
    
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
//                        .fontWeight(.bold)
                        .font(.custom(Fonts.bold, size: 17))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                
                Text(filmSubView.year ?? "")
//                    .fontWeight(.light)
                    .font(.custom(Fonts.light, size: 13))
                    .font(.footnote)
            }
            .foregroundColor(.black)
            
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(5)
        .padding(.horizontal)
    }
}
