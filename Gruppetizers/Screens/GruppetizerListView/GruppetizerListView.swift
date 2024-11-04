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
                        .onTapGesture {
                            viewModel.selectedGruppetizer = gruppetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🥓 Gruppetizers")
                .listStyle(PlainListStyle())
                .disabled(viewModel.isShowingDetail)
            }
            .onAppear {
                viewModel.getGruppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            if viewModel.isLoading {
                LoadingView()
            }
            
            if viewModel.isShowingDetail {
                GruppetizerDetailView(gruppetizer: viewModel.selectedGruppetizer!, isShowingDetail: $viewModel.isShowingDetail)
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
