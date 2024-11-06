//
//  PrimaryButton.swift
//  learnswiftui
//
//  Created by Sagar on 06/11/24.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Font.system(size: 16, weight: .semibold))
                .foregroundColor(Color.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Capsule().fill(Color("primaryColor")))
        }
    }
}

#Preview {
    PrimaryButton(
        title: "Create An Account"
    ) {
        debugPrint("")
    }
}
