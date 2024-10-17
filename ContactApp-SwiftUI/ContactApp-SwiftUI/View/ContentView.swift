//
//  ContentView.swift
//  ContactApp-SwiftUI
//
//  Created by Vijay Sharma on 16/10/24.
//
// YouTude Video link.
//https://www.youtube.com/watch?v=0cNiwVvVwNQ

import SwiftUI

struct ContentView: View {
    
    @State private var contactArray: [Contact] = Contact.sampleData
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<contactArray.count,id: \.self) { index in
                    ContactListView(contact: contactArray[index])
                    
                        .swipeActions {
                            Button {
                                
                                deleteAlert(index: index)
                            } label: {
                                Text("Delete")
                                Image(systemName: "trash")
                                    .tint(.red)
                                
                            }
                            
                            Button {
                                openAlert(isAdd: false, index: index)
                            } label: {
                                Text("Update")
                                Image(systemName: "pencil")
                                    .tint(.indigo)
                                
                            }
                            
                        }
                    
                }
                
            }
            
            .navigationTitle("Contacts")
            .toolbar {
                Button {
                    openAlert(isAdd: true)
                } label: {
                    Image(systemName: "plus")
                        .tint(.black)
                }
            }
            
            
        }
        .onAppear() {
            contactArray = DatabaseHelper.shared.getAllContacts()
        }
    }
}


extension ContentView {
    func openAlert(isAdd: Bool,index: Int = 0) {
        let alertController = UIAlertController(title: isAdd ? "Add Contact" : "Update Contact",
                                                message: isAdd ? "Please enter your contact details." :"Please update your contact details.",
                                                preferredStyle: .alert)
        alertController.addTextField { firstName in
            if isAdd {
                firstName.placeholder = "Enter your first name"
            } else {
                firstName.placeholder = contactArray[index].firstName
            }
            
            firstName.placeholder = isAdd ? "Enter your first name" : contactArray[index].firstName
        }
        alertController.addTextField { lastName in
            lastName.placeholder = isAdd ? "Enter your last name" : contactArray[index].lastName
        }
        
        let save = UIAlertAction(title: isAdd ? "Save" :"Update", style: .default) { _ in
            if let firstName = alertController.textFields?.first?.text,
               let lastName = alertController.textFields?[1].text {
                let contact = Contact(firstName: firstName, lastName: lastName)
                if isAdd {
                    self.contactArray.append(contact)
                    DatabaseHelper.shared.saveContact(contact)
                } else {
                    DatabaseHelper.shared.updateContact(oldContact: self.contactArray[index], newContact: contact)
                    self.contactArray[index] = contact
                    
                    
                }
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(save)
        alertController.addAction(cancel)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true)
        
    }
    func deleteAlert(index: Int) {
        let delAlert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            DatabaseHelper.shared.deleteContact(contactArray[index])
            contactArray.remove(at: index)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        delAlert.addAction(deleteAction)
        delAlert.addAction(cancelAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(delAlert, animated: true)
        
    }
}


#Preview {
    ContentView()
}
