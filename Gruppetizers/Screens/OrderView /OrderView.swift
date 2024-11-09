//
//  OrderView.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 22.10.2024.
//

import SwiftUI


struct OrderView: View {
    
    @State private var orderItems = MockData.orderItems
        
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orderItems) {gruppetizer in
                        GruppetizerListCell(gruppetizer: gruppetizer)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(.plain)
                    Button {
                        print("Order tapped")
                    } label: {
                        GPButton(title: "$99.99 - Place Order")
                    }
                    .padding(.bottom, 30)
                }
                
                if orderItems.isEmpty {
                    OrderEmptyState(imageName: "list.clipboard", message: "You have no items in the order. Please add a Gruppetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
