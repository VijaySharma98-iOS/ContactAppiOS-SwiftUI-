//
//  DatabaseHelper.swift
//  ContactApp-SwiftUI
//
//  Created by Vijay Sharma on 17/10/24.
//

import RealmSwift

class DatabaseHelper {
    
    static let shared = DatabaseHelper()
    
    private var realm = try! Realm()
    
    init() {
        print(getDatabaseURl() ?? "")
    }
    
    func getDatabaseURl() -> URL? {
        return realm.configuration.fileURL
    }
    func saveContact(_ contact: Contact) {
        try! realm.write {
            realm.add(contact)
        }
    }
    func getAllContacts() -> [Contact] {
        return Array(realm.objects(Contact.self))
    }
    func deleteContact(_ contact: Contact) {
        try! realm.write {
            realm.delete(contact)
        }
    }
    
    func updateContact(oldContact: Contact, newContact: Contact) {
        try! realm.write {
            oldContact.firstName = newContact.firstName
            oldContact.lastName = newContact.lastName
        }
    }
    
    
}
