//
//  ContactListView.swift
//  ContactApp-SwiftUI
//
//  Created by Vijay Sharma on 16/10/24.
//

import SwiftUI

struct ContactListView: View {
    
    var contact: Contact
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(contact.firstName)
                .font(.headline)
            
            Text(contact.lastName)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
        }
        .padding()
        
    }
}

#Preview {
    ContactListView(contact: Contact.sampleData.first!)
}
