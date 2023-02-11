//
//  SplashScreenView.swift
//  Haveto
//
//  Created by Arina Postnikova on 11.02.23.
//

import SwiftUI

struct SplashScreenView: View {
    @ObservedObject var viewModel = SplashScreenViewModel()
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 70, height: 70)
                .fullScreenCover(isPresented: $viewModel.isCompleteLoading) {
                    ContentView()
                }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
