//
//  OrderEmptyState.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 09.11.2024.
//

import SwiftUI

struct OrderEmptyState: View {
    
    let imageName: String
    let message:   String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .foregroundStyle(.accent)
                    .opacity(0.8)
                    .tint(.gray)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y: -60)
        }
    }
}

#Preview {
    OrderEmptyState(imageName: "list.clipboard", message: "Default message.\nLet it be a long one just for testing")
}
