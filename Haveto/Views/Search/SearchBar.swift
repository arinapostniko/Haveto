//
//  SearchBar.swift
//  Haveto
//
//  Created by Arina Postnikova on 25.02.23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var query: String
    @State private var text: String = ""
    @State private var isEditing = false
    
//    init(query: Binding<String>) {
//        self._query = query
//        print("Init")
//    }
    
    var body: some View {
        HStack(spacing: 0) {
            TextField("Search", text: $text, onCommit: {
                self.query = text
                self.isEditing = false
            })
            .font(.custom(Fonts.regular, size: 16))
            .autocapitalization(.none)
            .autocorrectionDisabled(true)
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .keyboardType(.webSearch)
            .overlay(
                HStack {
                    Image("search")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 5)
                    
                    if isEditing && text.isNotEmpty {
                        Button(action: {
                            self.text = ""
                        }) {
                            Image("close")
                                .foregroundColor(.gray)
                                .padding(.trailing, 5)
                        }
                    }
                }
            )
            .padding(.horizontal, 20)
            .onTapGesture {
                self.isEditing = true
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(query: .constant(""))
    }
}

extension String {
    var isNotEmpty: Bool {
        !self.isEmpty
    }
}
