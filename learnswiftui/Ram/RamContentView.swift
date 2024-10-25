//
//  RamContentView.swift
//  learnswiftui
//
//  Created by Sagar on 24/10/24.
//

import SwiftUI

struct RamContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20

    let tipPercentages = [10, 15, 20, 25, 0]

    @FocusState private var amountIsFocused: Bool

    var totalPerPerson: Double {
        debugPrint("===============")
        debugPrint("checkAmount = \(checkAmount)")
        debugPrint("numberOfPeople = \(numberOfPeople)")
        debugPrint("tipPercentage = \(tipPercentage)")
        let tipAmount = checkAmount * Double(tipPercentage) / 100
        debugPrint("tipAmount = \(tipAmount)")
        let totalAmount = checkAmount + tipAmount
        debugPrint("totalAmount = \(totalAmount)")
        return totalAmount / Double(numberOfPeople)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Enter Bill Amount") {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                }

                if (!amountIsFocused) {
                    Section("Select Tip Percentage") {
                        Picker("Tip Percentages", selection: $tipPercentage) {
                            ForEach(tipPercentages, id: \.self) { i in
                                Text(i, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<10, id: \.self) { i in
                            Text("\(i) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    Section("Pay per Person") {
                        Text(
                            totalPerPerson,
                            format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                        )
                    }
                }
            }
            .navigationTitle("We Split the bill")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    RamContentView()
}
