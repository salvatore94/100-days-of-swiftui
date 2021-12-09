## Day 17: Project 1: WeSplit, Part Two

This is the part two of the WeSplit building project. We are going to the implementation step, which will focus on:

- Reading text form the user with TextField
- Creating pickers in a form
- Adding a segmented control for tip percentages
- Calculating the total per person
- Hiding the keyboard


## Reading text from the user with TextField
We can display a floating with the initializer TextField(_value:formatter:) passing a formatter with the adeguate .numberStyle.
For our purpose we will use the .currency style.
If we supply a String value, the textfield updates this value continuosly as the user types in the field. For non-string types, it updates the value when the user commits theri edit (pressing the Return key).


## Creating Pickers in a form
To interact with a Picker placed inside a Form we need to wrap the View that contains the Form itself inside a NavigationView.
We create a picker using Picker(label:selection:content), the selection is a binding parameter that rappresents the selected row's index.

To add a title to the navigation bar we use .navigationTitle() modifier.
It needs to be attached to the end of the Form. If we place that modifier at the endo of the NavigationView it wouldn't have any effect.
Why it works in such way? Because NavigationView can show many views as the app runs and attaching the title to the thing *inside* the navigation view allow the system to change titles freely.

## Adding a segmented cotrol for tip percentages
A segmented control is a specialized kind of picker that shows a handful of options in a horizontal list. It works great with a small selection to choose from.


## Hiding the keyboard
When using the decimal and the numeric keypads swiftui don't show the return key, this means that once the keyboard is shown it never gets hidden on our application.
To fix this we need to give some way of determining whether the che amout box shoud currently have focus. We also need to add some kind of button to remove that focus when the user wants, which will cause the keyboard to go away.

We can use the @FocusState property wrapper to track when the amount check box should have the focus and pass the modifier .focused(), which accepts a binding, to the TextField.
To allow user to dismiss the keyboard we can add a button to the toolbar. We can add a ToolBar by appling the modifier .toolbar() below the .navigationTitle() modifier. As for the navigation title, we need to place inside the navigation view.

.toolbar {
    ToolbarItemGroup(placement: .keyboard) {           
        Button("Done") {
            amountIsFocused = false
        }
    }
}

We are using the ToolbarItemGroup() to place a button above the keyboard, but what are the ToolbarItemGroups?
ToolbarItemGroup lets us place one or more buttons in a specific location, and this is where we get to specify we want a keyboard toolbar – a toolbar that is attached to the keyboard, so it will automatically appear and disappear with the keyboard.

ToolbarItemGroup is designed to group views in the same toolbar. It removes the need for explicit usage of ToolbarItem. 
