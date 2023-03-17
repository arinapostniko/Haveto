//
//  MovieRow.swift
//  Haveto
//
//  Created by Arina Postnikova on 13.03.23.
//

import SwiftUI

struct MovieRow: View {
    var movie = MovieEntity()
    
    var body: some View {
        HStack {
            Text(movie.title ?? "name")
        }
    }

}
