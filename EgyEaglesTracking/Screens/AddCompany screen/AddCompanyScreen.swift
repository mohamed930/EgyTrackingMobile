//
//  AddCompanyScreen.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 31/05/2024.
//

import SwiftUI

struct AddCompanyScreen: View {
    
    // Access the presentation mode environment value
    @Environment(\.presentationMode) var presentationMode
    
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    var screenhight: CGFloat = UIScreen.main.bounds.height
    
    @State var name: String = ""
    @State var name1: String = ""
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                NavigationComponets(text: "Add new company", action: {
                    presentationMode.wrappedValue.dismiss()
                }, addAction: {})
                
                List {
                    
                    Group {
                        InputComponents(text: $name,labelText: "Company name", isNotRequired: false)
                        
                        InputComponents(text: $name,labelText: "Phone number", isNotRequired: false)
                        
                        InputComponents(text: $name,labelText: "Extension number")
                        
                        InputComponents(text: $name,labelText: "Email address",isNotRequired: false)
                        
                        InputComponents(text: $name,labelText: "Identity number",isNotRequired: false)
                        
                        InputComponents(text: $name,labelText: "Company type",isNotRequired: false,isNotChooceTextField: false)
                        
                        InputComponents(text: $name,labelText: "Date of birth",isNotRequired: false)
                        
                        InputComponents(text: $name,labelText: "Priority",isNotChooceTextField: false)
                        
                        InputComponents(text: $name,labelText: "Consuming",isNotChooceTextField: false)
                        
                        InputComponents(text: $name,labelText: "Contract number")
                    }
                    
                    Group {
                        InputComponents(text: $name,labelText: "Contract company number")
                        
                        InputComponents(text: $name,labelText: "Contract End date")
                        
                        InputComponents(text: $name,labelText: "Customer type",isNotRequired: false,isNotChooceTextField: false)
                        
                        InputComponents(text: $name,labelText: "Address")
                        
                        InputComponents(text: $name,labelText: "Comments")
                        
                        AddAdminComponents()
                        
                        SendToWASLView()
                            .padding([.top],32)
                        
                        Button {
                            self.endTextEditing()
                        } label: {
                            Text("Add")
                                .padding()
                                .frame(width: screenWidth - (37))
                        }
                        .frame(height: 46)
                        .background(Color("#239C6F"))
                        .foregroundColor(.white)
                        .font(.system(size: 16,weight: .medium))
                        .clipShape(Capsule())
                        .listRowSeparator(.hidden)
                        .padding([.top],32)
                            
                    }
                    
                    
                        
                }
                .listStyle(PlainListStyle())
                
            }
            .padding([.bottom],24)
            
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct AddCompanyScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddCompanyScreen()
    }
}
