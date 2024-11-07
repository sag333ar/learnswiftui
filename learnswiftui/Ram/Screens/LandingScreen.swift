//
//  LandingScreen.swift
//  learnswiftui
//
//  Created by Sagar on 06/11/24.
//

import SwiftUI

struct LandingScreen: View {
    @State var goToLogin = false
    @State var goToSignup = false

    @StateObject private var viewModel = MyViewModel()

    var body: some View {
        NavigationStack {
            if viewModel.loading {
                ProgressView()
            } else {
                screen
            }
        }
    }

    var screen: some View {
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
                    viewModel.fetchPosts()
                }
                .padding(.bottom, 10)

                SecondaryButton(title: "Log into Your Account") {
                    goToLogin = true
                }
                .padding(.bottom, 10)

                if !viewModel.posts.isEmpty {
                    PrimaryButton(title: viewModel.posts[0].title) {
                        debugPrint("Hello")
                    }
                    .padding(.bottom, 10)
                }
            }
            .padding()
        }
        .navigationTitle("landing screen")
        .navigationBarHidden(true)
        .navigationDestination(
            isPresented: $goToLogin
        ) {
            LoginScreen()
        }
    }
}

#Preview {
    LandingScreen()
}
