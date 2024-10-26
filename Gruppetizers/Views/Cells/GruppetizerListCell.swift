//
//  GruppetizerListCell.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 22.10.2024.
//

import SwiftUI

struct GruppetizerListCell: View {
    
    let gruppetizer: Gruppetizer
     
    var body: some View {
        HStack {
            GruppetizerRemoteImage(urlString: gruppetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(gruppetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(gruppetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    GruppetizerListCell(gruppetizer: MockData.sampleGruppetizer)
}
