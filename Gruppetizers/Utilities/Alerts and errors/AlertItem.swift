//
//  AlertItem.swift
//  Gruppetizers
//
//  Created by Ilya Kokorin on 25.10.2024.
//

import SwiftUI

struct AlertItem : Identifiable {
    let id =  UUID()
    let title: Text
    let message : Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    //MARK: TableView Alerts
    static let invalidData      = AlertItem(title: Text("Server error"),
                                              message: Text("The data received from the server was invalid.Please contact support."),
                                              dismissButton: .default(Text("OK")))
    
    static let invalidResponse  = AlertItem(title: Text("Server error"),
                                               message: Text("Invalid response from the server. Please try again later or contact support."),
                                               dismissButton: .default(Text("OK")))
    
    static let invalidURL       = AlertItem(title: Text("Server error"),
                                              message: Text("There was an issue connecting to the server. If this persist, please contact support."),
                                              dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server error"),
                                               message: Text("Unable to complete you request at this time. Please check your internet connection."),
                                               dismissButton: .default(Text("OK")))
    
    //MARK: Account Alerts
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                               message: Text("Please ensure all fields in the form are filled out"),
                                               dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalide Email"),
                                               message: Text("Please ensure your email is correct"),
                                               dismissButton: .default(Text("OK")))
        
}
