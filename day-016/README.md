# Day 16: Project 1: WeSplit, Part One

## WeSplit: Introduction
In this project we’re going to be building a check-splitting app that you might use after eating a restaurant – you enter the cost of your food, select how much of a tip you want to leave, and how many people you’re with, and it will tell you how much each person needs to pay.

This project isn’t trying to build anything complicated, because its real purpose is to teach you the basics of SwiftUI in a useful way while also giving you a real-world project you can expand on further if you want.

## Understanding the basic structure of a SwiftUI app

* WeSplitApp.swift contains code for launching your app. We can put here everything we want to keep alive the intire time
* ContentView.swift contains the initial user interface for the app

## Creating a Form
Form are convenient ways to layout inteface intended to request userdata input. It reminds me the idea of a static UITableView, now without dealing whit DataSource and Delegates.
SwiftUI's Form is a container that applies platform-appropriate styling to views that contains. A form can have none to multiple *Section*, a section can accept a view that acts as header and it's role is to gruop related items visually.

Form {
    Text("Hi here!")
    Section(header: Text("This is an Header")) {
        Text("Hi Again!")
    }
}

## Adding a NavigationView
If we use a Form as main container it's origin will be placed by swiftui on CGPoint(0,0), so above the notch. This will cause the form to scroll under the notch itself, ignoring the safe area.
To address this behaviour we can wrap the Form inside a NaviganionView, so that a NavigationBar will be sticking on top of the view, preventing anything to overlap the safearea.
Also, in swiftui a NavigationView give also the ability to display new views as NavigationLink. 
To set a title displayed by the NavigationView we use the modifier *.navigationTitle()*, navigation bar titles are configured by the outer-most navigationBarTitle modifier on a view within the NavigationView.
By default the navigationTitle is shown in LargeTitle mode, but the modifier *.navigationBarTitleDisplayMode()* can change this behaviour. For example inside Settings.app the first screen shows large text while subsequesnt screens shows small titles.


## Modifying program state
*Views are a function of their state* meaning that the way teh user interface looks is determinated by the state of the application.

@State allows us to work around the limitation of structs: we know we can’t change their properties because structs are fixed, but @State allows that value to be stored separately by SwiftUI in a place that can be modified.
@State is specifically designed for simple properties that are stored in onve view. As result, Apple recommends we add ]private] access control to these properties.


## Binding state to user interface controls 
To archive a two-way binding we use the dollar sign before a property name. 
A two-way binding means that we want to read the value and we want also to weite it back.
