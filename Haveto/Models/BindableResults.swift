//
//  BindableResults.swift
//  Haveto
//
//  Created by Arina Postnikova on 13.03.23.
//

import Foundation
import RealmSwift

class BindableResults<Element>: ObservableObject where Element: RealmSwift.RealmCollectionValue {
    var results: Results<Element>
    private var token: NotificationToken!
    
    init(results: Results<Element>) {
        self.results = results
        lateInit()
    }
    
    func lateInit() {
        token = results.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    deinit {
        token.invalidate()
    }
}
