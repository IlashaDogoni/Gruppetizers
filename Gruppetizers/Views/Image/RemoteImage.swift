//
//  RemoteImage.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 26.10.2024.
//

import SwiftUI

final class imageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromUrlString urlString: String) {
        NetworkManager.shared.downloadImage(fromUrlString: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct remoteImage: View {
    
    var image : Image?
    
    var body: some View {
        Group {
            if let image = image {
                image.resizable()
            } else {
                Image("samplePicture")
                    .resizable()
                    .saturation(0.3)
            }
        }
    }
}


struct GruppetizerRemoteImage: View {
    
    @StateObject var imageloader = imageLoader()
    let urlString: String
    
    var body: some View {
        remoteImage(image: imageloader.image)
            .onAppear { imageloader.load(fromUrlString: urlString)}
    }
}
