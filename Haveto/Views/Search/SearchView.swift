//
//  SearchView.swift
//  Haveto
//
//  Created by Arina Postnikova on 11.02.23.
//

import SwiftUI

struct SearchView: View {
    @State private var query: String = ""
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: Fonts.bold, size: 40)!]
    }
    
    var body: some View {
        NavigationView {
            HStack {
                Spacer()
                VStack {
                    Text("")
                        .navigationTitle("Search")
                        .navigationBarTitleDisplayMode(.large)
                    HStack {
//                        Image("search")
//                        TextField("Search", text: $query)
//                            .font(.custom(Fonts.regular, size: 16))
//                            .autocorrectionDisabled(true)
//                            .autocapitalization(.none)
                        SearchBar(query: $query)
                    }
//                    .textFieldStyle(OvalTextFieldStyle())
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
