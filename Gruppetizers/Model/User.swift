//
//  User.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 07.11.2024.
//

import Foundation

struct User: Codable {
    var firstName           = ""
    var lastName            = ""
    var email               = ""
    var birthdate           = Date()
    var extraNapkins        = false
    var frequentRefills     = false
}
