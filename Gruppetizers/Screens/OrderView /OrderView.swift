//
//  OrderView.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 22.10.2024.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order : Order
    
        
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) {gruppetizer in
                        GruppetizerListCell(gruppetizer: gruppetizer)
                        }
                        .onDelete(perform: order.delete)
                    }
                    .listStyle(.plain)
                    Button {
                        print("Order tapped")
                    } label: {
                        GPButton(title: "\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 30)
                }
                
                if order.items.isEmpty {
                    OrderEmptyState(imageName: "list.clipboard", message: "You have no items in the order. Please add a Gruppetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

#Preview {
    OrderView()
}
