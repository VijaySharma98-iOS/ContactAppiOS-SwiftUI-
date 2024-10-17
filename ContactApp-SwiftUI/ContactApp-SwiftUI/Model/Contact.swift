//
//  Contact.swift
//  ContactApp-SwiftUI
//
//  Created by Vijay Sharma on 16/10/24.
//

import SwiftUI


class Contact {
    var id = UUID().uuidString
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    static let sampleData: [Contact] = [
        Contact(firstName: "Vijay", lastName: "Sharma"),
        Contact(firstName: "Ajay", lastName: "Kumar"),
        Contact(firstName: "Rahul", lastName: "Kumar"),
        Contact(firstName: "Suresh", lastName: "Kumar"),
        Contact(firstName: "Ravi", lastName: "Kumar")
    ]
}
