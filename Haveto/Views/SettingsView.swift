//
//  SettingsView.swift
//  Haveto
//
//  Created by Arina Postnikova on 24.02.23.
//

import SwiftUI
import MessageUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: SignInViewModel
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    var body: some View {
        VStack {
            List {
                Section("Help") {
                    Button(
                        action: {
                            self.isShowingMailView.toggle()
                        },
                        label: {
                            Text("Report a problem")
                                .foregroundColor(.black)
                                .font(.custom(Fonts.regular, size: 18))
                        }
                    )
                    .disabled(!MFMailComposeViewController.canSendMail())
                    .sheet(isPresented: $isShowingMailView) {
                        MailViewModel(result: self.$result)
                    }
                }
                HStack {
                    Spacer()
                    Text("Made by Arina P.")
                        .font(.custom(Fonts.regular, size: 15))
                        .opacity(0.3)
                    Spacer()
                }
                .listRowSeparator(.hidden)
                HStack {
                    Spacer()
                    Image("appname")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .opacity(0.3)
                    Spacer()
                }
            }
            .scrollContentBackground(.hidden)
            VStack {
                Button("Sign out") {
                    viewModel.signOut()
                }
                .foregroundColor(.red)
                .font(.custom(Fonts.light, size: 18))
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
