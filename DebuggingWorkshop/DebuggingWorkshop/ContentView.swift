//
//  ContentView.swift
//  DebuggingWorkshop
//
//  Created by Yomna Eisa on 08/01/2026.
//

/**
 
 Counter doesn’t increase   ---->  Breakpoint + Step Through
 Red background sizing issue  ---->   View Debugger
 Index out of range  ---->   Crash + Stack Trace
 
 */
import SwiftUI

struct DebuggingPlaygroundView: View {
    
    // State variables
    @State private var counter: Int = 0
  //  @State private var username: String = ""
 //   @State private var isLoggedIn: Bool = false
    
    // Sample array for crash
    let numbers = [1, 2, 3]
    
    var body: some View {
        VStack(spacing: 30) {
            
            // MARK: - View Debugger Bug
          
                   // CORRECT CODE
            
//            Text("Welcome to Swifters \(username)")
//                .font(.title)
//                .padding()
//                .foregroundStyle(Color.white)
//                .background(Color.purple) // Background may look wrong in view debugger
//                .cornerRadius(100)
            
            // We have a corner radius and padding, why isn't showing?
            // Lets use View Debugger
            // Run your code, come back to Xcode and select the view debugger icon (3 layers stacked and pointing right)
            Text("Welcome to Swifters")
                .font(.title)
                .cornerRadius(100)
                .foregroundStyle(Color.white)
                .background(Color.purple)
                .padding()


            
//            TextField("Enter username", text: $username)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.horizontal)
//
            
            Divider()
            
            // MARK: - Counter Bug (Breakpoint)
            Button("Increase Counter") {
                increaseCounter()
            }
            
            Text("Counter: \(counter)")
            
            
            Divider()
            
            // MARK: - Crash Buttons
            VStack(spacing: 10) {
                Button("Perfectly normal button, i am NOT evil App crashing button ") {
                    crashIndexOutOfRange()
                }
            }
        }
        .padding()
    }
    
    // MARK: - Counter Bug (Breakpoint)
    // here, we will use a breapoint to freeze the code in time at this point
    func increaseCounter() {
        counter = counter + 1 // Lets try po counter in the consle
        counter = counter - 1 // counter never actually increases
    }
    
    
    // MARK: - Crash Functions
    func crashIndexOutOfRange() {
        let value = numbers[5] // Index out of range
        print(value)
    }
    
}

#Preview {
    DebuggingPlaygroundView()
}
