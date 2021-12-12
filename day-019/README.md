# Day 19 WeSplit: Challenge day

The first proposed challenge is to create a new app that handles unit conversions: users will select an input unit and an output unit, then enter a value, and see the output of the conversion.

I'm chosing the temperature conversion.

# Plan
I will create a form populated by two sections: Input and Output.
Input section must have three child: 
1. value to convert
2. input unit
3. output unit

Output section should show the result.

The math that will handle the conversetion should be keept as simple as possible: I would convert the input value to Kelvin and than convert to the choosed unit.

[code]
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
[code]


However I found out tha we can use the Measurement type, which also shows the unit's symbol. I didn't know the existence of this type, and while my math works decently I decided to explore this way as a mean to grow.

[code]
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
[code]

We can feed a Text() with a measurement object, uning the relative formatter, but I had troubles with the conversion itself. To obtain replicable result I found a better deal using the MeasurementFormatter object specifying a .providedUnit.
I will explore also the article.
