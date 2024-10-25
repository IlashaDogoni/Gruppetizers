//
//  GruppetizerListView.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 22.10.2024.
//

import SwiftUI

struct GruppetizerListView: View {
    
    @StateObject var viewModel = GruppetizersListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.gruppetizers) { gruppetizer in
                    GruppetizerListCell(gruppetizer: gruppetizer)
                }
                .navigationTitle("🥓 Gruppetizers")
            }
            .onAppear {
                viewModel.getGruppetizers()
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    GruppetizerListView()
}
