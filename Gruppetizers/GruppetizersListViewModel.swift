//
//  GruppetizersListViewModel.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 23.10.2024.
//

import SwiftUI

final class GruppetizersListViewModel: ObservableObject {
    
    @Published var gruppetizers : [Gruppetizer] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading = false
    
    func getGruppetizers() {
        isLoading = true
        
        NetworkManager.shared.getGruppetizers { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                
                switch result {
                case .success(let gruppetizers):
                    self.gruppetizers = gruppetizers
                    
                case .failure(let error):
                    switch error{
                    case.invalidData:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
