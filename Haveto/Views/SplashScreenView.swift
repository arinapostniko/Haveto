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
            Image("appname")
                .resizable()
                .frame(width: 200, height: 200)
                .fullScreenCover(isPresented: $viewModel.isCompleteLoading) {
                    SignInView()
                }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
