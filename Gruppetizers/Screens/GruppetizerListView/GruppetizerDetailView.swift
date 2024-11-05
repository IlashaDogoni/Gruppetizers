//
//  GruppetizerDetailView.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 27.10.2024.
//

import SwiftUI

struct GruppetizerDetailView: View {
    
    let gruppetizer: Gruppetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack{
            GruppetizerRemoteImage(urlString: gruppetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 320, height: 222)
                Spacer()
            VStack{
                Text(gruppetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(gruppetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40){
                    NutritionInfo(title: "Calories", value: gruppetizer.calories)
                    NutritionInfo(title: "Carbs", value: gruppetizer.carbs)
                    NutritionInfo(title: "Protein", value: gruppetizer.protein)
                }
            }
            Spacer()
            
            Button{
                print("Tapped")
            } label: {
               GPButton(title: "$\(gruppetizer.price, specifier: "%.2f") - Add to Order")
            }
            .padding(30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .brandPrimary, radius: 30)
        .overlay(Button{
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    GruppetizerDetailView(gruppetizer: MockData.sampleGruppetizer, isShowingDetail: .constant(true))
}


struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5){
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
