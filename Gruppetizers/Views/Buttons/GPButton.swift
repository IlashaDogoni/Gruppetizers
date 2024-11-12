//
//  GPButton.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 04.11.2024.
//

import SwiftUI

struct GPButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(Color.white)
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    GPButton(title: "Test Button title")
}
