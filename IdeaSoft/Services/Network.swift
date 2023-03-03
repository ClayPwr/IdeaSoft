//
//  Network.swift
//  IdeaSoft
//
//  Created by User on 3/1/23.
//

import Foundation

protocol NetworkProtocol {
    func fetchData<T: Codable>() async throws -> [T]
}

public final class Network: NetworkProtocol {
    
    enum NetworkFetcherError: Error {
        case invalidURL
        case badResponse
        case errorDecoding
    }
    
    private let urlString = "https://run.mocky.io/v3/1c4cfa98-e329-4d49-8836-8ee195cec131"
    
    func fetchData<T: Codable>() async throws -> [T] {
        guard let url = URL(string: urlString) else {
            throw NetworkFetcherError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkFetcherError.badResponse
        }
        
        guard let result = try? JSONDecoder().decode([T].self, from: data) else {
            throw NetworkFetcherError.errorDecoding
        }
        return result
    }
}
