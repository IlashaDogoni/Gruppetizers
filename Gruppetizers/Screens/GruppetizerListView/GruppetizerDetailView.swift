//
//  GruppetizerDetailView.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 27.10.2024.
//

import SwiftUI

struct GruppetizerDetailView: View {
    
    let gruppetizer: Gruppetizer
    
    var body: some View {
        VStack{
            Image("samplePicture")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 320, height: 222)
            
            VStack{
                Text(gruppetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(gruppetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40){
                    VStack(spacing: 5){
                        Text("Calories")
                            .bold()
                            .font(.caption)
                        Text("\(gruppetizer.calories)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack(spacing: 5){
                        Text("Carbs")
                            .bold()
                            .font(.caption)
                        Text("\(gruppetizer.carbs)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack(spacing: 5){
                        Text("Protein")
                            .bold()
                            .font(.caption)
                        Text("\(gruppetizer.protein)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
            }
            Spacer()
            
            Button{
                print("Tapped")
            } label: {
                Text("$\(gruppetizer.price, specifier: "%.2f") - Add to Order")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundStyle(Color.white)
                    .background(Color.brandPrimary)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .brandPrimary, radius: 30)
        .overlay(Button{
            print("dismiss")
        } label: {
            ZStack{
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(Color.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundStyle(Color.black)
            }
        }, alignment: .topTrailing)
    }
}

#Preview {
    GruppetizerDetailView(gruppetizer: MockData.sampleGruppetizer)
}
