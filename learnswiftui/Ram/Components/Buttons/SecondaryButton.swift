//
//  SecondaryButton.swift
//  learnswiftui
//
//  Created by Sagar on 06/11/24.
//

import SwiftUI

struct SecondaryButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Font.system(size: 16, weight: .semibold))
                .foregroundColor(Color("primaryColor"))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Capsule().stroke(Color("primaryColor"), lineWidth: 2))
        }
    }
}

#Preview {
    SecondaryButton(title: "Log Into Your Account"
    ) {
        debugPrint("")
    }
}
