//
//  ProfileViewModel.swift
//  Haveto
//
//  Created by Arina Postnikova on 9.03.23.
//

import SwiftUI

extension ProfileView {
    
    var profileView: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text(user?.profile?.name ?? "Name")
                            .font(.custom(Fonts.bold, size: 20))
                    }
                    VStack {
                        Button(
                            action: {
                                self.showModal = true
                            },
                            label: {
                                HStack {
                                    Image("settings")
                                }
                            }
                        )
                        .sheet(isPresented: self.$showModal) {
                            SettingsView()
                        }
                    }
                }
                Spacer()
                NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .trailing)
                    .cornerRadius(50)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .padding()
        }
    }
    
    var moviesList: some View {
        VStack(alignment: .leading) {
            Text("Watched movies:")
                .font(.custom(Fonts.semiBold, size: 16))
            ScrollView {
                ForEach(movies.results, id: \.title) { movie in
                    MovieRow(movie: movie)
                }
            }
            .background(Color.white)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .padding()
    }
}
