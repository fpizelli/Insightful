//
//  QuoteData.swift
//  Insightful
//
//  Created by Felipe Pizelli on 06/10/24.
//

import Foundation

struct QuoteData: Codable {
    let author: String
    let quote: String
}

enum QDError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

func getQuote() async throws -> QuoteData {
    let endpoint = "https://quotes-api-self.vercel.app/quote"
    
    guard let url = URL(string: endpoint) else {
        throw QDError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw QDError.invalidResponse
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(QuoteData.self, from: data)
    } catch {
        throw QDError.invalidData
    }
}
