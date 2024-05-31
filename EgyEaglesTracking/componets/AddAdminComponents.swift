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
            VStack(alignment: .leading,spacing: 10) {
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
                    
                    Picker("", selection: $selectedAdmin) {
                        ForEach(admins, id: \.self) { admin in
                            Text(admin)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(maxWidth: .infinity)
                    .padding([.leading,.trailing],16)
                    .clipShape(Capsule())
                    .overlay {
                        RoundedRectangle(cornerRadius: 23).stroke(Color("#B1B1B1"))
                    }
                    .font(.system(size: 14,weight: .medium))
                    .frame(height: 38)
                    .overlay {
                        HStack {
                            Text(selectedAdmin)
                                .font(.system(size: 14))
                                .fontWeight(.medium)
                            
                            Spacer()
                        }
                        .padding()
                    }
                    
                   
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
                .listRowInsets(EdgeInsets()) // Remove default padding
                .listRowSeparator(.hidden)
            }
            .padding()
            .listRowInsets(EdgeInsets()) // Remove default padding
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }
}

struct AddAdminComponents_Previews: PreviewProvider {
    static var previews: some View {
        AddAdminComponents()
    }
}
