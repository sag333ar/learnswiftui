//
//  PrimaryTextField.swift
//  learnswiftui
//
//  Created by Sagar on 06/11/24.
//

import SwiftUI

struct PrimaryTextField: View {
    @Binding var text: String
    var placeholder: String
    var title: String
    var error: String

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                TextField(placeholder, text: $text)
                    .font(Font.system(size: 14, weight: .regular))
                    .foregroundColor(Color("primaryColor"))
                    .padding(.all, 10)
                    .padding(.top, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(error.isEmpty ? Color.gray : Color.red, lineWidth: 1)
                    )
                    .background(
                        error.isEmpty ? Color.clear : Color.red.opacity(0.05)
                    )

                Text(title)
                    .font(Font.system(size: 12, weight: .regular))
                    .foregroundColor(Color("primaryColor"))
                    .padding(.leading, 10)
                    .padding(.top, -20)
            }
            if !error.isEmpty {
                HStack {
                    Image("error-logo")
                    Text(error)
                        .font(Font.system(size: 12, weight: .regular))
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}

#Preview {
    PrimaryTextField(
        text: .constant(""),
        placeholder: "Enter Email Address here",
        title: "Email Address",
        error: "Incorrect username or password"
    )
}
