//
//  ContentView3.swift
//  learnswiftui
//
//  Created by Sagar on 24/10/24.
//

import SwiftUI

struct ContentView3: View {
    //  °F = °C * 9/5 + 32
    @State var celsiusInput = ""
    @State var fahrenheitInput = ""
    @State var celsius = 0.0
    @State var fahrenheit = 0.0

    var cString: String {
        let cNumber = NSNumber(value: celsius)
        return formatter.string(from: cNumber) ?? ""
    }

    var fString: String {
        let fNumber = NSNumber(value: fahrenheit)
        return formatter.string(from: fNumber) ?? ""
    }

    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        formatter.numberStyle = .decimal
        return formatter
    }

    var body: some View {
        ZStack {
            LinearGradient(
                stops: [
                    .init(color: .white, location: 0.25),
                    .init(color: .black, location: 0.95),
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            VStack {
                Section("Value in Celsius") {
                    TextField("℃",text: $celsiusInput)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                        .onChange(of: celsiusInput, initial: false) { old, new in
                            if let celsius = formatter.number(from: old) {
                                self.fahrenheit = celsius.doubleValue * 9.0 / 5.0 + 32.0
                                self.celsius = celsius.doubleValue
                            }
                        }
                }
                Button("Button 3") { }
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
                Button {
                    print("Button was tapped")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.red)
                            .shadow(radius: 1)
                        HStack {
                            Image(systemName: "pencil")
                                .foregroundStyle(.background)
                            Text("Tap me!")
                                .foregroundStyle(.white)
                        }
                        .padding(.all, 5)
                    }
                    .frame(minWidth: 0, maxWidth: 125, minHeight: 0, maxHeight: 40)
                }
                Section("Value in Fahrenheit") {
                    TextField("℉",text: $fahrenheitInput)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                        .onChange(of: fahrenheitInput, initial: false) { old, new in
                            if let fahrenheit = formatter.number(from: old) {
                                self.celsius = (fahrenheit.doubleValue - 32.0) * 5.0 / 9.0
                                self.fahrenheit = fahrenheit.doubleValue
                            }
                        }
                }

                Section("Conversion Result") {
                    Text("\(cString) ℃ = \(fString) ℉")
                }
            }.padding(.all, 30)
        }
    }
}

#Preview {
    ContentView3()
}
