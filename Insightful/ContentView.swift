//
//  ContentView.swift
//  Insightful
//
//  Created by Felipe Pizelli on 06/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var quoteData: QuoteData?
    
    var formattedQuote: String {
        guard let quote = quoteData?.quote.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) else {
            return "this is a nice and inspiring quote"
        }
        
        var cleanedQuote = quote
        
        while cleanedQuote.hasSuffix(".") || cleanedQuote.hasSuffix("!") || cleanedQuote.hasSuffix("!!") || cleanedQuote.hasSuffix("!!!") {
            cleanedQuote.removeLast()
        }
        
        return cleanedQuote
    }

    var formattedAuthor: String {
        quoteData?.author.lowercased() ?? "the nice and inspiring quote author's"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\u{201c}")
                .font(.custom("HelveticaNeue-CondensedBlack", size: 90))
                .padding(.top, -20)
                .padding(.bottom, 10)
            
            Spacer()
            
            Text(formattedQuote)
                .font(.system(
                    size: 32,
                    weight: .light,
                    design: .default))
                .lineSpacing(5)
                .padding(.bottom, 20)
                
            Text(formattedAuthor)
                .font(.system(
                    size: 20,
                    weight: .bold,
                    design: .default))
                .foregroundStyle(.primary.opacity(0.7))
            
            Spacer()
            Spacer()
            Spacer()
            
            HStack {
                Button("tap for more") {
                    Task {
                        await fetchNewQuote()
                    }
                }
                .foregroundStyle(.primary)
                .font(.title2)
                
                Spacer()
                
                var formattedData: String {
                    return "\(formattedQuote)\n\n\(formattedAuthor)"
                }
                
                ShareLink(item: formattedData) {
                    Label("", systemImage: "square.and.arrow.up")
                }
                    .foregroundStyle(.primary)
                    .font(.title2)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 30)
        .task {
            await fetchNewQuote()
        }
    }
    
    private func fetchNewQuote() async {
        do {
            quoteData = try await getQuote()
        } catch QDError.invalidURL {
            print("Invalid URL!")
        } catch QDError.invalidResponse {
            print("Invalid response!")
        } catch QDError.invalidData {
            print("Invalid data!")
        } catch {
            print("Unexpected error!")
        }
    }
}

#Preview {
    ContentView()
}
