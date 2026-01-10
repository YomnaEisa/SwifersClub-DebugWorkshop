//
//  ContentView.swift
//  DebuggingWorkshop
//
//  Created by Yomna Eisa on 08/01/2026.
//

import SwiftUI

struct DebuggingPlaygroundView: View {
    
    // State variables
    @State private var counter: Int = 3
    @State private var items: [String]? = ["Worm 🪱", "LadyBug 🐞", "Beatle 🪲"]

    var body: some View {
        VStack(spacing: 30) {
            
            // VIEW DEBUGGER BUG
            // One view exists but is hidden behind another
            // Use View Debugger to discover it
            ZStack {
                Text("I should be visible 🐛")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                
                Text("I am covering the other text")
                    .font(.title)
                    .padding()
                    .background(Color.red)
            }

            Divider()
            
            Button("Increase Bug Counter") {
                increaseCounter()
            }
            
            Text("Bug Counter: \(counter)")
            
            Divider()
            
            // List Section
            Text("Bugs List")
                .font(.headline)
            List {
                ForEach(items ?? [], id: \.self) { item in
                    Text(item)
                }
            }
            .frame(height: 230)
            .cornerRadius(10)
            
            
            // Crash Button
            Button("Perfectly normal button, i am NOT evil App crashing button") {
                crashIndexOutOfRange()
            }
        }
        .padding()
    }
    
    // BREAKPOINT DEBUGGING
    func increaseCounter() { // add breakpoint here, and step
        counter += 2 // use PO counter in the console to see the update
    }
    
    // CRASH DEBUGGING
    func crashIndexOutOfRange() {
        let value = items?[3] // index out of range causes a crash
        print(value!)
    }
}

#Preview {
    DebuggingPlaygroundView()
}
