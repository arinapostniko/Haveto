//
//  MovieRow.swift
//  Haveto
//
//  Created by Arina Postnikova on 13.03.23.
//

import SwiftUI
import Kingfisher

struct MovieRow: View {
    var movie = MovieEntity()
    
    var body: some View {
        HStack(spacing: 20) {
                KFImage(URL(string: movie.poster ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .cornerRadius(15)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(movie.title ?? "title")
                        .font(.custom(Fonts.bold, size: 14))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                
                Text(movie.year ?? "1984")
                    .font(.custom(Fonts.light, size: 10))
                    .font(.footnote)
            }
            .foregroundColor(.black)
        }
        .padding()
        .cornerRadius(10)
        .padding(.horizontal, 20)
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow()
    }
}
