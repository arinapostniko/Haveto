//
//  SplashScreenViewModel.swift
//  Haveto
//
//  Created by Arina Postnikova on 11.02.23.
//

import Foundation

class SplashScreenViewModel: ObservableObject {
    @Published var isCompleteLoading = false
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) { [weak self] in
            self?.isCompleteLoading = true
        }
    }
}
