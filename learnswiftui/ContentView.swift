//
//  ContentView.swift
//  learnswiftui
//
//  Created by Sagar on 22/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    @State var name = "Sagar"
    @State var selectedPosition: String = "Manager"

    let positions = ["Manager", "Developer", "Lead"]
    @State private var showingAlert = false
    @State private var selectedAge = 18

    var body: some View {
        NavigationStack {
            ZStack {
//                LinearGradient(
//                    // colors: [.red, .yellow],
//                    stops: [
//                        .init(color: .white, location: 0.25),
//                        .init(color: .black, location: 0.75),
//                    ],
//                    startPoint: .leading,
//                    endPoint: .trailing
//                )
//                RadialGradient(
//                    colors: [.blue, .black],
//                    center: .leading,
//                    startRadius: 10,
//                    endRadius: 200
//                )
                VStack {
                    HStack {
                        Image(systemName: "square.and.arrow.up.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Ram Prasanth")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.indigo)
                    }
                    VStack {
                        Button("Button 1") { }
                            .buttonStyle(.bordered)
                        Button("Button 2", role: .destructive) { }
                            .buttonStyle(.bordered)
                        Button("Button 3") { }
                            .buttonStyle(.borderedProminent)
                            .tint(.indigo)
                        Button("Button 4", role: .destructive) { }
                            .buttonStyle(.borderedProminent)
                        Button {
                            print("Edit button was tapped")
                        } label: {
                            Image(systemName: "pencil")
                        }
                    }
                    Button("Delete selection") {
                        showingAlert = true
                    }
                    Button {

                    } label: {
                        HStack {
                            Image(systemName: "square.and.arrow.up.circle.fill")
                                .foregroundStyle(.white)
                            Text("Click me!")
                                .foregroundStyle(.white)
                        }
                        .padding(.all, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.red.gradient)
                        )
//                        .shadow(radius: 1)
                    }
                    Section("Enter First Name") {
                        TextField("Enter your name", text: $name)
                        Button("Click Here - \(count)") {
                            count += 1
                        }
                    }
                    Section {
                        Picker(
                            "Select Position",
                            selection: $selectedPosition
                        ) {
                            ForEach(positions, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    Section {
                        ForEach(5..<10) {
                            Text("\($0)")
                        }
                    }
                }
                .padding()
            }
            .background(.clear)
            .navigationTitle("Ram Prasanth")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Important message", isPresented: $showingAlert) {
                Picker(
                    "Select Age",
                    selection: $selectedAge
                ) {
                    ForEach(18..<100, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
