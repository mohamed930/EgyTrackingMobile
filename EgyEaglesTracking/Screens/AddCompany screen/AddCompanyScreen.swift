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
    @State var phone: String = ""
    @State var extensionNumber: String = ""
    @State var email: String = ""
    @State var identityNumber: String = ""
    @State var contractNumber: String = ""
    @State var contractCompanyNumber: String = ""
    @State var address: String = ""
    @State var comments: String = ""
    @State var dateOfBirth: String = ""
    
    @State var selectedType: Int?
    @State var selectedPriority: Int?
    @State var selectedConsuming: Int?
    @State var selectedCustomerType: Int?
    @State var selectedTSPType: Int?
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                NavigationComponets(text: "Add new company", action: {
                    presentationMode.wrappedValue.dismiss()
                }, addAction: {})
                
                List {
                    
                    Group {
                        InputComponents(text: $name,labelText: "Company name", isNotRequired: false)
                        
                        InputComponents(text: $phone,labelText: "Phone number", isNotRequired: false,keyboardType: .asciiCapableNumberPad)
                        
                        InputComponents(text: $extensionNumber,labelText: "Extension number",keyboardType: .asciiCapableNumberPad)
                        
                        InputComponents(text: $email,labelText: "Email address",isNotRequired: false)
                        
                        InputComponents(text: $identityNumber,labelText: "Identity number",isNotRequired: false,keyboardType: .asciiCapableNumberPad)
                        
                        PickerView(selectedIndex: $selectedType,
                                   labelTitle: "Company type",
                                   data: ["Indevdual","Normal"],isnotImportant: false)
                        
                        InputComponents(text: $dateOfBirth,labelText: "Date of birth",isNotRequired: false)
                        
                        PickerView(selectedIndex: $selectedPriority,
                                   labelTitle: "Priority",
                                   data: ["0","1","2","3","4","5","6","7","8","9","10"])
                        
                        PickerView(selectedIndex: $selectedConsuming,
                                   labelTitle: "Consuming",
                                   data: ["Norma","Fast"])
                        
                        InputComponents(text: $contractNumber,labelText: "Contract number",keyboardType: .asciiCapableNumberPad)
                    }
                    
                    Group {
                        InputComponents(text: $contractCompanyNumber,labelText: "Contract company number",keyboardType: .asciiCapableNumberPad)
                        
                        InputComponents(text: $name,labelText: "Contract End date")
                        
                        PickerView(selectedIndex: $selectedCustomerType,
                                   labelTitle: "Customer type",
                                   data: ["Normal","TSP"],
                                   isnotImportant: false)
                        
                        PickerView(selectedIndex: $selectedTSPType,
                                   labelTitle: "TSP",
                                   data: ["Lamar"],
                                   isnotImportant: false)
                        .hide(if: selectedCustomerType == 0 ? false : true)
                        
                        InputComponents(text: $address,labelText: "Address")
                        
                        InputComponents(text: $comments,labelText: "Comments")
                        
                        AddAdminComponents()
                        
                        SendToWASLView()
                            .padding([.top],32)
                        
                        Button {
                            self.endTextEditing()
                            print("Hello Wordld!!")
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
                        .opacity(validationButton() ? 1 : 0.5)
                        .disabled(!validationButton())
                        .listRowBackground(Color.clear)
                    }
                    
                    
                        
                }
                .listStyle(PlainListStyle())
                
            }
            .padding([.bottom],24)
            
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    func validationButton() -> Bool {
        if !name.isEmpty && !phone.isEmpty && !email.isEmpty && !identityNumber.isEmpty && selectedCustomerType != nil && !dateOfBirth.isEmpty  {
            
            if selectedCustomerType == 0 && selectedTSPType != nil {
                return true
            }
            else if selectedCustomerType == 1 {
                
                return true
            }
            else {
                
                return false
            }
            
        }
        else {
            return false
        }
    }
}

struct AddCompanyScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddCompanyScreen()
    }
}
