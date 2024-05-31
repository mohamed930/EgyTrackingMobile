//
//  AddAdminComponents.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 31/05/2024.
//

import SwiftUI

struct AddAdminComponents: View {
    @State private var selectedAdmin = "Current admin"
    let admins = ["Current admin", "Admin 1", "Admin 2", "Admin 3"] // Example admin names
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text("Admin")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text("*")
                        .font(.headline)
                        .foregroundColor(.red)
                }
                .padding(.bottom, 4)
                
                HStack {
                    Picker("Select Admin", selection: $selectedAdmin) {
                        ForEach(admins, id: \.self) { admin in
                            Text(admin)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
                    
                    Button(action: {
                        // Add action here
                    }) {
                        Text("Add")
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
            .listRowInsets(EdgeInsets()) // Remove default padding
            .listRowSeparator(.hidden)
        }
}

struct AddAdminComponents_Previews: PreviewProvider {
    static var previews: some View {
        AddAdminComponents()
    }
}
