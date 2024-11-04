//
//  XDismissButton.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 04.11.2024.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
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
    }
}

#Preview {
    XDismissButton()
}
