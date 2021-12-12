//
//  ContentView.swift
//  Shared
//
//  Created by Salvatore Polito on 11/12/21.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var textFieldFocus
    
    @State private var inputValue : Double = 0
    
    @State private var inputUnit : UnitTemperature = .celsius
    @State private var outputUnit: UnitTemperature = .kelvin
    private let units : [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
     
    //using builtin Measurement type
    private var outputValue : String {
         get {
             let input = Measurement(value: inputValue, unit: inputUnit)
             let output = input.converted(to: outputUnit)
             
             //we need to specify to use the provided unit instead of the system one
             let mf = MeasurementFormatter()
             mf.unitOptions = .providedUnit
             return mf.string(from: output)
         }
     }
    
    /*
    private var inputValueInKelvin: Double {
        get {
            switch inputUnit {
            case .celsius: return inputValue + 273
            case .fahrenheit: return (inputValue + 459.67) * 5/9
            case .kelvin: return inputValue
            default: return inputValue
            }
        }
    }
    
    private var outputValue : Double {
        get {
            switch outputUnit {
            case .celsius: return inputValueInKelvin - 273
            case .fahrenheit: return inputValueInKelvin * 9/5 - 459.67
            case .kelvin: return inputValueInKelvin
            default: return inputValueInKelvin
            }
        }
    }
     */
    
    var body: some View {
        NavigationView {
            Form {
                Section ("Input") {
                    HStack {
                        Text("Input")
                        Spacer()
                        Picker("Input unit", selection: $inputUnit) {
                            ForEach(units, id: \.self) {
                                Text($0.symbol)
                            }
                        }
                        .pickerStyle(.segmented)
                        .frame(width:200)
                    }
                    
                    HStack {
                        Text("Output")
                        Spacer()
                        Picker("Output unit", selection: $outputUnit) {
                            ForEach(units, id: \.self) {
                                Text($0.symbol)
                            }
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 200)
                    }
                    
                    HStack {
                        Text("Enter a value: ")
                        Spacer()
                        TextField("", value: $inputValue, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                        Text(inputUnit.symbol)
                    }
                }
                
                
                Section("Output") {
                    HStack {
                        Text("Selected input unit: ")
                        Spacer()
                        Text(inputUnit.stringName)
                    }
                    HStack {
                        Text("Selected output unit: ")
                        Spacer()
                        Text(outputUnit.stringName)
                    }
                    
                    HStack {
                        Text("Converted value: ")
                        Spacer()
                        Text(outputValue)
                    }
                }
                
                
            }
            .navigationTitle("WeConvert")
            
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        textFieldFocus = false
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private extension UnitTemperature {
    var stringName : String {
        get {
            switch self {
            case .celsius: return "Celsius"
            case .fahrenheit: return "Fahrenheit"
            case .kelvin: return "Kelvin"
            default: return "none"
            }
        }
    }
}
