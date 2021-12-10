# Day 18: Project 1: WeSplit, Part Three

## Review
1) Swiftui allows no more than 10 child views inside each parent, if you want to add more you should place your views inside groups.
All Swiftui views must iherit form the *View* protocol
2) Formatteres let us to control the way numbers are shown inside Text views.
When usingi a currency code is better to read the user's Locale insetad of force a particulare currency code.
3) Segmented controls are created usign picker views in Swiftui, we specify the style with .pickerStyle() modifier.
4) Forms can scroll.
5) We can change the keyboard type with .keyboardType() modifier.
6) When creating a text field we need to provide some placeholder text, this helps users see what should be entered and also is useful to screen readers.
7) All swiftui views must have a body property, is the only requirement of the View protocol. It needs to return precisely oone view. That view might contain more views inside it but you still need to return precisely one from the computed property.
8) We can use .navigationTitle() to set the title of the navigation view. You should attach this modifier inisde the navigation view rather than the navigation view itself.
9) If we want to modify a property we need to use a swiftui property wrapper.
@State tells Swiftuio to store the value somewhere that chan be changet freely, outsside of our struct.
10) ForrEach views let us loop over ranges and arrays. They are used to ceate many istances of something very quickly.
Swiftui doesn't allow more than 1' hard-coded items inside a parent, but views created using ForEach don't count towards that limit.
11) Whenever a @State property changes, Swift re-invokes our body property. This forces all values inside the body to be re-evaluated (also computed property that make use of @State properties).
@State properties should use *private* access control.
12) Swiftui previews aren't included in our app if we send it to the AppStore.


## Challenges
1) Add a header to the third section, saying “Amount per person” 
2) Add another section showing the total amount for the check – i.e., the original amount plus tip value, without dividing by the number of people.
3) Change the tip percentage picker to show a new screen rather than using a segmented control, and give it a wider range of options – everything from 0% to 100%. Tip: use the range 0..<101 for your range rather than a fixed array.
