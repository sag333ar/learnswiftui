//
//  ContentView2.swift
//  learnswiftui
//
//  Created by Sagar on 24/10/24.
//

import SwiftUI

struct ContentView2: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool

    let tipPercentages = [10, 15, 20, 25, 0]

    var totalPerPerson: Double {
        let percent = Double(tipPercentage) / 100
        let tip = checkAmount * percent
        debugPrint("tip is \(tip)")
        let total = checkAmount + tip
        debugPrint("total is \(total)")
        debugPrint("number of people are \(numberOfPeople)")
        let perPerson = total / Double(numberOfPeople + 2)
        debugPrint("Per person is \(perPerson)")
        debugPrint("============")
        return perPerson
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD"
                        )
                    )
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                }

                Section("How much tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                }
                .pickerStyle(.segmented)

                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2..<100) {
                        Text("\($0) people")
                    }
                }
                .pickerStyle(.navigationLink)

                Section("Total Payment Value") {
                    Text(
                        checkAmount,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD"
                        )
                    )
                }

                Section("Total Per Person") {
                    Text(
                        totalPerPerson,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD"
                        )
                    )
                }

            }
            .navigationTitle("WeSplit")
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
    ContentView2()
}
