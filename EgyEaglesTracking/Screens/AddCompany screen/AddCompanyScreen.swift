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
    
    @State var customerTypes = ["Normal","TSP"]
    @State var companyTypes = ["Individual","Establishment"]
    
    @StateObject var viewmodel = AddCompanyViewModel()
    
    @State var companyModel: CompanyModel?
    
    var body: some View {
        NavigationView {
            
            ZStack {
                VStack {
                    
                    NavigationComponets(text: "Add new company", action: {
                        presentationMode.wrappedValue.dismiss()
                    }, addAction: {})
                    
                    List {
                        
                        Group {
                            InputComponents(text: $name, labelText: "Company name",isNotRequired: false, errorBorder: $viewmodel.companyName)
                            
                            Text("Company name must be unique")
                                .font(.system(size: 12))
                                .fontWeight(.medium)
                                .padding([.top],-26)
                                .foregroundColor(.red)
                                .hide(if: !(viewmodel.companyName ?? false))
                            
                            InputComponents(text: $phone,labelText: "Phone number", isNotRequired: false,keyboardType: .asciiCapableNumberPad, errorBorder: $viewmodel.phoneNumber)
                            
                            
                            Text("Phone number must be unique")
                                .font(.system(size: 12))
                                .fontWeight(.medium)
                                .padding([.top],-26)
                                .foregroundColor(.red)
                                .hide(if: !(viewmodel.phoneNumber ?? false))
                            
                            
                            InputComponents(text: $extensionNumber,labelText: "Extension number",keyboardType: .asciiCapableNumberPad, errorBorder: $viewmodel.binding)
                            
                            InputComponents(text: $email,labelText: "Email address",isNotRequired: false, errorBorder: $viewmodel.binding)
                            
                            InputComponents(text: $identityNumber,labelText: "Identity number",isNotRequired: false,keyboardType: .asciiCapableNumberPad, errorBorder: $viewmodel.identity)
                            
                            Text("Identity must be unique")
                                .font(.system(size: 12))
                                .fontWeight(.medium)
                                .padding([.top],-26)
                                .foregroundColor(.red)
                                .hide(if: !(viewmodel.identity ?? false))
                            
                            PickerView(selectedIndex: $selectedType,
                                       labelTitle: "Company type",
                                       data: companyTypes ,isnotImportant: false)
                            
                            InputComponents(text: $dateOfBirth,labelText: "Date of birth",isNotRequired: false, errorBorder: $viewmodel.binding)
                            
                            PickerView(selectedIndex: $selectedPriority,
                                       labelTitle: "Priority",
                                       data: ["0","1","2","3","4","5","6","7","8","9","10"])
                            
                            PickerView(selectedIndex: $selectedConsuming,
                                       labelTitle: "Consuming",
                                       data: ["Norma","Fast"])
                            
                            InputComponents(text: $contractNumber,labelText: "Contract number",keyboardType: .asciiCapableNumberPad, errorBorder: $viewmodel.binding)
                        }
                        
                        Group {
                            InputComponents(text: $contractCompanyNumber,labelText: "Contract company number",keyboardType: .asciiCapableNumberPad, errorBorder: $viewmodel.binding)
                            
                            InputComponents(text: $name,labelText: "Contract End date", errorBorder: $viewmodel.binding)
                            
                            PickerView(selectedIndex: $selectedCustomerType,
                                       labelTitle: "Customer type",
                                       data: customerTypes,
                                       isnotImportant: false)
                            
                            PickerView(selectedIndex: $selectedTSPType,
                                       labelTitle: "TSP",
                                       data: viewmodel.data,
                                       isnotImportant: false)
                            .hide(if: selectedCustomerType == 0 ? false : true)
                            
                            InputComponents(text: $address,labelText: "Address", errorBorder: $viewmodel.binding)
                            
                            InputComponents(text: $comments,labelText: "Comments", errorBorder: $viewmodel.binding)
                            
                            AddAdminComponents()
                            
                            SendToWASLView()
                                .padding([.top],32)
                            
                            Button {
                                self.endTextEditing()
                                self.buildData()
                                
                                Task {
                                    await viewmodel.addCompanyData()
                                }
                                
                                
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
                    
                } // MARK: - ZStack
                .padding([.bottom],24)
                
                
                LoaderIndecatorComponets(isloading: $viewmodel.isloading)
                
                
            } // MARK: - ZStack
            
            
            
            
        }
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            DispatchQueue.main.async {
                viewmodel.fetchData()
            }
            
            renderDataForEditing()
            
        })
        .alert(isPresented: $viewmodel.error) {
            Alert(title: Text("Company adding error"), message: Text("Plase, try again"), dismissButton: .cancel(Text("Ok")))
        }
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
    
    func buildData() {
        
        let customerType = customerTypes[selectedCustomerType ?? 0] == "TSP" ? "Dealer" : "Normal"
        
        let model = CustomerModel(customerType: customerType,
                                  companyName: name,
                                  companyType: companyTypes[selectedType ?? 0],
                                  identityNumber: identityNumber,
                                  commercialRecordNumber: nil,
                                  commercialRecordIssueDateHijri: nil,
                                  dateOfBirth: dateOfBirth,
                                  isHigri: false,
                                  phoneNumber: phone,
                                  extensionNumber: nil,
                                  emailAddress: email,
                                  managerName: nil,
                                  managerPhoneNumber: nil,
                                  managerMobileNumber: nil,
                                  address: address,
                                  addToWasl: false,
                                  xapiKey: "",
                                  newAdmin: NewAdmin())
        
        viewmodel.companyData = model
    }
    
    func renderDataForEditing() {
        guard let model = companyModel else { return }
        
        name  = model.companyName
        phone = model.phoneNumber ?? ""
        email = model.emailAddress ?? ""
        identityNumber = model.identityNumber ?? ""
        selectedType = model.companyType == "Individual" ? 0 : 1
        dateOfBirth = model.dateOfBirth ?? ""
        selectedPriority = model.priority ?? 0
        contractNumber = model.contractNumber ?? ""
        contractCompanyNumber = model.customersContractNumber ?? ""
        selectedCustomerType = model.customerType == "Normal" ? 0 : 1
        address = model.address ?? ""
        comments = model.comments ?? ""
    }
}

struct AddCompanyScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddCompanyScreen()
    }
}
