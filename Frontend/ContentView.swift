//
//  ContentView.swift
//  Frontend
//
//  Created by 임승현 on 2023/05/17.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                // Handle button tap
            }) {
                Text("Tap Me")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}
