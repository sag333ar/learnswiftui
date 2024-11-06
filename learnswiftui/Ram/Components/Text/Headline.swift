//
//  Headline.swift
//  learnswiftui
//
//  Created by Sagar on 06/11/24.
//

import SwiftUI

struct Headline: View {
    var title: String
    var body: some View {
        Text(title)
            .font(Font.system(size: 36, weight: .heavy))
            .foregroundColor(Color("primaryColor"))
    }
}

#Preview {
    Headline(title: "The Freedom of Protection")
}
