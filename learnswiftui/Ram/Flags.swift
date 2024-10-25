//
//  Flags.swift
//  learnswiftui
//
//  Created by Sagar on 25/10/24.
//

import SwiftUI

struct Flags: View {
    var body: some View {
        HStack {
            VStack(
                alignment: .leading,
                spacing: 20
            ) {
                Text("Hello, world!")
                Text("This is inside a stack")
                Spacer()
            }
            HStack {
                Image(systemName: "pencil")
                Text("Ram")
            }
            .padding()
            .background(.red)
            .shadow(radius: 2)
        }
    }
}

#Preview {
    Flags()
}
