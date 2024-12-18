//
//  NetworkManager.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 23.10.2024.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    internal let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "http://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let gruppetizersURL = baseURL + "appetizers"
    
    private init (){}
    
    func getGruppetizers(completed: @escaping (Result<[Gruppetizer], GPError>) -> Void) {
        guard let url = URL(string: gruppetizersURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url )) { data, response, error in
            if let _ = error {
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
    
    
    func downloadImage(fromUrlString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url )) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)

            DispatchQueue.main.async {
                        completed(image)
                    }
            
        }
        task.resume()
    }
}
