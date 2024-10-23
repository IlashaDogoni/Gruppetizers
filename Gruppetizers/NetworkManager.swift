//
//  NetworkManager.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 23.10.2024.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "http://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    private let gruppetizersURL = baseURL + "appetizers"
    
    private init (){}
    
    func getGruppetizers(completed: @escaping (Result<[Gruppetizer], APError>) -> Void) {
        guard let url = URL(string: gruppetizersURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url )) { data, response, error in
            guard let _ = error else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return 
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(GruppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                    completed(.failure(.invalidData))
                }
        }
        task.resume()
    }
}
