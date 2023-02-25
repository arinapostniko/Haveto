//
//  OvalTextFieldStyle.swift
//  Haveto
//
//  Created by Arina Postnikova on 25.02.23.
//

import Foundation
import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
//            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .background(Color(UIColor.systemGray6))
            .cornerRadius(20)
    }
}
