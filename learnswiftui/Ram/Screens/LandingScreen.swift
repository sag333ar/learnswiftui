//
//  LandingScreen.swift
//  learnswiftui
//
//  Created by Sagar on 06/11/24.
//

import SwiftUI

struct LandingScreen: View {
    var body: some View {
        ZStack {
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                Headline(title: "The Freedom of Protection")
            }

            VStack {
                Spacer()
                PrimaryButton(title: "Create An Account") {
                    debugPrint("Hello")
                }
                .padding(.bottom, 10)
                SecondaryButton(title: "Log into Your Account") {

                }
            }
            .padding()
        }
    }
}

#Preview {
    LandingScreen()
}
