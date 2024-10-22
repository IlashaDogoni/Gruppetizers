//
//  Gruppetizer.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 22.10.2024.
//

import Foundation

struct Gruppetizer : Decodable, Identifiable {
        var id : Int
        var name : String
        var description: String
        var price : Double
        var imageURL  : String
        var calories : Int
        var protein : Int
        var carbs : Int
}

struct GruppetizerResponse {
    let request : [Gruppetizer]
}

struct MockData {
    static let sampleGruppetizer = Gruppetizer(id: 0001,
                                               name: "Test Gruppetizer",
                                               description: "This is a yummy one, just eat and shit",
                                               price: 99.99,
                                               imageURL: "samplePicture",
                                               calories: 600,
                                               protein: 5,
                                               carbs: 40)
    
    static let gruppetizers = [sampleGruppetizer,sampleGruppetizer,sampleGruppetizer,sampleGruppetizer]
}
