//
//  GruppetizersListViewModel.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 23.10.2024.
//

import SwiftUI

final class GruppetizersListViewModel: ObservableObject {
    
    @Published var gruppetizers : [Gruppetizer] = []
    
    func getGruppetizers() {
        NetworkManager.shared.getGruppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let gruppetizers):
                    self.gruppetizers = gruppetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
