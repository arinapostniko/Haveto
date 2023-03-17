//
//  MovieEntityModel.swift
//  Haveto
//
//  Created by Arina Postnikova on 9.03.23.
//

import Foundation
import RealmSwift

class MovieEntity: Object {
    @Persisted var title: String?
    @Persisted var year: String?
    @Persisted var imdbID: String?
    @Persisted var type: String?
    @Persisted var poster: String?
    
//    override static func primaryKey() -> String? {
//        return "title"
//    }
}
