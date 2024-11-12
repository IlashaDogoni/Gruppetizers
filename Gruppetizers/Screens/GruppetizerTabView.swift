//
//  ContentView.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 22.10.2024.
//

import SwiftUI

struct  GruppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        TabView{
            GruppetizerListView()
                .tabItem { Label("Home", systemImage: "house") }
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
        }
    }
}

#Preview {
    GruppetizerTabView()
}
