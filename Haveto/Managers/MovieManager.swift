//
//  MovieManager.swift
//  Haveto
//
//  Created by Arina Postnikova on 2.03.23.
//

import Foundation
import SwiftUI
import Alamofire

class MovieManager: ObservableObject {
    @Published var filmsArray: [Search] = []
    
    func fetchFilms(searchTerm: String){
        let apiKey = "fa07aab9" //"f25e3b1a"
        let baseURL = "https://www.omdbapi.com/?apikey=\(apiKey)&s=\(searchTerm)"
        AF.request(baseURL).responseDecodable(of: ResponseModel.self) { response in
            self.filmsArray = (response.value?.search) ?? self.parseStaticJSON(fileName: "ConstantFilm", fileExtention: "json")
        }
    }
    
    func parseStaticJSON(fileName: String, fileExtention: String) -> [Search] {
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: fileExtention) else {
            fatalError("File path not found")
        }
        
        guard let data = try? Data(contentsOf: filePath) else {
            fatalError("Failed to retrieve data")
        }
        
        let decoder = JSONDecoder()
        
        guard let decodePreviousData = try? decoder.decode(ResponseModel.self, from: data) else {
            fatalError("Failed to parse data")
        }
        
        return decodePreviousData.search!
    }
    
    func filterArray(searchTerm: String) -> [Search]? {
        return filmsArray.filter {
            $0.title!.localizedStandardContains(searchTerm)
        }
    }
    
    func filteredResults(searchTerm: String) -> [Search] {
        if searchTerm.isEmpty {
            return self.filmsArray
        } else{
            return self.filmsArray.filter {
                $0.title!.localizedStandardContains(searchTerm)
            }
        }
    }
}
