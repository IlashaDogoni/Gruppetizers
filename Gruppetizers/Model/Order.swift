//
//  Order.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 11.11.2024.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items : [Gruppetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price }
    }
    
    
    func add(_ gruppetizer: Gruppetizer) {
        items.append(gruppetizer)
    }
    
    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
