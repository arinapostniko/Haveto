//
//  SelectedFilmViewModel.swift
//  Haveto
//
//  Created by Arina Postnikova on 5.03.23.
//

import SwiftUI
import Kingfisher
import RealmSwift

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
                watchedButtonPressed(on: filmDetailedView)
            },
            label: {
                HStack {
                    Text("Watched")
                        .foregroundColor(isWatched(filmDetailedView) ? Color.gray : Color.blue)
                        .font(.custom(Fonts.regular, size: 15))
                }
            }
        )
        .padding(.horizontal)
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(25)
    }
    
    var checkButton: some View {
        Button(
            action: {
                let realm = try! Realm()
                let mvs = realm.objects(MovieEntity.self)
                print(mvs)
                print("PATH: \(Realm.Configuration.defaultConfiguration.fileURL!)")
            },
            label: {
                Text("Check")
            }
        )
    }
    
    func watchedButtonPressed(on movie: MovieModel) {
        if isWatched(movie) {
            setMovieAsUnwatched(movie: movie)
        } else {
            setMovieAsWatched(movie: movie)
        }
    }
    
    func setMovieAsWatched(movie: MovieModel) {
        let realm = try! Realm()
        
        try! realm.write({
            let realmMovie = MovieEntity()
            realmMovie.title = movie.title
            realmMovie.year = movie.year
            realmMovie.imdbID = movie.imdbID
            realmMovie.type = movie.type
            realmMovie.poster = movie.poster
            realm.add(realmMovie)
            })
        filmDetailedView.isWatched = true
    }
    
    func setMovieAsUnwatched(movie: MovieModel) {
        let realm = try! Realm()
        
        let dbMovies = realm.objects(MovieEntity.self)
        
        var currentDbMovie: MovieEntity?
        
        for dbMovie in dbMovies {
            if dbMovie.imdbID == movie.imdbID {
                currentDbMovie = dbMovie
            }
        }
        
        if let currentDbMovie {
            try! realm.write({
                realm.delete(currentDbMovie)
            })
        }
        filmDetailedView.isWatched = false
    }
    
    func isWatched(_ movie: MovieModel) -> Bool {
        let realm = try! Realm()
        let dbMovies = realm.objects(MovieEntity.self)
        
        for dbMovie in dbMovies {
            if dbMovie.imdbID == movie.imdbID {
                return true
            }
        }
        return false
    }
}
