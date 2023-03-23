//
//  ContentView.swift
//  Haveto
//
//  Created by Arina Postnikova on 11.02.23.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var viewModel: SignInViewModel
  
  var body: some View {
    switch viewModel.state {
      case .signedIn: HomeView()
      case .signedOut: SignInView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
          .environmentObject(SignInViewModel())
  }
}
