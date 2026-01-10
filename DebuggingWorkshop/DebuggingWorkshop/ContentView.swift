//
//  ContentView.swift
//  DebuggingWorkshop
//
//  Created by Yomna Eisa on 08/01/2026.
//

import SwiftUI

struct DebuggingPlaygroundView: View {
    
    // State variables
    @State private var counter: Int = 0

    
    // Sample array for crash
    let numbers = [1, 2, 3]
    
    var body: some View {
        VStack(spacing: 30) {
                      

            // We have a corner radius and padding, why isn't showing?
            // Lets use View Debugger
            // Run your code, come back to Xcode and select the view debugger icon (3 layers stacked and pointing right)
            Text("Welcome to Swifters")
                .font(.title)
                .cornerRadius(100)
                .foregroundStyle(Color.white)
                .background(Color.purple)
                .padding()
       
            Divider()
            
            Button("Increase Counter") {
                increaseCounter()
            }
            
            Text("Counter: \(counter)")
            
            
            Divider()
            
            // Crash Buttons
            VStack(spacing: 10) {
                Button("Perfectly normal button, i am NOT evil App crashing button ") {
                    crashIndexOutOfRange()
                }
            }
        }
        .padding()
        
    }
    
    // here, we will use a breakpoint to freeze the code in time at this point
    func increaseCounter() { // add a breakpoint here
        counter = counter + 1 // Lets try po counter in the consle
        counter = counter - 1 // counter never actually increases
    }
    
    
    // Crash Functions
    func crashIndexOutOfRange() {
        let value = numbers[5] // Index out of range causing a crash
        print(value)
    }
    
}

#Preview {
    DebuggingPlaygroundView()
}
