//
//  GruppetizerListView.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 22.10.2024.
//

import SwiftUI

struct GruppetizerListView: View {
    
    @StateObject var viewModel = GruppetizersListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedGruppetizer: Gruppetizer?
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.gruppetizers) { gruppetizer in
                    GruppetizerListCell(gruppetizer: gruppetizer)
                        .onTapGesture {
                            selectedGruppetizer = gruppetizer
                            isShowingDetail = true
                        }
                }
                .navigationTitle("🥓 Gruppetizers")
                .listStyle(PlainListStyle())
                .disabled(isShowingDetail)
            }
            .onAppear {
                viewModel.getGruppetizers()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            if viewModel.isLoading {
                LoadingView()
            }
            
            if isShowingDetail {
                GruppetizerDetailView(gruppetizer: selectedGruppetizer!, isShowingDetail: $isShowingDetail)
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
