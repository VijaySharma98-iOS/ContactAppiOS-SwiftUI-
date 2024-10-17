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
    
    var contactArray: [Contact] = Contact.sampleData
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<contactArray.count,id: \.self) { index in
                    ContactListView(contact: contactArray[index])
                    
                }
            }
            .navigationTitle("Contacts")
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .tint(.black)
                }
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
