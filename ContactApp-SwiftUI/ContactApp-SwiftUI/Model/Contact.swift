//
//  Contact.swift
//  ContactApp-SwiftUI
//
//  Created by Vijay Sharma on 16/10/24.
//

import SwiftUI
import RealmSwift


class Contact: Object {
    //var id = UUID().uuidString
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var firstName: String
    @Persisted var lastName: String
    
    convenience init(firstName: String, lastName: String) {
        self.init()
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
