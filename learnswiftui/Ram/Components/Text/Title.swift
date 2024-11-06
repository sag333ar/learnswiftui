//
//  Title.swift
//  learnswiftui
//
//  Created by Sagar on 06/11/24.
//

import SwiftUI

struct Title: View {
    var title: String
    var body: some View {
        Text(title)
            .font(Font.system(size: 21, weight: .black))
            .foregroundColor(Color("primaryColor"))
    }
}

#Preview {
    Title(title: "The Freedom of Protection")
}
