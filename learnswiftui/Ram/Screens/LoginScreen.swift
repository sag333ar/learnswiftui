//
//  LoginScreen.swift
//  learnswiftui
//
//  Created by Sagar on 06/11/24.
//

import SwiftUI

struct LoginScreen: View {
    @State var username = ""

    var body: some View {
        VStack(alignment: .leading) {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 162)
                .padding(.bottom, 30)

            Title(title: "Welcome back, let’s log you into your account!")
                .padding(.bottom, 15)

            PrimaryTextField(
                text: $username,
                placeholder: "Enter your email",
                title: "Email Address",
                error: ""
            )

            Spacer()
        }
        .padding()
    }
}

#Preview {
    LoginScreen()
}
