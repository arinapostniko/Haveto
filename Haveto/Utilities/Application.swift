//
//  Application.swift
//  Haveto
//
//  Created by Arina Postnikova on 23.02.23.
//

import SwiftUI

final class ApplicationUtility {
    static var rootViewController: UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let root = screen.windows.first?.rootViewController
        else { return .init() }
        
        return root
    }
}
