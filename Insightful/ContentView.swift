//
//  ContentView.swift
//  Insightful
//
//  Created by Felipe Pizelli on 06/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("\u{201c}")
                .font(.custom("HelveticaNeue-CondensedBlack", size: 90))
                .padding(.top, -20)
                .padding(.bottom, 10)
            Spacer()
            
            Text("Lorem ipsum dolor, dolor lorem ipsum! Lorem ipsum dolor!")
                .font(.system(
                    size: 32,
                    weight: .light,
                    design: .default))
                .lineSpacing(5)
                .padding(.bottom, 20)
                
            Text("another hello!")
                .font(.system(
                    size: 20,
                    weight: .bold,
                    design: .default))
                .foregroundStyle(.primary.opacity(0.7))
            
            Spacer()
            Spacer()
            Spacer()
            
            HStack {
                Button("tap for more", action: { })
                    .foregroundStyle(.primary)
                    .font(.title2)
                
                Spacer()
                
                Button(action: { }) {
                    Image(systemName: "bookmark")
                }
                .accessibilityLabel("Bookmark quote")
                .foregroundStyle(.primary)
                .font(.title2)
                                
                Button(action: { }) {
                    Image(systemName: "square.and.arrow.up")
                }
                .accessibilityLabel("Share quote")
                .foregroundStyle(.primary)
                .font(.title2)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 30)
    }
}

#Preview {
    ContentView()
}
