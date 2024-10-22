//
//  GruppetizerListView.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 22.10.2024.
//

import SwiftUI

struct GruppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.gruppetizers) { gruppetizer in
                GruppetizerListCell(gruppetizer: gruppetizer)
            }
            .navigationTitle("🥓 Gruppetizers")
        }
    }
}

#Preview {
    GruppetizerListView()
}
