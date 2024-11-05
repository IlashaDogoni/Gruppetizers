//
//  AccountViewModel.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 05.11.2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var alertItem: AlertItem?
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    
    var isValidForm : Bool {
        
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
        
    }
    
    func saveChanges() {
        
        guard isValidForm else { return }
        print("form saved")
        
        
    }
}

 

