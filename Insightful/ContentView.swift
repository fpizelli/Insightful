//
//  ContentView.swift
//  Insightful
//
//  Created by Felipe Pizelli on 06/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Text("Hello!")
                .font(.title.bold())
                
            Text("Another hello!")
                .font(.subheadline)
            
            Spacer()
            
            HStack {
                Button("Tap for more", action: { })
                
                Spacer()
                
                Button(action: { }) {
                    Image(systemName: "bookmark")
                }
                .accessibilityLabel("Bookmark quote")
                
                
                Button(action: { }) {
                    Image(systemName: "square.and.arrow.up")
                }
                .accessibilityLabel("Share quote")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
