//
//  GruppetizersApp.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 22.10.2024.
//

import SwiftUI

@main
struct GruppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            GruppetizerTabView().environmentObject(order)
        }
    }
}
