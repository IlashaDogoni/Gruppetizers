//
//  ContentView.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 22.10.2024.
//

import SwiftUI

struct  GruppetizerTabView: View {
    var body: some View {
        
        TabView{
            GruppetizerListView()
                .tabItem { Image(systemName: "house")
                Text("Home")}
            AccountView()
                .tabItem { Image(systemName: "person")
                Text("Account")}
            OrderView()
                .tabItem { Image(systemName: "bag")
                Text("Order")}
        }
        .accentColor(Color("brandPrimary"))
    }
}

#Preview {
    GruppetizerTabView()
}
