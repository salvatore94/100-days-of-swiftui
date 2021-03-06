//
//  ContentView.swift
//  Shared
//
//  Created by Salvatore Polito on 09/12/21.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    @State private var checkAmount = 0.1
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    private let tipPercentages = [10, 15, 20, 25, 0]
    
    private var currencyFormatter: FloatingPointFormatStyle<Double>.Currency  {
        get {
            let code = Locale.current.currencyCode ?? "USD"
            
            return FloatingPointFormatStyle<Double>.Currency(code: code)
        }
    }
    
    private var decimalFormatter: NumberFormatter {
        get {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencyCode = Locale.current.currencyCode ?? "USD"
            return formatter
        }
    }
    
    //Since all the properties used inside this computed property are marked as @State
    //any changes to one of them makes this property to be recalculated
    //and also the entire view will be reevaluated
    private var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    private var totalAmount : Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    /*
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                     */
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalAmount, format: .currency(code: "USD"))
                    Text(totalAmount, format: currencyFormatter)
                } header: {
                    Text("Total Amout")
                }
                
                Section {
                        Text(totalPerPerson, format: currencyFormatter)
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("WeSplit")
            
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    //using a spacer to attach the button to the trailing
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
