//
//  LetsConvert.swift
//  learnswiftui
//
//  Created by Sagar on 25/10/24.
//

import SwiftUI

struct LetsConvert: View {
    @FocusState private var kmFocused: Bool
    @FocusState private var milesFocused: Bool

    @State var textKM = ""
    @State var textMiles = ""

    @State var kms = 0.0
    @State var miles = 0.0

    var formatter: NumberFormatter {
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        fmt.maximumFractionDigits = 3
        return fmt
    }

    var kmsString: String {
        formatter.string(from: NSNumber(value: kms)) ?? ""
    }

    var milesString: String {
        formatter.string(from: NSNumber(value: miles)) ?? ""
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Enter Values in KM") {
                    TextField("Kilometers", text: $textKM)
                        .keyboardType(.decimalPad)
                        .focused($kmFocused)
                        .onChange(of: textKM) { oldValue, newValue in
                            if let value = formatter.number(from: newValue) {
                                kms = value.doubleValue
                            } else {
                                kms = 0.0
                            }
                            miles = kms * 0.621371
                        }
                }
                Section("Enter Values in Miles") {
                    TextField("Miles", text: $textMiles)
                        .keyboardType(.decimalPad)
                        .focused($milesFocused)
                        .onChange(of: textMiles) { oldValue, newValue in
                            if let value = formatter.number(from: newValue) {
                                miles = value.doubleValue
                            } else {
                                miles = 0.0
                            }
                            kms = miles * 1.609344
                        }
                }
                Section("Conversion") {
                    Text("\(kmsString) Kms = \(milesString) Miles")
                }
            }
            .navigationTitle("Convert KM <=> Miles")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if kmFocused {
                    Button("Done") {
                        kmFocused = false
                    }
                }
                if milesFocused {
                    Button("Done") {
                        milesFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    LetsConvert()
}
